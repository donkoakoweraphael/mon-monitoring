#!/usr/bin/env bash

echo "⏹️ Arrêt du monitoring (macOS)..."

if ! command -v docker >/dev/null 2>&1; then
  echo "⚠️ 'docker' introuvable. Installez Docker Desktop."
  exit 1
fi

if command -v docker-compose >/dev/null 2>&1; then
  docker-compose down
else
  docker compose down
fi

echo "✅ Services arrêtés."
