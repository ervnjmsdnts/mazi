from enum import Enum
from typing import Optional
from pydantic import BaseModel
from pydantic.fields import Field


class Gender(str, Enum):
    MALE = "Male"
    FEMALE = "Female"


class User(BaseModel):
    firstName: str = Field(...)
    lastName: str = Field(...)
    username: str = Field(...)
    email: str = Field(...)
    password: str = Field(...)
    gender: Optional[Gender] = None
    avatar: Optional[str] = None
    confirmedEmail: bool = False
