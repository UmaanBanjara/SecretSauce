from fastapi_mail import FastMail, MessageSchema, ConnectionConfig
from typing import List
from pydantic import EmailStr
import os
from dotenv import load_dotenv

load_dotenv()

conf = ConnectionConfig(
    MAIL_USERNAME=os.getenv("MAIL_USERNAME"),
    MAIL_PASSWORD=os.getenv("MAIL_PASSWORD"),
    MAIL_FROM=os.getenv("MAIL_USERNAME"),
    MAIL_PORT=587,
    MAIL_SERVER="smtp.gmail.com",
    MAIL_STARTTLS=True,       
    MAIL_SSL_TLS=False,        
    USE_CREDENTIALS=True,
    VALIDATE_CERTS=True
)

async def send_mail(subject: str, recipients: List[EmailStr], body: str):
    message = MessageSchema(
        subject=subject,
        recipients=recipients,
        body=body,
        subtype="html"
    )
    fm = FastMail(conf)
    await fm.send_message(message)
