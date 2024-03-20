return {
  -- https://github.com/linux-cultist/venv-selector.nvim
  'linux-cultist/venv-selector.nvim',
  fp = 'python',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
    name = {".venv"},
    -- auto_refresh = false
  },
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>pvs', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>pvc', '<cmd>VenvSelectCached<cr>' },
  },
}
