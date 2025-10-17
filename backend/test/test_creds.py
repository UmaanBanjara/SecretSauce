import asyncio
from crud import login
from testdb.db import engine

async def main():
    try:
        verify = await login.verify_user(
            email="erm@gmail.com",
            passwd="ermwhatthesigma"
        )
        print(verify)
    except Exception as e:
        print(f"Something went wrong {e}")
    finally:
        await engine.dispose()

if __name__ == "__main__":
    asyncio.run(main())