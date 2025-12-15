#!/bin/bash

echo "🚀 Lancement du monitoring..."

# Arrête les anciens conteneurs s'ils tournent, pour éviter les conflits
docker-compose down

# Construit l'image et lance les conteneurs en arrière-plan
docker-compose up -d --build

echo "✅ Système démarré !"
echo "📊 Grafana : http://localhost:3000"
echo "📝 Pour voir les logs : ./logs.sh"