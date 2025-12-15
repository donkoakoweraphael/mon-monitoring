@echo off
echo Starting monitoring (Windows cmd)...
where docker-compose >nul 2>&1
if %ERRORLEVEL%==0 (
  docker-compose down
  docker-compose up -d --build
) else (
  echo docker-compose not found, trying 'docker compose'...
  docker compose down
  docker compose up -d --build
)
echo Done. Grafana: http://localhost:3000
echo To view logs: logs.bat
