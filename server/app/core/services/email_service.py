from pathlib import Path
from fastapi_mail import FastMail, MessageSchema, ConnectionConfig

from app.core.config import MAIL_FROM, MAIL_FROM_NAME, MAIL_PASSWORD, MAIL_PORT, MAIL_SERVER, MAIL_USERNAME

conf = ConnectionConfig(
    MAIL_USERNAME=MAIL_USERNAME,
    MAIL_PASSWORD=MAIL_PASSWORD,
    MAIL_FROM=MAIL_FROM,
    MAIL_PORT=MAIL_PORT,
    MAIL_SERVER=MAIL_SERVER,
    MAIL_FROM_NAME=MAIL_FROM_NAME,
    MAIL_TLS=True,
    MAIL_SSL=False,
    USE_CREDENTIALS=True,
)


async def sendEmail(subject: str, email_to: str, token: str):
    template = f"""
    <!DOCTYPE html>
    <html>
        <head>
        </head>
        <body>
            <div style="display: flex; align-items: center; justify-content: center; flex-direction:column">
                <h3>Email Confirmation</h3>
                <br>
                <a style="margin-top: 1rem; padding: 1rem; border-radius: 0.5rem; font-size: 1rem; text-decoration: none;
                background: #0275D8; color: white;" href="http://localhost:8000/auth/confirmation/{token}">Verify Your Email</a>
                <br>
                <p>Please kindly ignore this email if you did not register for Mazi</p>
            </div>
        </body>
    </html>
    """

    message = MessageSchema(subject=subject, recipients=[email_to], body=template, subtype="html")

    fm = FastMail(conf)

    await fm.send_message(message)
