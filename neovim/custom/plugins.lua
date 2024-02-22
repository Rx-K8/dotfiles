local overrides = require "custom.configs.overrides"

return {
  ----------------------------------------- default plugins -----------------------------------------
  {
    "neovim/nvim-lspconfig",

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { "williamboman/mason.nvim", opts = overrides.mason },
  {
    "stevearc/conform.nvim",
    config = function()
      require "custom.configs.conform"
    end,
  },

  --------------------------------------------- custom plugins ----------------------------------------------
  -- smooth scroll
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  },
}
