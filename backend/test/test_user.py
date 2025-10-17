import asyncio
from testdb.db import engine
from crud import signup

async def main():
    try:
        user = await signup.create_user(
            email="erm@gmail.com",
            fname="hello",
            lname="world",
            username="slay",
            passwd="ermwhatthesigma",

        )
        print(f"{user.email , user.fname , user.lname ,user.username , user.passwd , user.id}")
    except Exception as e:
        print(f"Something went wrong , {e}")
    finally:
        await engine.dispose()

if __name__ == "__main__":
    asyncio.run(main())