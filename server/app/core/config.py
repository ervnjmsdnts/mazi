from decouple import config

TOKEN_SECRET = config("TOKEN_SECRET")
VERIFY_TOKEN_SECRET = config("VERIFY_TOKEN_SECRET")

MAIL_USERNAME = config("MAIL_USERNAME")
MAIL_PASSWORD = config("MAIL_PASSWORD")
MAIL_FROM = config("MAIL_FROM")
MAIL_PORT = config("MAIL_PORT")
MAIL_SERVER = config("MAIL_SERVER")
MAIL_FROM_NAME = config("MAIL_FROM_NAME")
