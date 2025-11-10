local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.live_grep)
map("n", "<leader>ft", builtin.colorscheme)

map("n", "-", ":Oil<CR>")

map("n", "<leader>tp", ":TypstPreview<CR>")
