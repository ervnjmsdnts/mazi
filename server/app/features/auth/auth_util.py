import time
import jwt
from passlib.context import CryptContext

from app.core.config import JWT_SECRET, JWT_ALGO, EMAIL_TOKEN
from app.core.db import usersCollection


pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


def token_response(token: str):
    return {"access_token": token}


def signJWT(username: str):
    payload = {"username": username, "expire": time.time() + 600}
    token = jwt.encode(payload, JWT_SECRET, algorithm=JWT_ALGO)

    return token_response(token)


def decodeJWT(token: str):
    try:
        token = jwt.decode(token, JWT_SECRET, algorithms=JWT_ALGO)

        return token if token["expire"] >= time.time() else None
    except:
        return "Token Error"


def hashPassword(inputPassword: str):
    return pwd_context.hash(inputPassword)


def verifyPassword(hashedPassword, plainPassword):
    return pwd_context.verify(plainPassword, hashedPassword)


async def verifyEmail(token: str):
    try:
        payload = jwt.decode(token, EMAIL_TOKEN, algorithms=JWT_ALGO)
        await usersCollection.update_one({"username": payload["username"]}, {"$set": {"confirmedEmail": True}})

        return True
    except:
        return False
