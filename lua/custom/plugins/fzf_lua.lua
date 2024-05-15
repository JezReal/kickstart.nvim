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

            vim.keymap.set("n", "<leader>fz", function()
                vim.cmd("FzfLua builtin")
            end)
            vim.keymap.set("n", "<leader>af", function()
                vim.cmd("FzfLua files")
            end)
            vim.keymap.set("n", "<leader>gf", function()
                vim.cmd("FzfLua git_files")
            end)
            vim.keymap.set("n", "<leader>lg", function()
                vim.cmd("FzfLua live_grep")
            end)
            vim.keymap.set("n", "<leader>fg", function()
                vim.cmd("FzfLua lgrep_curbuf")
            end)
        end
    }
}
