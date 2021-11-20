from fastapi import APIRouter, HTTPException

from app.core.db import interest_collection

from .interest_models import Interest, InterestUpdate

router = APIRouter(prefix="/interest", tags=["interest"])


@router.post("")
async def createInterest(interest: Interest):
    interest_data = dict(interest)

    categoryExist = await interest_collection.find_one({"category": interest_data["category"]})

    if categoryExist:
        raise HTTPException(400, "Category already exist. Try to update it if you want to add more items")

    await interest_collection.insert_one(interest_data)

    return {"message": "Interest created"}


@router.put("/{category}")
async def addInterest(category: str, interest: InterestUpdate):
    interest_data = dict(interest)
    categoryExist = await interest_collection.find_one({"category": category})

    if categoryExist:
        updated_interest = await interest_collection.update_one(
            {"category": category}, {"$push": {"interests": interest_data["interests"]}}
        )

        if updated_interest:
            return True

        return False

    return {"message": "Interest Updated"}


@router.delete("/{category}")
async def removeInterest(category: str, interest: InterestUpdate):
    interest_data = dict(interest)

    categoryExist = await interest_collection.find_one({"category": category})

    if categoryExist:
        interest_exist = await interest_collection.find_one({"interests": {"$in": [interest_data["interests"]]}})

        if interest_exist:
            await interest_collection.update_one(
                {"category": category}, {"$pull": {"interests": interest_data["interests"]}}
            )

            return {"message": f"Interest in {category} category has been removed"}

        return {"message": "Cannot find interest"}
