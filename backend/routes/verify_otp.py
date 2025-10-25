from fastapi import APIRouter , HTTPException
from crud.verify_otp import verifyOTP
from pydantic import BaseModel

router = APIRouter()

class OTPcheck(BaseModel):
    otp : str

@router.post("/otpcheck")

async def otpCheck(otp : OTPcheck):
    try:
        otp_check = await verifyOTP(
            otp=otp.otp
        )
        if not otp_check:
            raise HTTPException(status_code=401 , detail="Invalid OTP")
        return {
            "message" : "OTP verified successfully"
        }
    except Exception as e:
        raise HTTPException(status_code=500 , detail=f"Internal Server Error{e}")