return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>xx", "<cmd>Trouble<CR>", desc = "Open/close trouble list" },
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
		{ "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
		{ "<leader>xq", "<cmd>Trouble quickfix<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist<CR>", desc = "Open trouble location list" },
	},
	config = function()
		require("trouble").setup({})
	end,
}
