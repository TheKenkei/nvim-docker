local util = require "conform.util"
require("conform").setup {
  formatters = {
    phpcsfixer = {
      meta = {

        url = "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer",
        description = "The PHP Coding Standards Fixer.",
      },
      command = util.find_executable({
        "tools/php-cs-fixer/vendor/bin/php-cs-fixer",
        "vendor/bin/php-cs-fixer",
      }, "php-cs-fixer"),
      args = { "fix", "$FILENAME" },
      stdin = false,
      cwd = util.root_file { "composer.json" },
      -- Change where to find the command
    },
  },
}
local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },

    json = { "prettier" },
    jsonc = { "prettier" },

    php = { "phpcsfixer" },
    yaml = { "prettier" },
    xml = { "xmlformat" },

    bash = { "shfmt" },
    sh = { "shfmt" },
  },

  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
