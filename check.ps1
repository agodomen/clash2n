# check.ps1 — local full validation (frontend + client build)
# Run before push to avoid waiting for CI feedback
# Usage: .\check.ps1

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$ErrorActionPreference = "Stop"

Write-Host "🔍 System: Windows" -ForegroundColor Cyan

Write-Host ""
Write-Host "▶ Frontend: typecheck + lint + build" -ForegroundColor Yellow
pnpm --dir front install
pnpm --dir front typecheck
pnpm --dir front lint
pnpm --dir front build

Write-Host ""
Write-Host "▶ Client: clippy + build" -ForegroundColor Yellow
Push-Location client
cargo clippy --all-targets --all-features -- -D warnings
cargo build
Pop-Location

Write-Host ""
Write-Host "✅ All checks passed — safe to push" -ForegroundColor Green
