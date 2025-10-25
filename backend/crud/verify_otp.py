import asyncio
from datetime import datetime
from models.otp import OTP
from sqlalchemy import and_, select, update
from testdb.db import SessionLocal

async def verifyOTP(otp : str):
    async with SessionLocal() as db:
        try:
            result = await db.execute(select(OTP).where(and_(OTP.otp_code == otp , OTP.is_used == False , OTP.expires_at >= datetime.utcnow())))
            otp_check = result.scalar_one_or_none()
            if not otp_check:
                return None
            
            #marking otp as used
            await db.execute(
                update(OTP).where(OTP.id == otp_check.id).values(is_used = True)
            )
            await db.commit()

            return otp_check
        except Exception as e:
            print(e)
            raise RuntimeError(f"Something went wrong{e}")