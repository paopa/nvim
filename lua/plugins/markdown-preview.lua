return {
	-- https://github.com/iamcco/markdown-preview.nvim
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", mode = "n", desc = "Toggle Markdown Preview" },
	},
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
