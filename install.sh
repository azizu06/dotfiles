#!/usr/bin/env bash
# install.sh — bootstrap this dotfiles repo on a fresh macOS machine.
# Idempotent: safe to run any number of times. Anything it would overwrite is
# backed up to <path>.bak-<timestamp> first. Run after `brew bundle`.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"

info() { printf '   %s\n' "$*"; }
ok()   { printf '\xe2\x9c\x93 %s\n' "$*"; }

# 1. Make sure every target directory exists (fresh machines lack these).
mkdir -p "$HOME/.config" "$HOME/.config/cmux" "$HOME/Library/LaunchAgents"

# symlink $1 -> $2, backing up anything real already sitting at $2.
link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    ok "symlink already correct: $dst"
    return
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    local bak="$dst.bak-$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$bak"
    info "backed up existing $dst -> $bak"
  fi
  ln -s "$src" "$dst"
  ok "linked $dst -> $src"
}

# 2. Live configs (edits in ~/.config flow straight back into the repo).
link "$here/nvim"    "$HOME/.config/nvim"
link "$here/ghostty" "$HOME/.config/ghostty"

# 3. cmux rewrites its own config, so it is copied, not symlinked.
cp "$here/cmux/cmux.json" "$HOME/.config/cmux/cmux.json"
ok "cmux.json copied -> ~/.config/cmux/cmux.json"

# 4. macOS modifier remap: Caps Lock AND left Option both send Control
#    (thumb-friendly Ctrl for terminal/Vim). Install, (re)load, apply now.
plist="com.aziz.capslock-to-control.plist"
cp "$here/macos/$plist" "$HOME/Library/LaunchAgents/$plist"
launchctl unload "$HOME/Library/LaunchAgents/$plist" 2>/dev/null || true
launchctl load   "$HOME/Library/LaunchAgents/$plist"
ok "modifier remap installed + loaded (Caps & left Option -> Control)"

cat <<'EOF'

All linked. Remaining manual steps:
   1. brew bundle   — if you have not installed deps yet (uses the Brewfile here)
   2. Launch Ghostty once; confirm font = "JetBrainsMono Nerd Font"
   3. Run `nvim` once — LazyVim installs all plugins + LSP servers on first launch
EOF
