return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    "tsserver",
                    "html",
                    "emmet_language_server",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        usePlaceholders = true,
                        completeUnimported = true,
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            })

            lspconfig.tsserver.setup({
                capabilities = capabilities,
                init_options = {
                    preferences = {
                        disableSuggestions = true,
                    },
                },
            })

            lspconfig.html.setup({
                capabilities = capabilities,
                filetypes = { "html", "templ", "htmldjango" },
            })
            lspconfig.templ.setup({
                vim.filetype.add({ extension = { templ = "templ" } }),
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            lspconfig.volar.setup({
                capabilities = capabilities,
                filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
                init_options = {
                    vue = {
                        hybridMode = false,
                    },
                    typescript = {
                        tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
                    },
                },
            })

            -- keymaps
            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, opts)
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover()
            end, opts)
            vim.keymap.set("n", "<leader>ws", function()
                vim.lsp.buf.workspace_symbol()
            end, opts)
            vim.keymap.set("n", "<leader>ca", function()
                vim.lsp.buf.code_action()
            end, opts)
            vim.keymap.set("n", "<leader>cr", function()
                vim.lsp.buf.references()
            end, opts)
            vim.keymap.set("n", "<leader>rn", function()
                vim.lsp.buf.rename()
            end, opts)
            vim.keymap.set("i", "<C-h>", function()
                vim.lsp.buf.signature_help()
            end, opts)
        end,
    },
}
