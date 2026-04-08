from fastapi import APIRouter
from app.services.age_predictor import predictor

router = APIRouter()

@router.get("/predict")
async def get_prediction(name: str = "Guest"):
    age = predictor.predict({"name": name})
    return {"name": name, "predicted_age": age}
