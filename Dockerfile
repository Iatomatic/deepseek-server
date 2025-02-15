# Imagen base sin CUDA (para CPU)
FROM python:3.10

# Establecer directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema
RUN apt update && apt install -y git

# Copiar archivos de dependencias
COPY requirements.txt .

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código
COPY . .

# Exponer el puerto de la API
EXPOSE 8000

# Comando de ejecución
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
