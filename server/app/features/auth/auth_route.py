from fastapi import APIRouter, HTTPException

from app.features.user.user_model import User
from app.core.db import usersCollection

from .auth_model import AuthLogin
from .auth_util import hashPassword, verifyEmail
from .emailConfirmation.send_email import sendEmail

router = APIRouter(prefix="/auth", tags=["auth"])


@router.post("/register")
async def register(user: User):
    newUser = dict(user)

    userExist = await usersCollection.find_one({"email": newUser["email"]})

    if userExist:
        raise HTTPException(400, "User already exist with this email")

    newUser["password"] = hashPassword(user.password)

    await usersCollection.insert_one(newUser)

    await sendEmail("Email Confirmation", newUser["email"], newUser["username"])

    return {"message": "User has been created"}


@router.post("/login")
async def login(user: AuthLogin):
    pass


@router.post("/logout")
async def logout():
    pass


@router.get("/confirmation/{id}")
async def confirmation(id):
    result = await verifyEmail(id)

    if result:
        return {"message": "user email confirmed"}

    return {"message": "user email not confirmed"}
