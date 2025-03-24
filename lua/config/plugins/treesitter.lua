local autotag = require("nvim-ts-autotag")
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"cpp",--added this and now I can see rainbow in cpp code
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
				colors = {
					"#FFDD00", -- Yellow
					-- "#DDDDDD", -- Grey
					"#FFC0CB", --pink
					"#87CEEB", -- Blue
					-- "#FF7F00", -- Orange
					-- "#00FF00", -- Green

					-- "#FF0000", -- Red
					-- "#4B0082", -- Indigo
					-- "#9400D3", -- Violet
				}, -- table of hex strings
				termcolors = {
					"Red",
					"Yellow",
					"Green",
					"Cyan",
					"Blue",
					"Magenta",
					"White",
				}, -- table of colour name strings
			},
		})
		autotag.setup()
	end,
}
