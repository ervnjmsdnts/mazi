from fastapi import Request, HTTPException
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

from app.features.auth.auth_util import decodeJWT


class authBearer(HTTPBearer):
    def __init__(self, autoError: bool = True):
        super(authBearer, self).__init__(auto_error=autoError)

    async def __call__(self, request: Request):
        credentials: HTTPAuthorizationCredentials = await super(authBearer, self).__call__(request)

        if credentials:
            if not credentials.scheme == "Bearer":
                raise HTTPException(403, "Invalid or Expired Token")
            return credentials.credentials
        else:
            raise HTTPException(403, "Invalid or Expired Token")

    def verifyUser(self, token: str):
        isUserValid: bool = False
        payload = decodeJWT(token)

        if payload:
            isUserValid = True

        return isUserValid
