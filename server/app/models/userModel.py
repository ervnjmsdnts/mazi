from enum import Enum
from typing import List, Optional
from odmantic import Model
from pydantic.networks import EmailStr

from app.models.preferencesModel import Preference


class Gender(str, Enum):
    MALE = "male"
    FEMALE = "female"


class User(Model):
    firstName: str
    lastName: str
    email: EmailStr
    # TODO Make sure to hash the password
    password: str
    phoneNumber: str
    gender: Gender
    # TODO Make profilePhoto a file type
    profilePhoto: Optional[str] = None
    preferences: Optional[List[Preference]] = None
    confirmedEmail: bool = False
    confirmedOTP: bool = False
