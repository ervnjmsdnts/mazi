from fastapi import FastAPI

from app.features.auth import auth_route
from app.features.user import user_route

app = FastAPI()


app.include_router(auth_route.router)
app.include_router(user_route.router)
