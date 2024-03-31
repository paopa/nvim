return {
  -- LSP Management
  -- https://github.com/williamboman/mason.nvim
  "williamboman/mason.nvim",
  dependencies = {
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { "williamboman/mason-lspconfig.nvim" },
    -- Install or upgrade all of the third-part tools.
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      -- Install these LSPs automatically
      ensure_installed = {
        "bashls", -- requires npm to be installed
        "lua_ls",
        "jsonls", -- requires npm to be installed
        "lemminx",
        "marksman",
        "yamlls", -- requires npm to be installed
        "ruff_lsp", -- python linter and formatter
        "pyright", -- python language server
      },
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {
        "stylua", -- lua formatter
        "debugpy", -- dap for python
        "checkmake", -- makefile
      },
    })

    vim.keymap.set(
      "n",
      "<leader>ma",
      "<cmd>Mason<CR>",
      { noremap = true, silent = true, desc = "Open Mason Management" }
    )
  end,
}
