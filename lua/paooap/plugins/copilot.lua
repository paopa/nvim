return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {},
        config = function()
          require("copilot").setup({
              suggestion = {
                  auto_trigger = true,
              },
              filetypes = {
                markdown = true,
                yaml = true,
                ["."] = true,
              },
          })
        end,
    },

}
