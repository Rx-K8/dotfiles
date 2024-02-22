-- overriding default plugin configs!

local M = {}

-- lspやformmater, linterでデフォルトでインストールしたいものを記述する．
M.mason = {
  ensure_installed = {
    -- python stuff
    "pyright", -- lsp
    "ruff", -- formatter

    -- lua stuff
    "lua-language-server",
    "stylua",
  },
}

return M
