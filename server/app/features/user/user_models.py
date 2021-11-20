from enum import Enum
from typing import List, Optional
from fastapi_users import models
from pydantic import BaseModel


class Gender(str, Enum):
    MALE = "Male"
    FEMALE = "Female"


class Interest(BaseModel):
    name: str


class User(models.BaseUser):
    firstName: str
    lastName: str
    gender: Optional[Gender] = None
    avatar: Optional[str] = None
    interests: Optional[List[Interest]] = None


class UserCreate(models.BaseUserCreate):
    firstName: str
    lastName: str
    confirmationPassword: str
    pass


class UserUpdate(models.BaseUserUpdate):
    pass


class UserDB(User, models.BaseUserDB):
    pass
