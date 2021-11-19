from fastapi import FastAPI
from fastapi_users.fastapi_users import FastAPIUsers
from fastapi_users.authentication.jwt import JWTAuthentication

from app.core.config import TOKEN_SECRET
from app.features.user.user_utils import get_user_manager
from app.features.user.user_models import *
from app.features.user import user_routes


jwtAuthentication = JWTAuthentication(TOKEN_SECRET, lifetime_seconds=604800, tokenUrl="auth/jwt/login")

fastapiUsers = FastAPIUsers(get_user_manager, [jwtAuthentication], User, UserCreate, UserUpdate, UserDB)

app = FastAPI()

app.include_router(
    fastapiUsers.get_auth_router(jwtAuthentication, requires_verification=True), prefix="/auth/jwt", tags=["auth"]
)
app.include_router(fastapiUsers.get_register_router(), prefix="/auth", tags=["auth"])
app.include_router(user_routes.router)