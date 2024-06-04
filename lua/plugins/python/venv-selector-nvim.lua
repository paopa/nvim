-- I used this plugin to manage the virtualenvs to control which python interpreter to use for a project.
-- and using code runner plugin to run the code with the selected interpreter.

-- see https://github.com/linux-cultist/venv-selector.nvim/tree/main?tab=readme-ov-file#hooks
--- @param venv_path string A string containing the absolute path to selected virtualenv
--- @param venv_python string A string containing the absolute path to python binary in selected venv
local function python_path_env(venv_path, venv_python)
	-- Set the PYTHONPATH to include the selected virtualenv's site-packages directory
	local version = io.popen(venv_python .. " --version"):read("*a"):match("Python (%d+.%d+)")
	local lib_path = venv_path .. "/lib/python" .. version .. "/site-packages"

	-- Add the working directory to the PYTHONPATH as well
	local project_path = vim.fn.getcwd()
	vim.fn.setenv("PYTHONPATH", lib_path .. ":" .. project_path)
end

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
	opts = {
		name = { ".venv", "venv" },
		dap_enabled = true,
		-- auto_refresh = false
		changed_venv_hooks = { python_path_env },
	},
}
