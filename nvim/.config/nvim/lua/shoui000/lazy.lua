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
    }
}

require("lazy").setup({

    {'nvim-tree/nvim-tree.lua'},
    {'nvim-tree/nvim-web-devicons'},

    {'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},

    {'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ...},
    {'vim-airline/vim-airline-themes'},

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
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },

    {'m4xshen/smartcolumn.nvim'},

    {'ThePrimeagen/vim-be-good'},
    {'vim-airline/vim-airline'},
    {'tpope/vim-commentary'},

    {'epwalsh/obsidian.nvim', version = '*', dependencies = {"nvim-lua/plenary.nvim",},},

}, opts)
