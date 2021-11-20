from typing import Optional, Union
from fastapi import Depends, Request, APIRouter
from fastapi_users.manager import BaseUserManager, InvalidPasswordException
import jwt

from app.core.db import getUserDb
from app.core.config import VERIFY_TOKEN_SECRET
from app.core.services.email_service import sendEmail

from .user_models import UserCreate, UserDB

router = APIRouter()


class UserManager(BaseUserManager[UserCreate, UserDB]):
    user_db_model = UserDB
    verification_token_secret = VERIFY_TOKEN_SECRET

    async def validate_password(self, password: str, user: Union[UserCreate, UserDB]) -> None:
        if password != user.confirmationPassword:
            raise InvalidPasswordException(reason="Passwords don't match")

    async def on_after_register(self, user: UserDB, request: Optional[Request] = None):
        payload = {"email": user.email}
        token = jwt.encode(payload, self.verification_token_secret)
        await sendEmail("Email Confirmation", user.email, token)


async def get_user_manager(user_db=Depends(getUserDb)):
    yield UserManager(user_db)
