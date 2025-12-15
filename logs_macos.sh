#!/usr/bin/env bash
# Affiche les logs en temps réel du script (macOS)

if ! command -v docker >/dev/null 2>&1; then
  echo "⚠️ 'docker' introuvable. Installez Docker Desktop."
  exit 1
fi

echo "Suivi des logs du container 'python_monitor'... (Ctrl+C pour quitter)"
docker logs -f python_monitor
