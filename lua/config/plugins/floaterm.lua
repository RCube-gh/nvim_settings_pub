return {
	"voldikss/vim-floaterm",
	config = function()
		vim.g.floaterm_autoclose = 1
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_title = "Terminal($1/$2)"
		vim.api.nvim_set_keymap("n", "<Leader>ft", ":FloatermToggle<CR>", { noremap = true, silent = true })

		function _G.compile_and_run()
			local ft = vim.bo.filetype
			local cmd = ""

			if ft == "c" then
				cmd = "gcc % -o %< && echo 'The program is running...' && echo '-------------------------' && ./%<"
			elseif ft == "cpp" then
				cmd = "g++ % -o %< && echo 'The program is running...'&& echo '-------------------------' && ./%<"
			elseif ft == "python" then
				cmd = "echo 'The program is running...' && echo '-------------------------' && python3 %"
			elseif ft == "brainfuck" then
				cmd = "echo 'The program is running...' && echo '-------------------------' && bf %"
			elseif ft == "asm" then
				cmd = "~/assemblyPractice/asm.sh %" --require my shell script
			elseif ft == "perl" then
				cmd = "echo 'The program is running...' && echo '-------------------------' && perl %"
			else
				print("Filetype " .. ft .. " is not supported!")
				return
			end

			-- vim.notify("The program is running...", vim.log.levels.INFO)
			vim.cmd("FloatermNew --autoclose=0 " .. cmd)
		end

		-- Key mapping to use the function
		vim.api.nvim_set_keymap("n", "<Leader>cr", ":lua compile_and_run()<CR>", { noremap = true, silent = true })
	end,
}
