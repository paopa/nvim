return {
	-- https://github.com/szw/vim-maximizer
	"szw/vim-maximizer",
	event = "VeryLazy",
	keys = {
		{ "<leader>mt", ":MaximizerToggle<CR>", mode = "n", desc = "maximize the current window" },
	},
}
