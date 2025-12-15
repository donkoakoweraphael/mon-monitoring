#!/usr/bin/env bash

echo "🚀 Lancement du monitoring (macOS)..."

# Note: macOS ne possède pas /proc et /sys comme Linux — vérifiez docker-compose pour les montages
if ! command -v docker-compose >/dev/null 2>&1; then
  echo "⚠️ 'docker-compose' introuvable. Installez Docker Desktop (inclut docker-compose) ou utilisez 'docker compose'."
  exit 1
fi

# Essayer d'exécuter les commandes via 'docker compose' si 'docker-compose' n'existe pas
if command -v docker-compose >/dev/null 2>&1; then
  docker-compose down
  docker-compose up -d --build
else
  docker compose down
  docker compose up -d --build
fi

echo "✅ Système démarré !"
echo "📊 Grafana : http://localhost:3000"
echo "📝 Pour voir les logs : ./logs_macos.sh ou ./logs.sh"
