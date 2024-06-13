local options = {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "scss",
    "typescript",
    "javascript",
    "php",
  },
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
}
return options
