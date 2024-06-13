local map = vim.keymap.set
local get_icon = require("utils.init").get_icon

-- SECTION
--
map("n", "<leader>f", function() end, { desc = get_icon("Search", 1, true) .. "Find" })
map("n", "<leader>p", function() end, { desc = get_icon("Package", 1, true) .. "Packages" })
map("n", "<leader>l", function() end, { desc = get_icon("ActiveLSP", 1, true) .. "LSP" })
map("n", "<leader>u", function() end, { desc = get_icon("Window", 1, true) .. "UI/UX" })
map("n", "<leader>b", function() end, { desc = get_icon("Tab", 1, true) .. "Buffers" })
-- map("n", "<leader>bs", function() end, { desc = get_icon("Sort", 1, true) .. "Sort Buffers" })
map("n", "<leader>d", function() end, { desc = get_icon("Debugger", 1, true) .. "Debugger" })
map("n", "<leader>g", function() end, { desc = get_icon("Git", 1, true) .. "Git" })
map("n", "<leader>t", function() end, { desc = get_icon("Terminal", 1, true) .. "Terminal" })
