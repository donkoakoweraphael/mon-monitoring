#!/usr/bin/env bash

echo "⏹️ Arrêt du monitoring..."

# Prefer 'docker-compose' when available, fallback to 'docker compose'
if command -v docker-compose >/dev/null 2>&1; then
  docker-compose down
else
  docker compose down
fi

echo "✅ Services arrêtés."
