local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff" },
  },
}

require("conform").setup(options)
