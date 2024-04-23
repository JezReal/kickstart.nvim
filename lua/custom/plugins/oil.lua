return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            columns = {},
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<C-h>"] = false,
                ["<C-s>"] = false,
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
