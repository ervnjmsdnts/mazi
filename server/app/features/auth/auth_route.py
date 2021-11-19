from fastapi import APIRouter, HTTPException, Body

from app.features.user.user_model import User
from app.core.db import usersCollection

from .auth_model import AuthLogin
from .auth_util import hashPassword, signJWT, verifyEmail, verifyPassword
from .emailConfirmation.send_email import sendEmail

router = APIRouter(prefix="/auth", tags=["auth"])


@router.post("/register")
async def register(user: User, confirmPassword: str = Body(...)):
    newUser = dict(user)

    userExist = await usersCollection.find_one({"email": newUser["email"]})

    if userExist:
        raise HTTPException(400, "User already exist with this email")

    if newUser["password"] != confirmPassword:
        raise HTTPException(400, "Password do not match")

    newUser["password"] = hashPassword(user.password)

    await usersCollection.insert_one(newUser)

    await sendEmail("Email Confirmation", newUser["email"], newUser["username"])

    return {"message": "User has been created"}


@router.post("/login")
async def login(user: AuthLogin):
    authUser = dict(user)

    dbUser = await usersCollection.find_one({"email": authUser["email"]})

    if not dbUser:
        raise HTTPException(404, "User not found")

    if dbUser["confirmedEmail"] == False:
        raise HTTPException(401, "Email is not verified yet")

    isVerifiedPassword = verifyPassword(authUser["password"], dbUser["password"])

    if not isVerifiedPassword:
        raise HTTPException(401, "Password is wrong")

    token = signJWT(dbUser["username"])

    return token


@router.get("/confirmation/{id}")
async def confirmation(id):
    result = await verifyEmail(id)

    if result:
        return {"message": "user email confirmed"}

    return {"message": "user email not confirmed"}
