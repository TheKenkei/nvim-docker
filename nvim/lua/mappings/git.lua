local map = vim.keymap.set
map("n", "<leader>gg", function()
  local worktree = require("utils.git").file_worktree()
  local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
  require("nvchad.term").new { pos = "float", id = "floatTerm", cmd = "lazygit " .. flags .. ";exit" }
end, { desc = "Lazygit" })
