FROM python:3.9-slim

WORKDIR /app

# Installation des dépendances système (nécessaire pour psutil)
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Installation des dépendances Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copie du script
COPY main.py .

# Commande de lancement
CMD ["python", "main.py"]