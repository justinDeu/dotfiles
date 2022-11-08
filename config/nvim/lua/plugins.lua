local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Code Activity Tracking
    use 'wakatime/vim-wakatime'

    -- LSP
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use {'williamboman/nvim-lsp-installer',
        requires = "neovim/nvim-lspconfig",
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("nvim-lsp-installer").setup {}
                local lspconfig = require("lspconfig")
                lspconfig.sumneko_lua.setup {}
            end
        }
    }
    use 'neovim/nvim-lspconfig'

    -- Telescope
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'}
    use {"nvim-telescope/telescope-project.nvim"}
    use {
        "folke/trouble.nvim",
          requires = "kyazdani42/nvim-web-devicons",
          config = function()
            require("trouble").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            }
          end
    }

    -- Auto complete
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'

    -- Color Theme
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'sheerun/vim-polyglot'
    use { 'sonph/onehalf', rtp='vim' }
    use 'sainnhe/sonokai'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Nvim-Tree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Fix my whitespaces
    use {"ntpeters/vim-better-whitespace"}

    -- Black python formatter
    use {"psf/black"}
end)
