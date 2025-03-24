return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						--["<C-q>"] = actions.move_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				['smart_open'] = {
					show_scores = false,
					ignore_patterns = {'*.git/*', '*/tmp/*'},
					match_algorithm = 'fzf',
					disable_devicons = false
				},
			},
		})
		telescope.load_extension("fzf")
		--require('telescope').load_extension("smart_open")


		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

		keymap.set("n", "<leader>fd", "<cmd>TodoTelescope<cr>", { desc = "Find todos" }) -- ft is used by floaterm

		keymap.set('n','<leader><leader>so',":lua require('telescope').extensions.smart_open.smart_open({})<CR>", { noremap = true, silent = true })-- I don't know how to use this


	end,
}
