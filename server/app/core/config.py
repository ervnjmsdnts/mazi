from decouple import config

JWT_SECRET = config("JWT_SECRET")
JWT_ALGO = config("JWT_HASH")
