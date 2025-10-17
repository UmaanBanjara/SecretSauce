from jose import jwt , JWTError
from pydantic import BaseModel
from fastapi import HTTPException
import os
from dotenv import load_dotenv
from datetime import datetime , timedelta

load_dotenv()

secret_key = os.getenv("SECRET_KEY")
algo = os.getenv("ALGORITHM")
expiration = int(os.getenv("ACCESS_TOKEN_EXPIRE_MINUTE"))

class TokenData(BaseModel):
    user_id : int | None = None

def create_token (data : dict , expires_delta : timedelta | None = None):
    to_encode = data.copy()
    expire = datetime.utcnow() + (expires_delta or timedelta(minutes = expiration))
    to_encode.update({"exp" : expire})
    encoded_jwt = jwt.encode(to_encode , secret_key , algorithm=algo)   
    return encoded_jwt

def verify_token (token : str):
    try:
        payload = jwt.decode(token ,secret_key , algorithms=[algo])
        user_id : int = payload.get("user_id")
        if user_id is None:
            raise HTTPException(status_code=401 , detail="Invalid Token")
        return TokenData(user_id = user_id)
    except JWTError as e:
        raise HTTPException(status_code=401 , detail="Token expired or invalid")
