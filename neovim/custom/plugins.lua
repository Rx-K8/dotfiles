local overrides = require("custom.configs.overrides")

return {
	----------------------------------------- default plugins -----------------------------------------
	{
		"neovim/nvim-lspconfig",

		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	{ "williamboman/mason.nvim", opts = overrides.mason },

	{
		"stevearc/conform.nvim",
		config = function()
			require("custom.configs.conform")
		end,
	},

	{ "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,

		config = function(_, opts)
			dofile(vim.g.base46_cache .. "syntax")
			require("nvim-treesitter.configs").setup(opts)

			-- register mdx ft
			vim.filetype.add({
				extension = { mdx = "mdx" },
			})

			vim.treesitter.language.register("markdown", "mdx")
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

	-- 移動を便利にする
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
	},

	-- 自動でタグを閉じる（web系）
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
