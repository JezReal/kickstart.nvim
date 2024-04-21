return {
    "nvimtools/none-ls.nvim",
    commit = "2236d2bf621b64ccbceebc452137b25ecc7f6228",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.eslint_d,
                null_ls.builtins.diagnostics.golangci_lint,
            },
        })
    end,
}
