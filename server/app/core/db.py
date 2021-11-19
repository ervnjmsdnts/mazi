from motor.motor_asyncio import AsyncIOMotorClient
from fastapi_users_db_mongodb import MongoDBUserDatabase

from app.features.user.user_models import UserDB

DATABASE_URL = "mongodb://localhost:27017"

client = AsyncIOMotorClient(DATABASE_URL, uuidRepresentation="standard")

db = client.mazi
userCollection = db.users


async def getUserDb():
    yield MongoDBUserDatabase(UserDB, userCollection)
