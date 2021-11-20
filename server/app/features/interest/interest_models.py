from typing import List, Optional
from pydantic import BaseModel


class Interest(BaseModel):
    category: str
    interests: List[str]


class InterestUpdate(BaseModel):
    interests: Optional[str]
