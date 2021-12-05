local null_ls = require("null-ls")
local custom_on_attach = require("config.lspconfig").on_attach

null_ls.config({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
	},
})

require("lspconfig")["null-ls"].setup({
	on_attach = custom_on_attach,
})
