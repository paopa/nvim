return {
	-- https://github.com/nvim-pack/nvim-spectre
	"nvim-pack/nvim-spectre",
	keys = {
		{
			"<leader>S",
			"<cmd>lua require('spectre').toggle()<CR>",
			mode = "n",
			desc = "Toggle Spectre",
		},
		{
			"<leader>Sw",
			"<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
			mode = "n",
			desc = "Search current word",
		},
		{
			"<leader>Sw",
			"<esc><cmd>lua require('spectre').open_visual()<CR>",
			mode = "v",
			desc = "Search current word",
		},
		{
			"<leader>Sp",
			"<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
			mode = "n",
			desc = "Search on current file",
		},
	},
}
