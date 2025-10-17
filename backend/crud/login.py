import asyncio  
from utils.pass_hash import verify_passwd
from sqlalchemy import select
from testdb.db import SessionLocal
from utils.jwt_handler import create_token
from models.users import User

async def verify_user (email : str , passwd : str):
    async with SessionLocal() as db:
            try:
                result = await db.execute(select(User).where(User.email == email))
                user_check = result.scalar_one_or_none()
                if user_check and verify_passwd(passwd , user_check.passwd):
                    access_token = create_token(data = {"user_id" : user_check.id})
                    return {
                        "message" : "Login Successful",
                        "access_token" : access_token,
                        "username" : user_check.username
                    }
                return None
            except Exception as e:
                return({
                     
                "message" : "Internal Server Error"})
            


