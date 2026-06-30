-- Stop markdownlint from nagging on markdown files (blank-lines-around-headings,
-- line-length, list-style, etc.). It's useful for strict docs but pure noise for
-- personal notes / Obsidian. Other languages' linters are untouched.
return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = opts.linters_by_ft or {}
    opts.linters_by_ft.markdown = {}
    return opts
  end,
}
