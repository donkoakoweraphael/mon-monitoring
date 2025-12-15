<# PowerShell: Stop monitoring stack #>
Write-Host "⏹️ Stopping monitoring (PowerShell)..."

try {
    docker-compose down 2>$null -ErrorAction SilentlyContinue
} catch {
    Write-Host "Trying 'docker compose' fallback..."
    docker compose down
}

Write-Host "✅ Services stopped."
