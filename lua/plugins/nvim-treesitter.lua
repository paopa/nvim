-- Code Tree Support / Syntax Highlighting
return {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    opts = {
        highlight = {
            enable = true,
        },
        indent = { enable = true },
        auto_install = true, -- automatically install syntax support when entering new file type buffer
        ensure_installed = {
            "lua",
            "python",
            "just",
        },
    },
    config = function(_, opts)
        -- treesitter loads the opts in the config moudle and not the main module
        require("nvim-treesitter.configs").setup(opts)
    end,
}
