-- Match the rest of your environment (cmux + Ghostty are themed Catppuccin Mocha).
-- To go back to LazyVim's default, delete this file or set colorscheme = "tokyonight".
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false, -- set true if you want Ghostty's glass to show through
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
