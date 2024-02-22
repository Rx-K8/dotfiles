local M = {}

M.general = {
  -- インサートモード時に，jjでノーマルモードに戻る
  i = {
    ["jj"] = { "<ESC>", "escape insert mode" },
  },
}

M.lsp = {
  n = {
    ["<leader>fm"] = {

      function()
        require("conform").format()
      end,
      "format with conform",
    },
  },
}

M.flash = {
  n = {
    ["<leader>s"] = {
      function()
        require("flash").jump()
      end,
      "Flash",
    },
    ["<leader>S"] = {
      function()
        require("flash").treesitter()
      end,
      "Flash Treesitter",
    },
  },
}

return M
