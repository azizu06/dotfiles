#!/usr/bin/env bash
# Refresh app-managed snapshots into the repo before committing.
# nvim + ghostty are symlinked (already live), so only cmux needs pulling.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
cp ~/.config/cmux/cmux.json "$here/cmux/cmux.json"
echo "✓ cmux.json snapshot refreshed."
echo "  Next: git add -A && git commit -m 'update' && git push"
