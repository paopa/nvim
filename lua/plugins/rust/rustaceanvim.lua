return {
	-- https://github.com/mrcjkb/rustaceanvim
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false, -- This plugin is already lazy
	ft = "rust",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		vim.g.rustaceanvim = {
			dap = {
				autoload_configurations = true,
			},
		}
	end,
}
