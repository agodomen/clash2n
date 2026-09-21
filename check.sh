#!/bin/bash
# check.sh — local full validation (frontend + client build)
# Run before push to avoid waiting for CI feedback

set -e

OS="$(uname -s)"
echo "🔍 System: $OS"

echo ""
echo "▶ Frontend: typecheck + lint + build"
pnpm --dir front install
pnpm --dir front typecheck
pnpm --dir front lint
pnpm --dir front build

echo ""
echo "▶ Client: clippy + build"
cd client
cargo clippy --all-targets --all-features -- -D warnings
cargo build
cd ..

echo ""
echo "✅ All checks passed — safe to push"
