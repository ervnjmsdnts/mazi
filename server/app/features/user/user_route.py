from fastapi import APIRouter, Depends

from app.core.dependencies.auth_dependency import authBearer

router = APIRouter(prefix="/user", tags=["user"], dependencies=[Depends(authBearer())])


@router.get("/")
async def getAllUsers():
    return {"message": "You are authenticated"}
