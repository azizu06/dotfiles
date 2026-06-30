# dotfiles

My terminal-based dev environment, cloud-backed. Themed **Catppuccin Mocha** throughout.

| Dir | What | Live? |
|---|---|---|
| `nvim/` | Neovim + [LazyVim](https://lazyvim.org) config | ✅ symlinked → `~/.config/nvim` |
| `ghostty/` | [Ghostty](https://ghostty.org) terminal (font/theme cmux renders through) | ✅ symlinked → `~/.config/ghostty` |
| `cmux/` | [cmux](https://github.com/manaflow-ai/cmux) terminal/agent workspace | 📸 snapshot (see below) |

## Reproduce on a new machine

```bash
brew install neovim fd ripgrep lazygit tree-sitter-cli
brew install --cask font-jetbrains-mono-nerd-font   # then set Ghostty font to it

git clone https://github.com/azizu06/dotfiles ~/dotfiles
ln -s ~/dotfiles/nvim     ~/.config/nvim
ln -s ~/dotfiles/ghostty  ~/.config/ghostty
cp ~/dotfiles/cmux/cmux.json ~/.config/cmux/cmux.json   # cmux: copy, don't symlink
nvim   # first launch installs all plugins + LSP servers
```

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
