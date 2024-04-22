return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope/builtin")
            vim.keymap.set("n", "<leader>af", builtin.find_files, {})
            vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
            --- Install ripgrep for this to work
            vim.keymap.set("n", "<leader>gr", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)

            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '-u' -- thats the new thing
                    },
                },
                pickers = {
                    find_files = {
                        disable_devicons = true,
                    },
                    git_files = {
                        disable_devicons = true,
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
