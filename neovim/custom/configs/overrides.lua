-- overriding default plugin configs!

local M = {}

-- lspやformmater, linterでデフォルトでインストールしたいものを記述する．
M.mason = {
  ensure_installed = {
    -- python stuff
    "pyright", -- lsp
    "ruff",

    -- lua stuff
    "lua-language-server", -- lsp
    "stylua", -- formmater

    -- web stuff
    "typescript-language-server", -- lsp
    "tailwindcss-language-server", -- lsp
    "eslint-lsp", -- lsp
    "prettier", -- formmater

  },
}

M.treesitter = {
  -- jsxはサポートされていない
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "bash",
    "lua",
    "tsx",
    "typescript",
  },
}

M.nvimtree = {
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  git = {
    enable = true,
    ignore = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
