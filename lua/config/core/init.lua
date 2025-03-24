require("config.core.options")
require("config.core.keymaps")

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

vim.g.python3_host_prog = "/usr/bin/python3"

local autocmd = vim.api.nvim_create_autocmd

autocmd("Filetype", {
	command = "autocmd TermOpen * :startinsert",
})
autocmd("Filetype", {
	command = "autocmd TermOpen * :setlocal norelativenumber",
})
autocmd("Filetype", {
	command = "autocmd TermOpen * :setlocal nonumber",
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "term://*",
	command = "startinsert",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "NvimTree_*",
	callback = function()
		local cur_win = vim.api.nvim_get_current_win()
		local height = vim.api.nvim_win_get_height(cur_win)
		vim.api.nvim_create_autocmd("WinLeave", {
			buffer = 0,
			callback = function()
				vim.api.nvim_win_set_height(cur_win, height)
			end,
		})
	end,
})

-- Define the Lua function globally
_G.substitute_abbreviation = function()
	local cmdtype = vim.fn.getcmdtype()
	local cmdline = vim.fn.getcmdline()

	-- Check if the command line is exactly ":ss"
	if cmdtype == ":" and cmdline == "ss" then
		-- Replace it with the desired command and position the cursor correctly
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-u>%s///g<Left><Left>", true, false, true), "n", false)
	end
end

-- Set up the command-line abbreviation using Lua
vim.cmd([[
  augroup SubstituteAbbreviation
    autocmd!
    autocmd CmdlineChanged : lua substitute_abbreviation()
  augroup END
]])

vim.filetype.add({
	extension = {
		bf = "brainfuck",
	}
})
