FROM python:3.11-slim

WORKDIR /app

# Copiamos requirements primero para aprovechar cache
COPY requirements.txt .

# Instalamos dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    libpq-dev \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalamos pip y dependencias Python
RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Limpiamos herramientas de compilación
RUN apt-get remove -y gcc build-essential python3-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copiamos el resto de la app
COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
