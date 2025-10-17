from fastapi import APIRouter, HTTPException
from crud.login import verify_user
from pydantic import BaseModel, EmailStr

router = APIRouter()

class UserVerify(BaseModel):
    email: EmailStr
    passwd: str

@router.post("/login")
async def login(user: UserVerify):
    try:
        user_verify = await verify_user(
            email=user.email,
            passwd=user.passwd
        )

        if not user_verify:
            raise HTTPException(status_code=401, detail="Invalid credentials")

        return {
            "message": "User Logged in Successfully",
            "access_token": user_verify["access_token"],
            "username": user_verify["username"]
        }
    except HTTPException as e:
        raise e
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Internal Server Error: {str(e)}")
