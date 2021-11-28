from typing import List, Optional
from pydantic import BaseModel


class InterestObject(BaseModel):
    name: str
    isSelected: Optional[bool] = False


class Interest(BaseModel):
    category: str
    interests: List[InterestObject] = None


class InterestUpdate(BaseModel):
    interests: Optional[InterestObject]
