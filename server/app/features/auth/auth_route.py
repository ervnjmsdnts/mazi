from fastapi import APIRouter, HTTPException

from app.features.user.user_model import User
from app.core.db import usersCollection

from .auth_model import AuthLogin
from .auth_util import hashPassword

router = APIRouter(prefix="/auth", tags=["auth"])


@router.post("/register")
async def register(user: User):
    newUser = dict(user)

    userExist = await usersCollection.find_one({"email": newUser["email"]})

    if userExist:
        raise HTTPException(400, "User already exist with this email")

    newUser["password"] = hashPassword(user.password)

    await usersCollection.insert_one(newUser)
    return newUser


@router.post("/login")
async def login(user: AuthLogin):
    pass


@router.post("/logout")
async def logout():
    pass
