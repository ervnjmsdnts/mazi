import time
import jwt
from passlib.context import CryptContext

from app.core.config import JWT_SECRET, JWT_ALGO


pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


def token_response(token: str):
    return {"access_token": token}


def signJWT(userId: str):
    payload = {"userId": userId, "expire": time.time() + 600}
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
