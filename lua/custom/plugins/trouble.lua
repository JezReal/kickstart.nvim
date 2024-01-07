return {
	"folke/trouble.nvim",
	opts = {
		icons = false,
		fold_open = "v",
		fold_closed = ">",
		indent_lines = false,
		signs = {
			error = "error",
			warning = "warn",
			hint = "hint",
			information = "info",
		},
		use_diagnostic_signs = false,
	},
	config = function()
		vim.keymap.set("n", "<leader>tr", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>tw", function()
			require("trouble").toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>td", function()
			require("trouble").toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>tf", function()
			require("trouble").toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>tl", function()
			require("trouble").toggle("loclist")
		end)
		vim.keymap.set("n", "tlr", function()
			require("trouble").toggle("lsp_references")
		end)
	end,
}
