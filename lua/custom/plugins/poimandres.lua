return {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("poimandres").setup({})
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
        vim.cmd("colorscheme poimandres")
    end,
}
