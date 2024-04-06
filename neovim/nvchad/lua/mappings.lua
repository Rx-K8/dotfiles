require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- folke/flash.nvim
map("n", "<leader>j", function()
  require("flash").jump()
end, { desc = "Flash" })

map("n", "<leader>J", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
