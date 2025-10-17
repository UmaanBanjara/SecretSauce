from fastapi import FastAPI
from routes.signup_route import router as signup_router
from routes.login_route import router as login_router

app = FastAPI(title="Secret Sauce")

app.include_router(signup_router , prefix="/auth" , tags=["Authentication"])
app.include_router(login_router , prefix="/auth" , tags=["Authorization"])

@app.get("/")
async def root():
    return {
        "message" : "Welcome to SecretSauce"
    }