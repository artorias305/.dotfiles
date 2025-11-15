local theme = {}

theme.colors = {
	bg = "#0a0a0a",
	string = "#00ff5f",
	constant = "#af5fff",
	comment = "#ffff5f",
	top_level = "#5fd7ff",
	fg = "#f0f0f0",
}

local c = theme.colors

vim.api.nvim_command("hi clear")
if vim.fn.exists("syntax_on") then
	vim.api.nvim_command("syntax reset")
end

vim.g.colors_name = "low"

vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.top_level })

vim.api.nvim_set_hl(0, "String", { fg = c.string })
vim.api.nvim_set_hl(0, "Constant", { fg = c.constant })
vim.api.nvim_set_hl(0, "Comment", { fg = c.comment, italic = true })
vim.api.nvim_set_hl(0, "Function", { fg = c.top_level })
vim.api.nvim_set_hl(0, "Identifier", { fg = c.top_level })

vim.api.nvim_set_hl(0, "@string", { fg = c.string })
vim.api.nvim_set_hl(0, "@constant", { fg = c.constant })
vim.api.nvim_set_hl(0, "@comment", { fg = c.comment, italic = true })
vim.api.nvim_set_hl(0, "@function", { fg = c.top_level })
vim.api.nvim_set_hl(0, "@function.def", { fg = c.top_level })
vim.api.nvim_set_hl(0, "@type", { fg = c.top_level })

return theme
