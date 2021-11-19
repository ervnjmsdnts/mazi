from fastapi import APIRouter, HTTPException
import jwt

from app.core.config import VERIFY_TOKEN_SECRET
from app.core.db import userCollection


router = APIRouter(prefix="/auth", tags=["auth"])


async def verifyEmail(token: str):
    try:
        payload = jwt.decode(token, VERIFY_TOKEN_SECRET, algorithms="HS256")
        await userCollection.update_one({"email": payload["email"]}, {"$set": {"is_verified": True}})

        return True

    except:
        return False


@router.get("/confirmation/{id}")
async def confirmation(id: str):
    result = await verifyEmail(id)

    if result:
        return {"message": "Email is confirmed"}

    return {"message": "Email not confirmed"}
