return {
  -- LSP Management
  -- https://github.com/williamboman/mason.nvim
  'williamboman/mason.nvim',
  dependencies = {
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },
    -- Install or upgrade all of the third-part tools.
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
  },
  config = function()
    require('mason').setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {
        'bashls', -- requires npm to be installed
        -- 'cssls', -- requires npm to be installed
        -- 'html', -- requires npm to be installed
        'lua_ls',
        'jsonls', -- requires npm to be installed
        'lemminx',
        'marksman',
        'quick_lint_js',
        'yamlls', -- requires npm to be installed
        'pyright',
      },
      automatic_installation = true,
    })

    require('mason-tool-installer').setup({
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {
        'black',
        'debugpy',
        'flake8',
        'isort',
        'mypy',
        'pylint',
      },
    })

    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ma", "<cmd>Mason<CR>", { noremap = true, silent = true, desc = 'Open Mason Management' })

    -- There is an issue with mason-tools-installer running with VeryLazy,
    -- since it triggers on VimEnter which has already occurred prior to this plugin loading
    -- so we need to call install explicitly
    -- but I change it so I think we can remove this later
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
    -- vim.api.nvim_command('MasonToolsInstall')
  end
}
