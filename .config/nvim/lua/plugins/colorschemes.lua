return {
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
