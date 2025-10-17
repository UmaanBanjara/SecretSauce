import asyncio
from testdb.db import Base , engine
from models.users import User
from models.otp import OTP

#function to crate and test tables

async def create_tables():
    try:
        async with engine.begin() as conn:
            await conn.run_sync(Base.metadata.create_all)
            print("DB connection successfull")
    except Exception as e:
        print(f"DB connection is shit {e}")

#test
if __name__ == "__main__":
    asyncio.run(create_tables())