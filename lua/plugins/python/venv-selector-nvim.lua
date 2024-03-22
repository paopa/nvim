return {
  -- https://github.com/linux-cultist/venv-selector.nvim
  'linux-cultist/venv-selector.nvim',
  fp = 'python',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
    name = { ".venv" },
    -- auto_refresh = false
  },
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>pvs', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>pvc', '<cmd>VenvSelectCached<cr>' },
  },
  config = function(_, opts)
    require('venv-selector').setup(opts)
    vim.api.nvim_create_autocmd(
    -- the plugin docs uses VimEnter but I prefer BufReadPre
      { 'BufReadPre' },
      {
        desc = 'Auto select virtualenv Nvim open',
        pattern = '*',
        callback = function()
          local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
          if venv ~= '' then
            require('venv-selector').retrieve_from_cache()
          end
        end,
        once = true,
      })
  end
}
-- I used this plugin to manage the virtualenvs to control which python interpreter to use for a project.
-- and using code runner plugin to run the code with the selected interpreter.
