return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")
		substitute.setup()

		local keymap = vim.keymap
		vim.keymap.set("n", "<leader>s", substitute.operator, { desc = "Substitute with motion" })
		vim.keymap.set("n", "<leader>ss", substitute.line, { desc = "Substitute line" })
		vim.keymap.set("n", "<leader>S", substitute.eol, { desc = "Substitute to end of line" })
		vim.keymap.set("x", "<leader>s", substitute.visual, { desc = "Substitute in visual mode" })

	end,
}
