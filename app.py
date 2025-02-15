from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "DeepSeek Server is Running"}

@app.get("/predict")
async def predict(text: str):
    return {"response": f"Modelo DeepSeek recibió: {text}"}
