return {
	"github/copilot.vim",
	lazy=false,
	config = function()
		vim.g.copilot_enabled = 0
		-- Add any other configuration you want here
		vim.keymap.set(
			"i",
			"<c-l>",
			'copilot#Accept()',
			{ silent = true, expr = true, replace_keycodes = false }
		)

		-- Copilot settings
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_no_auto_accept = true
		vim.g.copilot_no_auto_accept_on_tab = true
	end,
}
