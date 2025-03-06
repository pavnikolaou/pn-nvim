-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig
--
-- :LspInfo
-- :h vim.lsp.buf
--

return {
    -- https://github.com/williamboman/mason.nvim
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls" },
            })
        end,
    },

    -- https://github.com/neovim/nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.ts_ls.setup({

                capabilities = capabilities
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
