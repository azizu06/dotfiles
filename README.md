# dotfiles

My terminal-based dev environment, cloud-backed. Themed **Catppuccin Mocha** throughout.

| Dir | What | Live? |
|---|---|---|
| `nvim/` | Neovim + [LazyVim](https://lazyvim.org) config | ✅ symlinked → `~/.config/nvim` |
| `ghostty/` | [Ghostty](https://ghostty.org) terminal (font/theme cmux renders through) | ✅ symlinked → `~/.config/ghostty` |
| `cmux/` | [cmux](https://github.com/manaflow-ai/cmux) terminal/agent workspace | 📸 snapshot (see below) |
| `macos/` | LaunchAgent: Caps Lock **and** left Option → Control (thumb-friendly Ctrl) | 🔧 installed by `install.sh` |

## Reproduce on a new machine

```bash
git clone https://github.com/azizu06/dotfiles ~/dotfiles
cd ~/dotfiles
brew bundle      # neovim, ghostty, fonts, ripgrep, fd, lazygit, tree-sitter (see Brewfile)
./install.sh     # symlinks nvim+ghostty, copies cmux.json, installs the modifier remap
nvim             # first launch installs all plugins + LSP servers
```

`install.sh` is **idempotent** — re-run it anytime. It backs up anything it would
overwrite to `<path>.bak-<timestamp>` first, so it can never clobber existing config.

> - **cmux** itself is a standalone app (manaflow-ai), *not* on Homebrew — install it
>   separately. It **bundles Ghostty** (so there's no separate ghostty install); this
>   repo only carries the `ghostty/` + `cmux/` config it reads.
> - **Modifier remap** (`macos/`): Caps Lock and the **left Option** key both send
>   Control — thumb-friendly Ctrl for terminal + Vim, with Command left fully intact.
>   `install.sh` loads it; macOS may drop `hidutil` maps on wake/keyboard-hotplug, in
>   which case re-run `./install.sh` (or, for a never-drift version, set System
>   Settings → Keyboard → Modifier Keys → Option → Control — affects both Option keys).

## Backing up changes

- **nvim / ghostty** edits are live (symlinked) — they're already in the repo. Just
  `git add -A && git commit && git push`.
- **cmux** rewrites its own `cmux.json`, so it's a snapshot, not a symlink. Before
  committing cmux changes, run `./sync.sh` to refresh the snapshot.

```bash
cd ~/dotfiles
./sync.sh                 # pulls latest ~/.config/cmux/cmux.json into the repo
git add -A && git commit -m "update" && git push
```
