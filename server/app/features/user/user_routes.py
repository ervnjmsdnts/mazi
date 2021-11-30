from fastapi import APIRouter, Depends, Body
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


@user_router.get("/")
async def getUser(user: User = Depends(current_user)):
    current_user = await user_collection.find_one({"id": user.id}, {"_id": 0})

    return current_user


@auth_router.get("/confirmation/{id}")
async def confirmation(id: str):
    result = await verifyEmail(id)

    if result:
        return {"message": "Email is confirmed"}

    return {"message": "Email not confirmed"}


@user_router.put("/interest")
async def createInterest(interests: Interest, user: UserUpdate = Depends(current_user)):
    try:
        interest_data = dict(interests)
        await user_collection.update_one({"id": user.id}, {"$set": interest_data})

        return True
    except:
        return False


# @user_router.put("/gender")
# async def setGender(gender: Gender = Body(..., embed="gender"), user: UserUpdate = Depends(current_user)):
#     await user_collection.update_one({"id": user.id}, {"$set": {"gender": gender.value}})

#     return {"message": f"{user.firstName}'s gender has been updated"}
