local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	install = {
		missing = true,
		colorscheme = {'dracula'}
	}
}

require("lazy").setup({

	{'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},

	{'maxmx03/dracula.nvim',
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function ()
		local dracula = require 'dracula'

		dracula.setup()

		vim.cmd.colorscheme 'dracula'
	end},

	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"ThePrimeagen/harpoon"},
	{"mbbill/undotree"},
	{"tpope/vim-fugitive"},

	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

    {'ThePrimeagen/vim-be-good'},
    {'vim-airline/vim-airline'},
    {'tpope/vim-commentary'},
}, opts)
