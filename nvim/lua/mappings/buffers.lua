local map = vim.keymap.set

map("i", "jj", "<ESC>")

map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer New" })
map("n", "<leader>bc", function()
  require("utils.buffers").close_all(true)
end, { desc = "Close other buffers" })

map("n", "<leader>bC", function()
  require("utils.buffers").close_all()
end, { desc = "Close all buffers" })
