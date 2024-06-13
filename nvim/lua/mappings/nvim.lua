local map = vim.keymap.set

local del = vim.keymap.del
-- del("n", "<leader>n")
-- del("n", "<leader>rn")

map("n", "<A-q>", "<cmd>confirm q<cr>", { desc = "Quit" })
map("n", "<C-A-q>", "<cmd>confirm qa!<cr>", { desc = "Quit" })

map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Vertical split" })
map("n", "<leader>ut", "<cmd>Telescope themes<CR>", { desc = "Telescope Nvchad themes" })

vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<leader>df", "<cmd>:%s//<cr>", { desc = "Delete find word " })
