-- I used this plugin to manage the virtualenvs to control which python interpreter to use for a project.
-- and using code runner plugin to run the code with the selected interpreter.

return {
    -- https://github.com/linux-cultist/venv-selector.nvim/tree/regexp
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	fp = "python",
	lazy = false,
	branch = "regexp", -- This is the regexp branch, use this for the new version
	config = function()
		require("venv-selector").setup()
	end,
	keys = {
		{ ",v", "<cmd>VenvSelect<cr>" },
	},
}
