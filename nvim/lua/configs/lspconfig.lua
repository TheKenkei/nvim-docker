local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig.util"
local lspconfig = require "lspconfig"

--ANGULAR--
local install_path = vim.fn.stdpath "data" .. "/mason/packages/angular-language-server/node_modules"
local ang = install_path .. "/@angular/language-server/node_modules"
local cmd = { "ngserver", "--stdio", "--tsProbeLocations", install_path, "--ngProbeLocations", ang }
--ANGULAR--

local servers = {
  "html",
  "cssls",
  "clangd",
  "intelephense",
  "phpactor",
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
    capabilities = capabilities,
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- tailwindcss
lspconfig.tailwindcss.setup {
  require "configs.tailwindcss",
}

--angularls
lspconfig.angularls.setup {
  on_attach = on_attach,
  cmd = cmd,
  new_root_dir = util.root_pattern("angular.json", "project.json"),
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
}
