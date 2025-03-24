return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			debug = true, -- Enable debugging
			show_help = true, -- Shows help message as virtual lines when waiting for user input
			highlight_selection = true, -- Highlight selection
			highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
			references_display = 'virtual', -- 'virtual', 'write', Display references in chat as virtual text or write to buffer
			auto_follow_cursor = true, -- Auto-follow cursor in chat
			auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
			insert_at_end = false, -- Move cursor to end of buffer when inserting text
			clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

			-- Static config starts here (can be configured only via setup function)

			log_level = 'info', -- Log level to use, 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
			proxy = nil, -- [protocol://]host[:port] Use this proxy
			allow_insecure = false, -- Allow insecure server connections

			chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)

			log_path = vim.fn.stdpath('state') .. '/CopilotChat.log', -- Default path to log file
			history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history

			question_header = '# User ', -- Header to use for user questions
			answer_header = '# Copilot ', -- Header to use for AI answers
			error_header = '# Error ', -- Header to use for errors
			separator = '───', -- Separator to use in chat
			-- See Configuration section for rest
			mappings = {
				close = {
					normal = '<leader>q',
					insert = '<C-c>',
				},
			},
			window = {
				layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
				width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
				height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
				-- Options below only apply to floating windows
				relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
				border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
				row = nil, -- row position of the window, default is centered
				col = nil, -- column position of the window, default is centered
				title = 'Copilot Chat', -- title of chat window
				footer = nil, -- footer of chat window
				zindex = 1, -- determines if window is on top or below other floating windows
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
