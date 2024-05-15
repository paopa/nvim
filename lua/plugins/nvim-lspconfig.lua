-- LSP Support
return {
    -- LSP Configuration
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- Useful status updates for LSP
        -- https://github.com/j-hui/fidget.nvim
        { "j-hui/fidget.nvim",                   opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        -- https://github.com/folke/neodev.nvim
        { "folke/neodev.nvim" },
        -- https://github.com/antosha417/nvim-lsp-file-operations
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "stevanmilic/nvim-lspimport" },
    },
    config = function()
        require("neodev").setup({})

        local lspconfig = require("lspconfig")

        local keymap = vim.keymap -- for conciseness
        local opts = { noremap = true, silent = true }

        -- LSP mappings
        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "Signature help"
        keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- signature help

        opts.desc = "Document symbol"
        keymap.set("n", "<leader>ds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts) -- document symbol

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        -- see https://github.com/prabirshrestha/vim-lsp/issues/434
        opts.desc = "Go back"
        keymap.set("n", "gb", "<C-O>", opts) -- Go back from definition, declaration, etc

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        -- Lua LSP settings
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })

        -- JSON LSP settings
        lspconfig.jsonls.setup({
            capabilities = capabilities,
        })

        -- markdown LSP settings
        lspconfig.marksman.setup({
            capabilities = capabilities,
        })

        -- YAML LSP settings marksman
        lspconfig.yamlls.setup({
            capabilities = capabilities,
        })

        -- Ruff LSP settings
        lspconfig.ruff_lsp.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                if client.name == "ruff_lsp" then
                    -- Disable hover in favor of Pyright
                    client.server_capabilities.hoverProvider = false
                end
            end,
        })

        -- Pyright LSP settings
        lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
                pyright = {
                    -- Using Ruff's import organizer
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        -- Ignore all files for analysis to exclusively use Ruff for linting
                        ignore = { "*" },
                    },
                },
            },
        })

        -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
        local open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or "rounded" -- Set border to rounded
            return open_floating_preview(contents, syntax, opts, ...)
        end
    end,
}
