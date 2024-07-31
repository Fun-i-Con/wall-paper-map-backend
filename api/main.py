from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.include_router(data.router)

origins = [
    "http://localhost",
    "http://localhost:3000",
    "http://127.0.0.1:5500",
    "http://18.179.199.216/member-page/kabegami-map/index.html",
    "https://wall-paper-map-backend-nsc2gqv76q-uc.a.run.app"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)