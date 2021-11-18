from fastapi import APIRouter, HTTPException

from app.features.user.user_model import User
from app.config.db import usersCollection

from .auth_util import hashPassword
from .auth_model import AuthRegister

router = APIRouter(prefix="/auth", tags=["auth"])


@router.post("/register", response_model=User)
async def register(user: AuthRegister):
    newUser = dict(user)

    userExist = await usersCollection.find_one({"email": newUser["email"]})

    if userExist:
        raise HTTPException(400, "User already exist with this email")

    if newUser["password"] != newUser["confirmPassword"]:
        raise HTTPException(400, "Passwords do not match")

    newUser["password"] = hashPassword(user.password)

    await usersCollection.insert_one(newUser)
    return newUser


@router.post("/login")
async def login():
    pass


@router.post("/logout")
async def logout():
    pass
