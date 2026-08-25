return {
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			keymaps = {
				["g."] = { "actions.toggle_hidden", mode = "n"},
				["<BS>"] = { "actions.parent", mode = "n"},
			}
		},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		init = function()
			vim.api.nvim_create_user_command('Ex', function()
				require('oil').open()
			end, {})
		end
	}
}
