return {
	-- https://github.com/nvim-neo-tree/neo-tree.nvim
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
		{ "<leader>ee", ":Neotree<CR>", desc = "Toggle file explorer" },
	},
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    }
  }
}
