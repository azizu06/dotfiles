# dotfiles

My terminal-based dev environment, cloud-backed. Themed **Catppuccin Mocha** throughout.

| Dir | What | Live? |
|---|---|---|
| `nvim/` | Neovim + [LazyVim](https://lazyvim.org) config | ✅ symlinked → `~/.config/nvim` |
| `ghostty/` | [Ghostty](https://ghostty.org) terminal (font/theme cmux renders through) | ✅ symlinked → `~/.config/ghostty` |
| `cmux/` | [cmux](https://github.com/manaflow-ai/cmux) terminal/agent workspace | 📸 snapshot (see below) |
| `macos/` | LaunchAgent: Caps Lock → Control | 🔧 installed by `install.sh` |
| `karabiner/` | [Karabiner](https://karabiner-elements.pqrs.org): **hold Space = Control**, tap = Space (off in Figma/Blender) | 📸 snapshot; copied by `install.sh` |

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
> - **Modifier remap** (`macos/`): Caps Lock → Control (a standard, harmless swap).
>   `install.sh` loads it; macOS can drop `hidutil` maps on wake/keyboard-hotplug, so
>   re-run `./install.sh` if it reverts (never-drift version: System Settings →
>   Keyboard → Modifier Keys → Caps Lock → Control).
>   NOTE: do NOT remap Option/Command to Control here — a 1:1 `hidutil` swap consumes
>   the key globally and breaks Option+Delete, Option+arrows, etc. Thumb-Control is
>   instead done in `karabiner/` (tap/hold), which leaves Option + Command intact.
> - **Karabiner** (`karabiner/`): hold **Space** = Control, tap = Space. Only the bare
>   spacebar is touched, and it auto-disables in Figma/Blender (which use hold-Space to
>   pan). After `brew bundle` installs it, launch Karabiner-Elements once and grant
>   **Input Monitoring** + **Accessibility** (System Settings → Privacy & Security) and
>   approve its driver/system extension — a one-time manual grant macOS requires.
>   `install.sh` places the config; run `./sync.sh` before committing UI-side changes.

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
