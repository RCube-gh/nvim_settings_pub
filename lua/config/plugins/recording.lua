--enhance the usage of macros in neovim
return {
	"chrisgrieser/nvim-recorder",
	dependencies = "rcarriga/nvim-notify", -- optional
	opts = {
		slots={"a","b","c"},
		mapping={
			startStopRecording = "<c-m-q>",
			playMacro = "Q",
			switchSlot = "<leader><C-q>",
			editMacro = "<leader>eq",
			deleteAllMacros = "<leader>dq",
		},
	}, -- required even with default settings, since it calls `setup()`
}
