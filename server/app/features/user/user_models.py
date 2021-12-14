from enum import Enum
from typing import List, Optional
from fastapi_users import models
from pydantic import BaseModel


class Gender(str, Enum):
    MALE = "Male"
    FEMALE = "Female"


class Interest(BaseModel):
    interests: List[str]


class User(models.BaseUser):
    firstName: str
    lastName: str
    interests: List[str] = []
    location: Optional[float] = None


class UserCreate(models.BaseUserCreate):
    firstName: str
    lastName: str
    confirmationPassword: str


class UserUpdate(models.BaseUserUpdate):
    interests: Optional[List[str]]
    location: Optional[float] = None


class UserDB(User, models.BaseUserDB):
    pass


class Room(BaseModel):
    users: Optional[List[User]] = []
    distance: Optional[str] = None
