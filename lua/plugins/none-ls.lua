return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua formatter
			},
		})

		local opts = { noremap = true, silent = true }
		opts.desc = "Format Code"
		vim.keymap.set("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
		vim.keymap.set("v", "<leader>fc", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
	end,
}
