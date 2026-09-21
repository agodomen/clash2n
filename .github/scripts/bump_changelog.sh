#!/usr/bin/env bash
set -euo pipefail

# - prepend ./docs/Changelog.md to ./docs/Changelog.history.md
# - overwrite ./docs/Changelog.md with ./.github/scripts/Changelog.md

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

CHANGELOG="docs/Changelog.md"
HISTORY="docs/Changelog.history.md"
TEMPLATE=".github/scripts/Changelog.md"

timestamp() { date +"%Y%m%d%H%M%S"; }

echo "Repo root: $ROOT_DIR"

if [ ! -f "$CHANGELOG" ]; then
	echo "Error: $CHANGELOG not found" >&2
	exit 2
fi

if [ ! -f "$TEMPLATE" ]; then
	echo "Error: $TEMPLATE not found" >&2
	exit 3
fi

BACKUP_DIR=".changelog_backups"
mkdir -p "$BACKUP_DIR"

bak_ts=$(timestamp)
cp "$CHANGELOG" "$BACKUP_DIR/Changelog.md.bak.$bak_ts"
echo "Backed up $CHANGELOG -> $BACKUP_DIR/Changelog.md.bak.$bak_ts"

bash "$(dirname "$0")/group_platforms.sh"

if [ -f "$HISTORY" ]; then
	cp "$HISTORY" "$BACKUP_DIR/Changelog.history.md.bak.$bak_ts"
	echo "Backed up $HISTORY -> $BACKUP_DIR/Changelog.history.md.bak.$bak_ts"
fi

tmpfile=$(mktemp)
{
	cat "$CHANGELOG"
	echo
	echo "" 
	if [ -f "$HISTORY" ]; then
		cat "$HISTORY"
	fi
} > "$tmpfile"

mv "$tmpfile" "$HISTORY"
echo "Prepended $CHANGELOG -> $HISTORY"

cp "$TEMPLATE" "$CHANGELOG"
echo "Overwrote $CHANGELOG with $TEMPLATE"

echo "Done. Backups saved under $BACKUP_DIR"

exit 0
