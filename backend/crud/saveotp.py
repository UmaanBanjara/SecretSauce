from testdb.db import SessionLocal
import asyncio
from models.otp import OTP
from utils.otpgenerator import otp_generator

async def save_otp(purpose: str, user_id: int, is_used: bool | None = False):
    async with SessionLocal() as db:
        async with db.begin():
            try:
                new_otp = OTP(
                    otp_code=otp_generator(),
                    purpose=purpose,
                    user_id=user_id,
                    is_used=is_used
                )
                db.add(new_otp)
            
            except Exception as e:
                await db.rollback()
                raise e
        await db.commit()
        await db.refresh(new_otp)
        return new_otp

