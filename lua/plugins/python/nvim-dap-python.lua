return {
	-- https://github.com/mfussenegger/nvim-dap-python
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"linux-cultist/venv-selector.nvim",
	},
	config = function()
		-- Update the path passed to setup to point to your system or virtual env python binary
		local path = require("venv-selector").get_active_path()
		require("dap-python").setup(path)
	end,
}
