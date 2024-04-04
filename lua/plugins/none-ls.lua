return {
  -- https://github.com/nvimtools/none-ls.nvim
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
      -- take a look at the list to see what you can use
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- makefile
        null_ls.builtins.diagnostics.checkmake,
        -- python
        null_ls.builtins.diagnostics.pylint,
        -- https://github.com/ThePrimeagen/refactoring.nvim
        null_ls.builtins.code_actions.refactoring,
      },
    })

    local opts = { noremap = true, silent = true }
    opts.desc = "Format Code"
    vim.keymap.set("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
    vim.keymap.set("v", "<leader>fc", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
  end,
}
