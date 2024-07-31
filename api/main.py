from fastapi import FastAPI
from api.routers import data
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.include_router(data.router)

origins = [
    "http://localhost",
    "http://localhost:3000",
    "http://127.0.0.1:5500",  # 必要に応じて追加
    "http://18.179.199.216/member-page/kabegami-map/index.html", # 実際のドメインを追加
    "https://wall-paper-map-backend-nsc2gqv76q-uc.a.run.app/" # Cloud Runのドメインを追加
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)