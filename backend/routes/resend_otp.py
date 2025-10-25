from fastapi import APIRouter , HTTPException
from crud.saveotp import save_otp
from utils.otpgenerator import otp_generator
from utils.smtp import send_mail
from pydantic import BaseModel, EmailStr

router = APIRouter()

class resendOTP(BaseModel):
    email : EmailStr
    userId : int
    fname : str

@router.post("/resend")

async def resendOTP(check : resendOTP):
    try:
        new_otp = await save_otp(
            is_used=False,
            purpose="Email Verification",
            user_id=check.userId
        )

        # Construct a nice HTML email body
        body = f"""
        <html>
          <body>
            <h2>Email Verification</h2>
            <p>Hi {check.fname},</p>
            <p>Thank you for Secret Sauce! Use the following OTP:</p>
            <h3 style="color: blue;">{new_otp.otp_code}</h3>
            <p>This OTP will expire in 5 minutes.</p>
            <p>If you didn't request this, please ignore this email.</p>
            <br>
            <p>Cheers,<br>Umaan From Secret Sauce</p>
          </body>
        </html>
        """

        #resend otp
        await send_mail(
            body=body,
            recipients=[check.email],
            subject=new_otp.purpose
        )

        return {
            "message" : "OTP resent successfully. Please check your email"
        }
    except Exception as e:
        print(e)
        raise Exception(e)
    