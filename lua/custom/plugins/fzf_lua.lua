return {
    {
        "ibhagwan/fzf-lua",
        config = function()
            require("fzf-lua").setup({
                require("fzf-lua").register_ui_select(),
                defaults = {
                    file_icons = false
                }
            })

            vim.keymap.set("n", "<leader>fz", "<cmd>FzfLua builtin<CR>")
            vim.keymap.set("n", "<leader>fz", "<cmd>FzfLua builtin<CR>")
            vim.keymap.set("n", "<leader>af", "<cmd>FzfLua files<CR>")
            vim.keymap.set("n", "<leader>gf", "<cmd>FzfLua git_files<CR>")
            vim.keymap.set("n", "<leader>lg", "<cmd>FzfLua live_grep<CR>")
            vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua lgrep_curbuf<CR>")
        end
    }
}
