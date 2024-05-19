return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd("Git -c push.default=current push")
        end)
        vim.keymap.set("n", "<leader>gu", function()
            vim.cmd("G pull")
        end)
    end,
}
