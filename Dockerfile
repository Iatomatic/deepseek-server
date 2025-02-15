# Imagen base con soporte CUDA (ajusta si no tienes GPU en Railway)
FROM nvidia/cuda:12.1.1-runtime-ubuntu22.04

# Establecer directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema
RUN apt update && apt install -y python3 python3-pip git

# Copiar los archivos de dependencias y instalarlas
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copiar el resto del código
COPY . .

# Exponer el puerto donde correrá la API
EXPOSE 8000

# Comando de ejecución para iniciar la API
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
