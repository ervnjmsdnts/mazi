from fastapi import FastAPI, Depends

from app.features.user import user_routes
from app.features.user.user_models import User
from app.features.user.user_utils import fastapi_users, jwt_authentication, current_user


app = FastAPI()

app.include_router(
    fastapi_users.get_auth_router(jwt_authentication, requires_verification=True), prefix="/auth/jwt", tags=["auth"]
)
app.include_router(fastapi_users.get_register_router(), prefix="/auth", tags=["auth"])
app.include_router(user_routes.router)


@app.get("/hello")
def hello(user: User = Depends(current_user)):
    return {"email": user.email}
