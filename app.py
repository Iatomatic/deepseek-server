from fastapi import FastAPI
from transformers import AutoModelForCausalLM, AutoTokenizer
import torch

# Inicializar FastAPI
app = FastAPI()

# Cargar el modelo de DeepSeek
MODEL_NAME = "deepseek-ai/deepseek-coder-1.3b"

tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)
model = AutoModelForCausalLM.from_pretrained(MODEL_NAME, torch_dtype=torch.float32)  # Cambiado a float32 para CPU

@app.get("/")
async def root():
    return {"message": "DeepSeek AI Server is Running"}

@app.get("/predict")
async def predict(text: str):
    inputs = tokenizer(text, return_tensors="pt")
    with torch.no_grad():  # Desactivar gradientes para mayor eficiencia en CPU
        outputs = model.generate(**inputs, max_length=100)
    response = tokenizer.decode(outputs[0], skip_special_tokens=True)
    
    return {"response": response}
