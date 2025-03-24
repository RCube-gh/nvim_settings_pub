-- ~/.config/nvim/lua/plugins/nvim-dap.lua

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio", -- Ensure nvim-nio is included
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Set up nvim-dap UI
		dapui.setup()

		dap.adapters = {
			cppdbg={
				id = "cppdbg",
				type = "executable",
				command = '/usr/bin/gdb',
				name = "cppdbg",
				args = {},
			},
			-- cppdbg = {
			-- 	id = "cppdbg",
			-- 	type = "executable",
			-- 	command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
			-- 	options = {
			-- 		detached = false,
			-- 	},
			-- },
			lldb = {
				type = "executable",
				command = "/usr/bin/lldb",
				name = "lldb",
			},
			codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			},
			python = {
				type = "executable",
				command = "/usr/bin/python3",
				args = { "-m", "debugpy.adapter" },
			},
		}

		dap.configurations = {
			cpp = {
				{
					-- add g option when compiling with gcc
					name = "Launch",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					runInTerminal = false,
				},
			},
			python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}", -- This will debug the current file
					pythonPath = "/usr/bin/python3",
				},
			},
		}

		-- Automatically open and close dap-ui
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		dap.set_log_level("TRACE")

		-- Set up key mappings
		vim.api.nvim_set_keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap(
			"n",
			"<F10>",
			"<Cmd>lua require'dap'.step_over()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<F11>",
			"<Cmd>lua require'dap'.step_into()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap(
			"n",
			"<leader>b",
			"<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>B",
			"<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			{ noremap = true, silent = true }
		)
		-- Example keybindings
		vim.api.nvim_set_keymap(
			"n",
			"<leader>du",
			"<Cmd>lua require'dapui'.toggle()<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
