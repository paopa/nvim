return {
	-- https://github.com/nvim-neotest/neotest
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	keys = {
		{
			"<leader>nt",
			':lua require("neotest").run.run()<CR>',
			mode = "n",
			desc = "Run the nearest test",
		},
		{
			"<leader>ntd",
			':lua require("neotest").run.run({strategy = "dap"})<CR>',
			mode = "n",
			desc = "Debug the nearest test (requires nvim-dap and adapter support)",
		},
		{
			"<leader>no",
			':lua require("neotest").output_panel.open()<CR>',
			mode = "n",
			desc = "Records all output of tests over time in a single window",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({ args = { "--log-level", "DEBUG" } }),
			},
		})
	end,
}
