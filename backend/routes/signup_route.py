from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, EmailStr
from crud.signup import create_user
from crud.saveotp import save_otp
from utils.smtp import send_mail

router = APIRouter()

class UserCreate(BaseModel):
    email: EmailStr
    fname: str
    lname: str
    username: str
    passwd: str

@router.post("/signup")
async def signup(user: UserCreate):
    try:
        # Create the new user
        new_user = await create_user(
            email=user.email,
            fname=user.fname,
            lname=user.lname,
            username=user.username,
            passwd=user.passwd
        )

        # Save OTP for email verification
        new_otp = await save_otp(
            purpose="Email Verification",
            user_id=new_user.id,
            is_used=False
        )

        # Construct a nice HTML email body
        body = f"""
        <html>
          <body>
            <h2>Email Verification</h2>
            <p>Hi {user.fname},</p>
            <p>Thank you for Secret Sauce! Use the following OTP:</p>
            <h3 style="color: blue;">{new_otp.otp_code}</h3>
            <p>This OTP will expire in 5 minutes.</p>
            <p>If you didn't request this, please ignore this email.</p>
            <br>
            <p>Cheers,<br>Umaan From Secret Sauce</p>
          </body>
        </html>
        """

        # Send the OTP email
        await send_mail(
            recipients=[user.email],
            subject=new_otp.purpose,
            body=body
        )

        # Return success response
        return {
            "message": "User created successfully. Check your email for the OTP.",
            "user_id": new_user.id,
        }

    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Something went wrong: {str(e)}")
