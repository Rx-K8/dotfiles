local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "lua_ls", "pyright", "tsserver", "tailwindcss", "eslint" }

local custom_on_attach = function(client, bufnr)
	on_attach(client, bufnr)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = custom_on_attach,
		capabilities = capabilities,
	})
end
