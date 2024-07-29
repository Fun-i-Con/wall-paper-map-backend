from fastapi import FastAPI
from api.routers import data

app = FastAPI()

app.include_router(data.router)


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
