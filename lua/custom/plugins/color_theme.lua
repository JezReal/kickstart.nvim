return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            transparent = false
        })
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
        vim.cmd("colorscheme tokyonight-moon")
    end,
}
