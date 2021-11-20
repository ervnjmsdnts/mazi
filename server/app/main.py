from fastapi import FastAPI, Depends

from app.features.user import user_routes
from app.features.user.user_utils import fastapi_users, jwt_authentication

from app.features.interest import interest_routes


app = FastAPI()

app.include_router(
    fastapi_users.get_auth_router(jwt_authentication, requires_verification=True), prefix="/auth/jwt", tags=["auth"]
)
app.include_router(fastapi_users.get_register_router(), prefix="/auth", tags=["auth"])
app.include_router(user_routes.auth_router)
app.include_router(user_routes.user_router)
app.include_router(interest_routes.router)
