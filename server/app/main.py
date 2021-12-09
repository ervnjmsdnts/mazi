from fastapi import FastAPI, Header
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security.utils import get_authorization_scheme_param
from fastapi_users import jwt
from uuid import UUID
from starlette.websockets import WebSocket, WebSocketDisconnect

from app.features.user import user_routes
from app.features.user.user_utils import fastapi_users, jwt_authentication

from app.core.config import TOKEN_SECRET
from app.core.db import user_collection

from app.features.interest import interest_routes

from geopy import distance
import json

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
    async for user in user_collection.find({"id": {"$ne": userId}}):
        usersLocation.append(user["location"])

    return usersLocation


async def getSpecificUsers(commonLocation):
    commonInterest = []
    async for user in user_collection.find({"location": {"$eq": commonLocation}}):
        commonInterest.append(user["interests"])

    return commonInterest


async def getUsersInfo(commonLocation):
    usersInfo = []
    async for user in user_collection.find({"location": {"$eq": commonLocation}}, {"_id": 0, "id": 0}):
        usersInfo.append(user)

    return usersInfo


# async def getUsersLike(commonLocation):
#    usersPing = []
#    usersEmail = []
#    async for user in user_collection.find({"location": {"$eq": commonLocation}}):
#        usersPing.append(user["like"])
#        usersEmail.append(user["email"])
#
#    return usersPing, usersEmail


@app.websocket("/ws")
async def websocket_search(websocket: WebSocket, authorization: str = Header(...)):
    schema, param = get_authorization_scheme_param(authorization)

    payload = jwt.decode_jwt(param, TOKEN_SECRET, audience=["fastapi-users:auth"])

    user = await user_collection.find_one({"id": UUID(payload["user_id"])})

    if user:
        await websocket.accept()

        while True:
            coordinates = await websocket.receive_json()
            currentLocation = coordinates["location"]
            print(currentLocation)
            magneticLocation = distance.distance(currentLocation, coords_2).m
            await user_collection.update_one(
                {"id": UUID(payload["user_id"])}, {"$set": {"location": magneticLocation}}
            )

            await getOtherUsers(userId=UUID(payload["user_id"]))

            otherLocations = await getOtherUsers(userId=UUID(payload["user_id"]))

            for location in otherLocations:
                meters = magneticLocation - location

                if meters < 0:
                    meters *= -1
                if meters <= 250:
                    print("found")
                    await getSpecificUsers(commonLocation=(location))
                    otherInterests = await getSpecificUsers(commonLocation=(location))
                    userInterests = set(user["interests"])
                    otherInterests_list = otherInterests[0][0:]
                    list1_set = set(otherInterests_list)
                    test = userInterests.intersection(list1_set)
                    isNotEmpty = len(test) >= 2
                    if isNotEmpty:
                        await getUsersInfo(commonLocation=(location))
                        otherUsersInfo = await getUsersInfo(commonLocation=(location))
                        await websocket.send_json(otherUsersInfo)
                else:
                    print("No user found")

    else:
        await websocket.close()
        print("Websocket closed")


class ConnectionManager:
    def __init__(self):
        self.connections: list[WebSocket] = []

    async def connect(self, websocket: WebSocket):
        await websocket.accept()
        self.connections.append(websocket)

    async def broadcast(self, data: str):
        for connection in self.connections:
            await connection.send_text(data)

    async def disconnect(self, websocket: WebSocket):
        self.connections.remove(websocket)


manager = ConnectionManager()


@app.websocket("/ws/match")
async def websocket_ping(websocket: WebSocket, authorization: str = Header(...)):
    schema, param = get_authorization_scheme_param(authorization)

    payload = jwt.decode_jwt(param, TOKEN_SECRET, audience=["fastapi-users:auth"])

    user = await user_collection.find_one({"id": UUID(payload["user_id"])})
    userEmail = user["email"]

    if user:
        await manager.connect(websocket)

        while True:
            try:
                pingedUserEmail = await websocket.receive_text()
                print(pingedUserEmail)
                await manager.broadcast(f"{userEmail}, you have been pinged by {pingedUserEmail}")
            except WebSocketDisconnect:
                manager.disconnect(websocket)
