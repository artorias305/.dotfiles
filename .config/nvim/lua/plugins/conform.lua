return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clangd" },
				python = { "black" },
				rust = { "rust-analyzer" },
			},
		})
	end,
}
