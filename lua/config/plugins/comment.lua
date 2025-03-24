return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- You can comment out by typing "gc". 
		-- "gcc" to comment out the current line, "gc2j" for 3 lines from the current line
		-- "gc" again to cancel comment

		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
