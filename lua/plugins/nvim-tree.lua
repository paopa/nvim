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
    filters = {
      git_ignored = false,
    },
  },
  keys = {
    { '<leader>ee', ':NvimTreeToggle<CR>',    desc = 'Toggle file explorer' },
    { '<leader>er', ':NvimTreeFocus<CR>',     desc = 'Toggle focus to file explorer' },
    { '<leader>ef', ':NvimTreeFindFile<CR>',  desc = 'Find file in file explorer' },

  },
  config = function(_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup(opts)
  end
}

-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
--
-- There are the Basic keymaps I think are useful:
--
-- `<C-]>`           CD
-- `<C-e>`           Open: In Place
-- `<C-k>`           Info
-- `<C-r>`           Rename: Omit Filename
-- `<C-t>`           Open: New Tab
-- `<C-v>`           Open: Vertical Split
-- `<C-x>`           Open: Horizontal Split
-- `<BS>`            Close Directory
-- `<CR>`            Open
-- `<Tab>`           Open Preview
-- `>`               Next Sibling
-- `<`               Previous Sibling
-- `.`               Run Command
-- `-`               Up
-- `a`               Create File Or Directory
-- `B`               Toggle Filter: No Buffer
-- `c`               Copy
-- `C`               Toggle Filter: Git Clean
-- `[c`              Prev Git
-- `]c`              Next Git
-- `d`               Delete
-- `D`               Trash
-- `E`               Expand All
-- `e`               Rename: Basename
-- `]e`              Next Diagnostic
-- `[e`              Prev Diagnostic
-- `F`               Live Filter: Clear
-- `f`               Live Filter: Start
-- `g?`              Help
-- `gy`              Copy Absolute Path
-- `ge`              Copy Basename
-- `H`               Toggle Filter: Dotfiles
-- `I`               Toggle Filter: Git Ignore
-- `J`               Last Sibling
-- `K`               First Sibling
-- `L`               Toggle Group Empty
-- `o`               Open
-- `O`               Open: No Window Picker
-- `p`               Paste
-- `P`               Parent Directory
-- `q`               Close
-- `r`               Rename
-- `R`               Refresh
-- `s`               Run System
-- `S`               Search
-- `u`               Rename: Full Path
-- `U`               Toggle Filter: Hidden
-- `W`               Collapse
-- `x`               Cut
-- `y`               Copy Name
-- `Y`               Copy Relative Path
