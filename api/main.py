from fastapi import FastAPI
from api.routers import data
import os

app = FastAPI()

app.include_router(data.router)

if __name__ == "__main__":
    import uvicorn
    port = int(os.getenv("PORT", 8080))
    uvicorn.run(app, host="0.0.0.0", port=port)
