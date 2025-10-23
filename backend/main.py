from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes.signup_route import router as signup_router
from routes.login_route import router as login_router

app = FastAPI(title="Secret Sauce")

app.add_middleware(
    CORSMiddleware,
    allow_origins = ["*"],
    allow_credentials = True,
    allow_methods = ["*"],
    allow_headers = ["*"]
)

app.include_router(signup_router , prefix="/auth" , tags=["Authentication"])
app.include_router(login_router , prefix="/auth" , tags=["Authorization"])

@app.get("/")
async def root():
    return {
        "message" : "Welcome to SecretSauce"
    }