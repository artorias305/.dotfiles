vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.winborder = "rounded"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.cursorcolumn = false
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.cmd([[set mouse=a]])

vim.lsp.enable("clangd")
