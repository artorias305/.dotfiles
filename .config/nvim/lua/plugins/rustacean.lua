return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false,
	ft = "rust",
	dependencies = {
		"saghen/blink.cmp",
	},
	init = function()
		vim.g.rustaceanvim = {
			server = {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			},
		}
	end,
}
