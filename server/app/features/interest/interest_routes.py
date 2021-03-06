from typing import List
from fastapi import APIRouter, HTTPException
from fastapi.param_functions import Header

from app.core.db import interest_collection

from .interest_models import Interest, InterestObject, InterestUpdate

router = APIRouter(prefix="/interest", tags=["interest"])


def interestHelper(interest) -> dict:
    return {"id": str(interest["_id"]), "category": interest["category"], "interests": interest["interests"]}


@router.get("")
async def getInterest():
    interests = []
    async for interest in interest_collection.find():
        interests.append(interestHelper(interest))

    return interests


@router.post("")
async def createInterest(interest: Interest):
    interest_data = dict(interest)

    categoryExist = await interest_collection.find_one({"category": interest_data["category"]})

    if categoryExist:
        raise HTTPException(400, "Category already exist. Try to update it if you want to add more items")

    await interest_collection.insert_one(interest.dict())

    return interest


@router.put("/{category}")
async def addInterest(category: str, interest: InterestUpdate):
    categoryExist = await interest_collection.find_one({"category": category})

    if not categoryExist:
        return {"message": "Can't find category"}

    updated_interest = await interest_collection.update_one({"category": category}, {"$push": interest.dict()})

    if updated_interest:
        return {"message": "Interest Updated"}

    return {"message": "Something went wrong interest can't be updated"}


@router.delete("/{category}")
async def removeInterest(category: str, interest: InterestUpdate):
    interest_data = dict(interest)

    categoryExist = await interest_collection.find_one({"category": category})

    if not categoryExist:
        return {"message": "Can't find category"}

    interest_exist = await interest_collection.find_one({"interests": {"$in": [interest_data["interests"]]}})

    if interest_exist:
        await interest_collection.update_one(
            {"category": category}, {"$pull": {"interests": interest_data["interests"]}}
        )

        return {"message": f"Interest in {category} category has been removed"}

    return {"message": "Cannot find interest"}
