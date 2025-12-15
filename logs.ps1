<# PowerShell script to tail Docker logs for the Python monitor container #>
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Error "'docker' introuvable. Installez Docker Desktop."
    exit 1
}

Write-Host "Tailing logs for container 'python_monitor'... (Ctrl+C to stop)"
docker logs -f python_monitor
