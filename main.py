import uvicorn
from fastapi import FastAPI
from app.api.routes import router
from app.core.config import settings

app = FastAPI(title=settings.PROJECT_NAME, version=settings.VERSION)

# 라우터 연결
app.include_router(router)

@app.get("/")
async def root():
    return {"message": "Age Prediction API is running"}

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)