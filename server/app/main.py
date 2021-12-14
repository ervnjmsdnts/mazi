from fastapi import FastAPI, Header
from pydantic import BaseModel
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

from geopy.distance import distance

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


class WebSocketUser(BaseModel):
    email: str
    socket: WebSocket

    class Config:
        arbitrary_types_allowed = True


class BaseManager:
    def __init__(self):
        self.connections: list[WebSocketUser] = []

    async def connect(self, websocket: WebSocket, user_email):
        await websocket.accept()
        print(f"User with email: {user_email} has connected")
        self.connections.append(WebSocketUser(socket=websocket, email=user_email))

    async def disconnect(self, websocket: WebSocket, user_email):
        await websocket.close(code=1000)
        print(f"User with email: {user_email} has disconnected")
        self.connections.remove(WebSocketUser(socket=websocket, email=user_email))


class SearchManager(BaseManager):
    async def send_ping(self, to_user: str, from_user: str):
        user_socket = None
        for connection in self.connections:
            if connection.email == to_user:
                user_socket = connection.socket
        await user_socket.send_text(from_user)


# TODO conditional connection
class MatchManager(BaseManager):
    async def broadcast(self, data: str):
        for connection in self.connections:
            await connection.send_text(data)


search_manager = SearchManager()
match_manager = MatchManager()


async def getUserFromToken(token: str):
    schema, param = get_authorization_scheme_param(token)

    payload = jwt.decode_jwt(param, TOKEN_SECRET, audience=["fastapi-users:auth"])

    user = await user_collection.find_one({"id": UUID(payload["user_id"])}, {"_id": 0})

    return user


async def getOtherUsersLocationAndInterest(user_id):
    other_users_location = []
    other_users_interest = []
    async for user in user_collection.find({"id": {"$ne": user_id}}):
        other_users_location.append(user["location"])
        other_users_interest.append(user["interests"])

    return other_users_location, set(other_users_interest[0][0:])


async def getUsersFromLocation(location, user_id):
    users = []
    async for user in user_collection.find({"location": {"$eq": location, "$ne": user_id}}, {"_id": 0, "id": 0}):
        users.append(user)

    return users


def hasLocation(data):
    return "location" in data


@app.websocket("/ws/search")
async def searchEndpoint(websocket: WebSocket, authorization: str = Header(...)):
    user = await getUserFromToken(authorization)

    if user:
        await search_manager.connect(websocket, user_email=user["email"])

        while True:
            try:
                data = await websocket.receive_json()
                if hasLocation(data):
                    magnetic_location = distance(data["location"], (0, 0)).m
                    await user_collection.update_one({"id": user["id"]}, {"$set": {"location": magnetic_location}})

                    other_users_location, other_users_interest = await getOtherUsersLocationAndInterest(
                        user_id=user["id"]
                    )
                    current_user_interest = set(user["interests"])
                    has_common_interests = len(current_user_interest.intersection(other_users_interest)) >= 2
                    for location in other_users_location:
                        if location is not None:
                            meters = magnetic_location - location

                            if meters < 0:
                                meters *= -1
                            if meters > 250 and has_common_interests:
                                match_users = await getUsersFromLocation(location, user_id=user["id"])
                                await websocket.send_json(match_users)
                else:
                    if data["pingedUserEmail"] != user["email"]:
                        await search_manager.send_ping(from_user=user["email"], to_user=data["pingedUserEmail"])

            except WebSocketDisconnect:
                await user_collection.update_one({"id": user["id"]}, {"$set": {"location": None}})
                await search_manager.disconnect(websocket, user_email=user["email"])


@app.websocket("/ws/match/{room_id}")
async def matchEndpoint(websocket: WebSocket, room_id: str, authorization: str = Header(...)):
    user = getUserFromToken(authorization)

    if user:
        await match_manager.connect(websocket, user_email=user["email"])

        while True:
            try:
                pass
            except WebSocketDisconnect:
                match_manager.disconnect(websocket, user_email=user["email"])
