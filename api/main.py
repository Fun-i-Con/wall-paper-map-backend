from fastapi import FastAPI

from api.routers import data

app = FastAPI()
app.include_router(data.router)