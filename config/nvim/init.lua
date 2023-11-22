require('core')
require('plugins')

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

require("lazy").setup({
    {"olimorris/onedarkpro.nvim", priority=1000},
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {'theprimeagen/harpoon'},
  {'tpope/vim-fugitive'},
  {'nvim-treesitter/nvim-treesitter'},
  { 'nvim-telescope/telescope.nvim', dependencies={'nvim-lua/plenary.nvim'}},
  {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  },
 { 'nvim-lualine/lualine.nvim'},
 {'nvim-tree/nvim-tree.lua'},
  {"lewis6991/gitsigns.nvim"},
})
