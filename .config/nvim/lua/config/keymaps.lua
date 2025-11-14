local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>f", builtin.find_files)
map("n", "<leader>g", builtin.live_grep)
map("n", "<leader>t", builtin.colorscheme)
map("n", "<leader>h", builtin.help_tags)

map("n", "<leader>e", ":Oil<CR>")

map("n", "<leader>tp", ":TypstPreview<CR>")

map({ "n", "v", "x" }, "<leader>y", '"+y')

map({ "n", "v" }, "<C-c>", ":noh<CR>")
