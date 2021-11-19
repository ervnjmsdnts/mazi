import jwt
from fastapi import HTTPException
from datetime import datetime, timedelta
from passlib.context import CryptContext

from app.core.config import JWT_SECRET, JWT_ALGO, EMAIL_TOKEN
from app.core.db import usersCollection


pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


def token_response(token: str):
    return {"access_token": token}


def signJWT(username: str):
    payload = {"username": username, "exp": datetime.utcnow() + timedelta(days=7)}
    token = jwt.encode(payload, JWT_SECRET, algorithm=JWT_ALGO)

    return token_response(token)


def decodeJWT(token: str):
    try:
        payload = jwt.decode(token, JWT_SECRET, algorithms=JWT_ALGO)

        return payload["username"]
    except jwt.ExpiredSignatureError:
        raise HTTPException(400, "Token has expired")
    except jwt.InvalidTokenError:
        raise HTTPException(400, "Invalid token")


def hashPassword(inputPassword: str):
    return pwd_context.hash(inputPassword)


def verifyPassword(plainPassword, hashedPassword):
    return pwd_context.verify(plainPassword, hashedPassword)


async def verifyEmail(token: str):
    try:
        payload = jwt.decode(token, EMAIL_TOKEN, algorithms=JWT_ALGO)
        await usersCollection.update_one({"username": payload["username"]}, {"$set": {"confirmedEmail": True}})

        return True
    except:
        return False
