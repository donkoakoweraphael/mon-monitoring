@echo off
echo Stopping monitoring (Windows cmd)...
where docker-compose >nul 2>&1
if %ERRORLEVEL%==0 (
  docker-compose down
) else (
  echo docker-compose not found, trying 'docker compose'...
  docker compose down
)
echo Done.
