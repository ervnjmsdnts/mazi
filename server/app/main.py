from fastapi import FastAPI, Depends
from fastapi_users.fastapi_users import FastAPIUsers
from fastapi_users.authentication.jwt import JWTAuthentication

from app.core.config import TOKEN_SECRET
from app.features.user.user_utils import get_user_manager
from app.features.user.user_models import *
from app.features.user import user_routes


jwt_authentication = JWTAuthentication(TOKEN_SECRET, lifetime_seconds=604800, tokenUrl="auth/jwt/login")

fastapi_users = FastAPIUsers(get_user_manager, [jwt_authentication], User, UserCreate, UserUpdate, UserDB)

current_user = fastapi_users.current_user(active=True, verified=True)

app = FastAPI()

app.include_router(
    fastapi_users.get_auth_router(jwt_authentication, requires_verification=True), prefix="/auth/jwt", tags=["auth"]
)
app.include_router(fastapi_users.get_register_router(), prefix="/auth", tags=["auth"])
app.include_router(user_routes.router)


@app.get("/hello")
def hello(user: User = Depends(current_user)):
    return {"email": user.email}
