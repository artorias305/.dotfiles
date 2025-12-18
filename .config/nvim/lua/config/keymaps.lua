local builtin = require("telescope.builtin")
local map = vim.keymap.set

-- map("n", "<leader>f", builtin.find_files)
map("n", "<leader>g", builtin.live_grep)
map("n", "<leader>t", builtin.colorscheme)
map("n", "<leader>h", builtin.help_tags)
map("n", "<leader>b", builtin.buffers)

map("n", "<leader>e", ":Oil<CR>")

map("n", "<leader>tp", ":TypstPreview<CR>")

map({ "n", "v", "x" }, "<leader>y", '"+y')

map({ "n", "v" }, "<C-c>", ":noh<CR>")

map("n", "<leader>s", "", { desc = "Split screen" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })

map("n", "<leader>lw", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle line wrap" })

map("n", "<leader>td", ":e ~/.todo.txt<CR>", { desc = "View todos" })
