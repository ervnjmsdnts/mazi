from fastapi import FastAPI, Header
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security.utils import get_authorization_scheme_param
from fastapi_users import jwt
from uuid import UUID
from geopy.units import meters
from starlette.websockets import WebSocket

from app.features.user import user_routes
from app.features.user.user_utils import fastapi_users, jwt_authentication

from app.core.config import TOKEN_SECRET
from app.core.db import user_collection

from app.features.interest import interest_routes

from geopy import distance

app = FastAPI()

origins = ["http://localhost:3000", "http://localhost:8000"]

app.add_middleware(
    CORSMiddleware, allow_origins=origins, allow_credentials=True, allow_methods=["*"], allow_headers=["*"]
)

app.include_router(
    fastapi_users.get_auth_router(jwt_authentication, requires_verification=True), prefix="/auth/jwt", tags=["auth"]
)
app.include_router(fastapi_users.get_register_router(), prefix="/auth", tags=["auth"])
app.include_router(user_routes.auth_router)
app.include_router(user_routes.user_router)
app.include_router(interest_routes.router)


coords_2 = (0, 0)


async def getOtherUsers(userId: UUID):
    usersLocation = []
    usersInterest = []
    async for user in user_collection.find({"id": {"$ne": userId}}):
        usersLocation.append(user["location"])
        usersInterest.append(user["interests"])

    return usersLocation, usersInterest


@app.websocket("/ws")
async def websocketEndpoint(websocket: WebSocket, authorization: str = Header(...)):
    schema, param = get_authorization_scheme_param(authorization)

    payload = jwt.decode_jwt(param, TOKEN_SECRET, audience=["fastapi-users:auth"])

    user = await user_collection.find_one({"id": UUID(payload["user_id"])})

    if user:
        await websocket.accept()

        while True:
            coordinates = await websocket.receive_json()
            currentLocation = coordinates["location"]
            magneticLocation = distance.distance(currentLocation, coords_2).m
            await user_collection.update_one(
                {"id": UUID(payload["user_id"])}, {"$set": {"location": magneticLocation}}
            )

            await getOtherUsers(userId=UUID(payload["user_id"]))

            otherLocations, otherInterests = await getOtherUsers(userId=UUID(payload["user_id"]))

            print(otherInterests)

            # for location in otherLocations:
            #     meters = magneticLocation - location

            #     if meters < 0:
            #         meters *= -1
            #     if meters < 250:
            #         print(f"You are within 250 meters. User with: {location}")

    else:
        await websocket.close()
        print("Websocket closed")
