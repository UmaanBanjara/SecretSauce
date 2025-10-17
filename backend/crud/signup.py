from sqlalchemy.ext.asyncio import AsyncSession
from models.users import User
from testdb.db import SessionLocal
from utils.pass_hash import hash_passwd
import asyncio

async def create_user(fname: str, lname: str, username: str, email: str, passwd: str):
    async with SessionLocal() as db:  
        async with db.begin():         
            try:
                new_user = User(
                    fname=fname,
                    lname=lname,
                    username=username,
                    email=email,
                    passwd=hash_passwd(passwd)
                )
                db.add(new_user)
            except Exception as e:
                await db.rollback()
                raise e
        await db.commit()  
        await db.refresh(new_user)  
        return new_user


