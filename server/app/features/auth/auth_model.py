from pydantic import BaseModel
from pydantic.fields import Field
from pydantic.networks import EmailStr
from app.features.user.user_model import User


class AuthLogin(BaseModel):
    email: EmailStr = Field(...)
    password: str = Field(...)
