local map = vim.keymap.set
local del = vim.keymap.del
-- del("t", "<ESC>")
-- del("n", "<leader>h")
-- del("n", "<leader>v")

map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp", size = 0.3 }
end, { desc = "Terminal New vertical window" })
--
map("t", "<c-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("t", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("t", "<c-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("t", "<c-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Tmux Down" })
