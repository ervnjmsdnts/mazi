from motor.motor_asyncio import AsyncIOMotorClient
from fastapi_users_db_mongodb import MongoDBUserDatabase

from app.features.user.user_models import UserDB

DATABASE_URL = "mongodb://localhost:27017"

client = AsyncIOMotorClient(DATABASE_URL, uuidRepresentation="standard")

db = client.mazi
user_collection = db.users
interest_collection = db.interests


async def getUserDb():
    yield MongoDBUserDatabase(UserDB, user_collection)
