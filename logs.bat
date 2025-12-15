@echo off
echo Tailing logs for container 'python_monitor'...
docker logs -f python_monitor
pause
