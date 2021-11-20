from typing import List
from fastapi import APIRouter, Depends
import jwt

from app.core.config import VERIFY_TOKEN_SECRET
from app.core.db import user_collection

from .user_models import Interest, User, UserUpdate
from .user_utils import current_user


auth_router = APIRouter(prefix="/auth", tags=["auth"])
user_router = APIRouter(prefix="/user", tags=["user"])


async def verifyEmail(token: str):
    try:
        payload = jwt.decode(token, VERIFY_TOKEN_SECRET, algorithms="HS256")
        await user_collection.update_one({"email": payload["email"]}, {"$set": {"is_verified": True}})

        return True

    except:
        return False


@auth_router.get("/confirmation/{id}")
async def confirmation(id: str):
    result = await verifyEmail(id)

    if result:
        return {"message": "Email is confirmed"}

    return {"message": "Email not confirmed"}


@user_router.post("/interest")
async def createInterest(interest: Interest, user: UserUpdate = Depends(current_user)):
    interest_data = dict(interest)
    await user_collection.update_one({"id": user.id}, {"$set": interest_data})

    return {"message": f"{user.firstName} interests created"}


@user_router.get("/interest")
async def getInterest(user: User = Depends(current_user)):
    user_interest = await user_collection.find_one({"id": user.id}, {"_id": 0})

    return user_interest
