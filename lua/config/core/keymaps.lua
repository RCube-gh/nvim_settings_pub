function _G.close_termial()
	local current_window = vim.api.nvim_get_current_win()
	local current_buffer = vim.api.nvim_get_current_buf()
	if current_buffer == terminal_buffer then
		vim.api.nvim_set_current_win(terminal_window)
		vim.cmd("q")
	else
		vim.cmd("q")
	end
end
vim.g.mapleader = " "


local keymap = vim.keymap

vim.opt.mouse = "" -- disable mouse (ban clicking)

keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode with jj" })
keymap.set("i", "jk", "<esc>:w<CR>", { desc = "Exit insert mode and save with jk" })

keymap.set("i", "ｊｊ", "<esc>", { desc = "Exit insert mode with ｊｊ" })
keymap.set("n", "い", "i", { desc = "insert mode with い" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "<esc><esc>", ":noh<CR>", { desc = "Clear search highlights", silent = true })


keymap.set("n", "<space><CR>", "o<esc>", { desc = "insert empty line" })
keymap.set("n", "<space><space>", "i<space><esc>", { desc = "insert space" })

--keymap.set("n", "<leader>cp", 'gg"+yG:echo "Copied to clipboard!"<CR>', { desc = "Copy all", silent = true })
keymap.set("n", "<leader>cp", '<cmd>%y+<cr>:echo "Copied to clipboard!"<CR>', { desc = "Copy all", silent = true })
--keymap.set("n", "<leader>cp", '<cmd>%y<cr> :echo "Copied to clipboard!"<CR>', { desc = "Copy all", silent = true })
keymap.set("n", "q", '<cmd>NoiceDismiss<cr>', { desc = "dismiss noice message", silent = true })

keymap.set("n", "<leader>xxd", "<cmd>%!xxd<CR>", { desc = "display hex dump" })
keymap.set("n", "<leader>xxr", "<cmd>%!xxd -r<CR><cmd>w<cr>", { desc = "undo hex dump" })

-- replace word with cgn
keymap.set("n","<leader>rw", "*''cgn", { desc = "replace word with cgn" })
-- replace yanked word
keymap.set("n","<leader>rp", 'yiw:%s/<C-r><C-r>"//g<left><left>', { desc = "replace word in normal mode" })
keymap.set("x","<leader>rp", 'y:%s/<C-r><C-r>"//g<left><left>', { desc = "replace selected area in visual mode" })




keymap.set("n","<leader>mt", "<cmd>colorscheme matcolor<CR>", { desc = "set color scheme to matcolor" })


-- enable or disable GitHub Copilot
keymap.set(
	"n",
	"<leader>cd",
	":Copilot disable<CR>:echo 'Copilot disabled :|'<CR>",
	{ desc = "disable GitHub Copilot", silent = true }
)
keymap.set(
	"n",
	"<leader>ce",
	":Copilot enable<CR>:echo 'Copilot enabled :)'<CR>",
	{ desc = "enable GitHub Copilot", silent = true }
)

keymap.set("n", "<leader>cc", "<cmd>CopilotChatOpen<CR>", { silent = true })

--open terminal
keymap.set("n", "<leader>tt", "<cmd>belowright new<CR><cmd>terminal<CR><cmd>resize 10<CR>", { silent = true })
keymap.set("n", "<leader>att", "<cmd>vsplit<CR><cmd>terminal<CR><cmd>vertical resize 35<CR>", { silent = true })
keymap.set("t", "<esc>", "<cmd>lua close_termial()<CR>", { silent = true })
keymap.set("t", "jk", "<C-\\><C-n><C-w>p", { silent = true })
keymap.set("t", "jj", "<C-\\><C-n>", { silent = true })


keymap.set("n", "<C-Up>", ":resize -1<CR>", { desc = "resize horizontally", silent = true })
keymap.set("n", "<C-Down>", ":resize +1<CR>", { desc = "resize horizontally", silent = true })
keymap.set("n", "<C-right>", ":vertical resize -1<CR>", { desc = "resize vertically", silent = true })
keymap.set("n", "<C-left>", ":vertical resize +1<CR>", { desc = "resize vertically", silent = true })

