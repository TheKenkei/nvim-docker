local options = {
  ensure_installed = {
    -- FRONT
    "angular-language-server", --ANGULAR
    "typescript-language-server", --TYPESCRIPT
    "tailwindcss-language-server", --TAILWINDCSS
    "css-lsp", --CSS
    "html-lsp", --HTML
    "eslint_d", --ESLINT
    "prettierd", --PRETTIER
    "prettier", --PRETTIER

    --BACK
    "phpactor", --PHP
    "intelephense", --PHP
    "easy-coding-standard", -- PHP FORMATTER
    "xmlformatter", -- XML FORMATTER

    --DOCKER
    "docker-compose-language-service", --DOCKER
    "dockerfile-language-server", --DOCKER

    --NVIM
    "lua-language-server", -- LUA
    "stylua", --LUA FORMATTER

    --OTHER
    "shfmt", -- SHELL
  },
}
return options
