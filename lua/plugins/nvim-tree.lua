-- File Explorer / Tree
return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- Fancy icon support
  },
  opts = {
    actions = {
      open_file = {
        window_picker = {
          enable = false
        },
      }
    },
  },
  config = function (_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup(opts)

    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
    keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
    keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer
  end
}
