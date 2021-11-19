from enum import Enum
from typing import Optional
from fastapi_users import models


class Gender(str, Enum):
    MALE = "Male"
    FEMALE = "Female"


class User(models.BaseUser):
    firstName: str
    lastName: str
    gender: Optional[Gender] = None
    avatar: Optional[str] = None


class UserCreate(models.BaseUserCreate):
    firstName: str
    lastName: str
    pass


class UserUpdate(models.BaseUserUpdate):
    pass


class UserDB(User, models.BaseUserDB):
    pass
