-- Reset
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.g.colors_name = "gruber"

-- Gruber Darker core palette (directly inspired)
local bg = "#181818"
local fg = "#e4e4ef"

local comment = "#cc8c3c"
local string = "#73c936"
local func = "#96a6c8"
local type_ = "#95a99f"
local yellow = "#ffdd33"

vim.api.nvim_set_hl(0, "Normal", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = bg })

vim.api.nvim_set_hl(0, "Comment", {
	fg = comment,
	italic = true,
})

vim.api.nvim_set_hl(0, "String", { fg = string })
vim.api.nvim_set_hl(0, "Character", { fg = string })

vim.api.nvim_set_hl(0, "Function", { fg = func })

vim.api.nvim_set_hl(0, "Type", { fg = type_ })
vim.api.nvim_set_hl(0, "Structure", { fg = type_ })
vim.api.nvim_set_hl(0, "Typedef", { fg = type_ })

vim.api.nvim_set_hl(0, "PreProc", { fg = type_ })
vim.api.nvim_set_hl(0, "Include", { fg = type_ })
vim.api.nvim_set_hl(0, "Define", { fg = type_ })
vim.api.nvim_set_hl(0, "Macro", { fg = type_ })

vim.api.nvim_set_hl(0, "Conditional", { fg = yellow })
vim.api.nvim_set_hl(0, "Repeat", { fg = yellow })

vim.api.nvim_set_hl(0, "Identifier", { fg = fg })
vim.api.nvim_set_hl(0, "Keyword", { fg = fg })
vim.api.nvim_set_hl(0, "Statement", { fg = fg })
vim.api.nvim_set_hl(0, "Constant", { fg = fg })
vim.api.nvim_set_hl(0, "Number", { fg = fg })
vim.api.nvim_set_hl(0, "Operator", { fg = fg })
vim.api.nvim_set_hl(0, "Delimiter", { fg = fg })
