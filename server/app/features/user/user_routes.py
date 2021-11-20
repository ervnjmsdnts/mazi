from fastapi import APIRouter
import jwt

from app.core.config import VERIFY_TOKEN_SECRET
from app.core.db import user_collection


router = APIRouter()


async def verifyEmail(token: str):
    try:
        payload = jwt.decode(token, VERIFY_TOKEN_SECRET, algorithms="HS256")
        await user_collection.update_one({"email": payload["email"]}, {"$set": {"is_verified": True}})

        return True

    except:
        return False


@router.get("/auth/confirmation/{id}", tags=["auth"])
async def confirmation(id: str):
    result = await verifyEmail(id)

    if result:
        return {"message": "Email is confirmed"}

    return {"message": "Email not confirmed"}
