<# PowerShell script to start the monitoring stack on Windows #>
Write-Host "🚀 Starting monitoring (PowerShell)..."

# Check for docker-compose (Docker Desktop)
if (-not (Get-Command docker-compose -ErrorAction SilentlyContinue)) {
    Write-Warning "'docker-compose' introuvable. Si vous utilisez Docker Desktop récent, utilisez 'docker compose' au lieu de 'docker-compose'."
}

try {
    docker-compose down 2>$null -ErrorAction SilentlyContinue
    docker-compose up -d --build
} catch {
    Write-Host "Trying 'docker compose' fallback..."
    docker compose down
    docker compose up -d --build
}

Write-Host "✅ System started!"
Write-Host "📊 Grafana : http://localhost:3000"
Write-Host "📝 To follow logs: .\logs.ps1"
