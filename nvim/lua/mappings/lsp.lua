local map = vim.keymap.set
local del = vim.keymap.del
map("n", "<leader>ls", function()
  local aerial_avail, _ = pcall(require, "aerial")
  if aerial_avail then
    require("telescope").extensions.aerial.aerial()
  else
    require("telescope.builtin").lsp_document_symbols()
  end
end, { desc = "Search symbols" })

-- del("n", "<leader>q")
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Lsp diagnostic loclist" })

map("n", "[[", function()
  vim.diagnostic.goto_prev()
  vim.lsp.buf.code_action()
end, { desc = "Lsp prev diagnostic" })

map("n", "]]", function()
  vim.diagnostic.goto_next()
  vim.lsp.buf.code_action()
end, { desc = "Lsp next diagnostic" })
