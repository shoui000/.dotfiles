return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gopls" },
			javascript = { "eslint_d" },
			ts = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			c = { "clang-format" },
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Formatar buffer" })
	end,
}
