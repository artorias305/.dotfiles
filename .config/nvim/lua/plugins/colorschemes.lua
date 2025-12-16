return {
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				transparent_background = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},
	{
		"dgox16/oldworld.nvim",
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true,
			})
		end,
	},
}
