return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "*",
			highlight_group = "Comment",
			patterns = {
				{
					file_pattern = {
						".env*",
						"env.toml",
					},
					cloak_pattern = "=.+",
				},
			},
		})

		vim.keymap.set("n", "<leader>ct", "<cmd>CloakToggle<CR>")
	end,
}
