return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	config = true,
	-- on a word, ys iw " ,then you can add double quote on the word
	-- on a word in "" cs " ' ,then you can change " to '
}
