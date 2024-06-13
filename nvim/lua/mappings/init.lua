require "nvchad.mappings"
local map = vim.keymap.set

-- require "mappings.init"
map("i", "jj", "<ESC>")
require "mappings.buffers"
require "mappings.git"
require "mappings.lsp"
require "mappings.nvim"
require "mappings.sections"
require "mappings.terminal"
