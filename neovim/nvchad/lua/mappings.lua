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

-- copilt chat
map("n", "<leader>cq", function()
  local input = vim.fn.input "Quick Chat: "
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick chat" })

map("n", "<leader>ch", function()
  local actions = require "CopilotChat.actions"
  require("CopilotChat.integrations.telescope").pick(actions.help_actions())
end, { desc = "CopilotChat - Help actions" })

map("n", "<leader>cp", function()
  local actions = require "CopilotChat.actions"
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "CopilotChat - Prompt actions" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
