from fastapi import FastAPI

from app.features.auth import auth_route

app = FastAPI()


app.include_router(auth_route.router)
