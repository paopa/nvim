return {
  -- https://github.com/akinsho/toggleterm.nvim
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "tab",
  },
  keys = {
    { "<leader>tt", ":ToggleTerm<CR>",            mode = "n", desc = "open terminal" },
    { "<leader>t1", ":1ToggleTerm<CR>",            mode = "n", desc = "open terminal" },
    { "<leader>t2", ":2ToggleTerm<CR>",            mode = "n", desc = "open terminal" },
    -- I saw the answer to solve how to exit terminal in the neovim in the following link
    -- https://www.reddit.com/r/neovim/comments/wk1vcc/how_to_exit_terminal_or_float_term/
    { "<C-t>",      "<C-\\><C-n>", mode = "t", desc = "escape terminal mode" },
    {
      "<leader>lg",
      "<cmd>lua _lazygit_toggle()<CR>",
      mode = "n",
      { noremap = true, silent = true },
      desc = "lazygit",
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- lazygit
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end,
}
