-- Keep the code lean: turn OFF inlay hints (the inline type annotations LazyVim
-- shows next to variables/params). They add a lot of visual noise. The types are
-- still one keypress away -- hover with `K` to see them -- and you can toggle the
-- inline hints back on anytime with <leader>uh.
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
  },
}
