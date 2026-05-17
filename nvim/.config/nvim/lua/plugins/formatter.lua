return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "eslint_d", "prettier", stop_after_first = true },
            typescript = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)

        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({
                async = true,
                lsp_fallback = true
            })
        end, { desc = "Formatar buffer" })
    end,
}
