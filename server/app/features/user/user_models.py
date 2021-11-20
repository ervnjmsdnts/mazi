from enum import Enum
from typing import List, Optional
from fastapi_users import models
from pydantic import BaseModel


class Gender(str, Enum):
    MALE = "Male"
    FEMALE = "Female"


class GenderCreate(BaseModel):
    gender = Gender


class Interest(BaseModel):
    interests: List[str]


class User(models.BaseUser):
    firstName: str
    lastName: str


class UserCreate(models.BaseUserCreate):
    firstName: str
    lastName: str
    confirmationPassword: str


class UserUpdate(models.BaseUserUpdate):
    interests: Optional[str]
    gender: Optional[Gender]
    avatar: Optional[str]


class UserDB(User, models.BaseUserDB):
    pass
