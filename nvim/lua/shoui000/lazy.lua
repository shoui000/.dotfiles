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

    {'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ...},

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
