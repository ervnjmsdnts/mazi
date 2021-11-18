from pydantic import BaseModel
from pydantic.fields import Field
from pydantic.networks import EmailStr


class AuthRegister(BaseModel):
    firstName: str = Field(...)
    lastName: str = Field(...)
    email: EmailStr = Field(...)
    password: str = Field(...)
    confirmPassword: str = Field(...)


class AuthLogin(BaseModel):
    email: EmailStr = Field(...)
    password: str = Field(...)
