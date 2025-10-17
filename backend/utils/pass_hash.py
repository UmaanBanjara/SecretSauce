from passlib.hash import bcrypt

def hash_passwd(password : str) -> str:
    return bcrypt.hash(password)

def verify_passwd(plain_passwd : str , hashed_passwd : str) -> bool:
    return bcrypt.verify(plain_passwd , hashed_passwd)