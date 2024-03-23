return {
	-- https://github.com/nvimtools/none-ls.nvim
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
        -- lua
				null_ls.builtins.formatting.stylua, -- formatter
        -- python
        null_ls.builtins.formatting.ruff_lsp -- linter, formatter
			},
		})

		local opts = { noremap = true, silent = true }
		opts.desc = "Format Code"
		vim.keymap.set("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
		vim.keymap.set("v", "<leader>fc", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
	end,
}
