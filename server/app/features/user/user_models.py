from enum import Enum
from typing import List, Optional
from fastapi_users import models


class Gender(str, Enum):
    MALE = "Male"
    FEMALE = "Female"


class User(models.BaseUser):
    firstName: str
    lastName: str
    gender: Optional[Gender] = None
    avatar: Optional[str] = None
    interest: Optional[List[str]] = None


class UserCreate(models.BaseUserCreate):
    firstName: str
    lastName: str
    confirmationPassword: str


class UserUpdate(models.BaseUserUpdate):
    pass


class UserDB(User, models.BaseUserDB):
    pass
