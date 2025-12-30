vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"

vim.o.guicursor = ""

vim.keymap.set("n", "<C-c>", ":noh<CR>")

vim.wo.relativenumber = true

vim.keymap.set("n", "<leader>e", ":Oil<CR>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		{
			"stevearc/oil.nvim",
			config = function()
				require("oil").setup({
					default_file_explorer = true,
					columns = {
						"permissions",
						"size",
						"mtime",
					},
				})
			end,
		},
		{
			"folke/tokyonight.nvim",
			opts = {
				styles = {
					comments = { italic = false },
				},
			},
		},
		{
			{
				"neovim/nvim-lspconfig",
				dependencies = {
					{ "mason-org/mason.nvim", opts = {} },
					"mason-org/mason-lspconfig.nvim",
					"WhoIsSethDaniel/mason-tool-installer.nvim",
					{ "j-hui/fidget.nvim", opts = {} },
					"saghen/blink.cmp",
				},
				config = function()
					-- LSP attach keymaps + behavior
					vim.api.nvim_create_autocmd("LspAttach", {
						group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
						callback = function(event)
							local map = function(keys, func, desc, mode)
								mode = mode or "n"
								vim.keymap.set(mode, keys, func, {
									buffer = event.buf,
									desc = "LSP: " .. desc,
								})
							end

							map("grn", vim.lsp.buf.rename, "Rename")
							map("gra", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
							map("grd", vim.lsp.buf.definition, "Goto Definition")
							map("grD", vim.lsp.buf.declaration, "Goto Declaration")
							map("grr", vim.lsp.buf.references, "Goto References")
							map("gri", vim.lsp.buf.implementation, "Goto Implementation")
							map("grt", vim.lsp.buf.type_definition, "Goto Type Definition")
							map("K", vim.lsp.buf.hover, "Hover Documentation")

							-- Inlay hints toggle (if supported)
							local client = vim.lsp.get_client_by_id(event.data.client_id)
							if client and client.server_capabilities.inlayHintProvider then
								map("<leader>th", function()
									vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
								end, "Toggle Inlay Hints")
							end
						end,
					})

					-- Diagnostics (same behavior as Kickstart)
					vim.diagnostic.config({
						severity_sort = true,
						float = { border = "rounded", source = "if_many" },
						underline = true,
						virtual_text = {
							spacing = 2,
							source = "if_many",
						},
					})

					-- Capabilities from blink.cmp
					local capabilities = require("blink.cmp").get_lsp_capabilities()

					-- Language servers
					local servers = {
						clangd = {},
						gopls = {},
						rust_analyzer = {},
						lua_ls = {
							settings = {
								Lua = {
									completion = { callSnippet = "Replace" },
									diagnostics = { globals = { "vim" } },
								},
							},
						},
					}

					-- Install servers & tools
					local ensure_installed = vim.tbl_keys(servers)
					vim.list_extend(ensure_installed, { "stylua", "clangd", "gopls", "rustfmt" })

					require("mason-tool-installer").setup({
						ensure_installed = ensure_installed,
					})

					-- Setup LSP servers
					require("mason-lspconfig").setup({
						handlers = {
							function(server_name)
								local server = servers[server_name] or {}
								server.capabilities =
									vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
								require("lspconfig")[server_name].setup(server)
							end,
						},
					})
				end,
			},
		},
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.u" } },
				},
			},
		},
		{
			"saghen/blink.cmp",
			event = "VimEnter",
			version = "1.*",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					version = "2.*",
					build = (function()
						if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
							return
						end
						return "make install_jsregexp"
					end)(),
					opts = {},
				},
				"folke/lazydev.nvim",
			},
			opts = {
				keymap = {
					preset = "default",
				},

				appearance = {
					nerd_font_variant = "mono",
				},

				completion = {
					documentation = {
						auto_show = false,
						auto_show_delay_ms = 500,
					},
				},
				sources = {
					default = { "lsp", "path", "snippets", "lazydev" },
					providers = {
						lazydev = {
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},

				snippets = {
					preset = "luasnip",
				},

				fuzzy = {
					implementation = "lua",
				},

				signature = {
					enabled = true,
				},
			},
		},
		{
			{
				"stevearc/conform.nvim",
				event = { "BufWritePre" },
				cmd = { "ConformInfo" },
				keys = {
					{
						"<leader>f",
						function()
							require("conform").format({
								async = true,
								lsp_format = "fallback",
							})
						end,
						mode = "",
						desc = "Format buffer",
					},
				},
				opts = {
					notify_on_error = false,

					-- Format on save
					format_on_save = function(bufnr)
						-- Disable for filetypes with no standard format
						local disable_filetypes = {
							c = true,
							cpp = true,
						}

						if disable_filetypes[vim.bo[bufnr].filetype] then
							return nil
						end

						return {
							timeout_ms = 500,
							lsp_format = "fallback",
						}
					end,

					formatters_by_ft = {
						lua = { "stylua" },

						-- Examples (uncomment when needed)
						-- python = { "black" },
						-- javascript = { "prettierd", "prettier", stop_after_first = true },
						-- typescript = { "prettierd", "prettier", stop_after_first = true },
						-- go = { "gofmt" },
						-- rust = { "rustfmt" },
					},
				},
			},
		},
		{
			"nvim-mini/mini.nvim",
			config = function()
				require("mini.pairs").setup()
				require("mini.surround").setup()
				require("mini.pick").setup()
				require("mini.statusline").setup()
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
		},
		{
			"folke/which-key.nvim",
		},
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = false },
})

vim.cmd.colorscheme("tokyonight-night")

vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { desc = "Pick Files" })
vim.keymap.set("n", "<leader>h", ":Pick help<CR>", { desc = "Pick Help" })
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>", { desc = "Pick Grep" })
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>", { desc = "Pick Buffers" })
