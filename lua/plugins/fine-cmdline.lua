return {
  -- https://github.com/vonheikemen/fine-cmdline.nvim
  "VonHeikemen/fine-cmdline.nvim",
  requires = {
    { "MunifTanjim/nui.nvim" },
  },
  config = function()
    vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
  end,
}
