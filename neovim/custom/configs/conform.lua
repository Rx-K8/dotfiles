local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
	},
}

require("conform").setup(options)
