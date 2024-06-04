-- Git Blame
return {
	-- https://github.com/f-person/git-blame.nvim
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		date_format = "%m/%d/%y", -- more concise date format
		enabled = false,
	},
	keys = {
		{ "<leader>gb", "<cmd>GitBlameToggle<CR>", mode = "n", desc = "Toggle git blame" },
	},
}
