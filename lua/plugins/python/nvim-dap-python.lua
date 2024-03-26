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
    -- I use vertual environment, so everytime change the project that have to install
    -- the `debugpy` in the virtual environment.
		local path = require("venv-selector").get_active_path()
		require("dap-python").setup(path)
	end,
}
