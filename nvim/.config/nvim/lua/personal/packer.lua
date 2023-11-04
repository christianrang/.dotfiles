-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use('stevearc/aerial.nvim')

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context')
  use('towolf/vim-helm')

  use({ 'fatih/vim-go', run = ':GoUpdateBinaries' })

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('numToStr/Comment.nvim')
  use('scrooloose/nerdtree')
  use('nvim-tree/nvim-web-devicons')
  use('ThePrimeagen/vim-be-good')
  use('lewis6991/gitsigns.nvim')
  use({ 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' })

  use('alvan/vim-closetag')

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use("folke/zen-mode.nvim")

  -- Colorschemes
  use('morhetz/gruvbox')
  use('junegunn/seoul256.vim')
  use('haxibami/urara.vim')
  use('folke/tokyonight.nvim')
  use { "catppuccin/nvim", as = "catppuccin" }

  use({
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {}
    end
  })

  use('Yggdroot/indentLine')

  use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons',
      opt = true},
  }

  use({
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end
  })

  -- use {'ray-x/go.nvim',
  -- requires = {
  --     {'ray-x/guihua.lua'},
  --     {'neovim/nvim-lspconfig'},
  --     {'mfussenegger/nvim-dap'},
  --     {'rcarriga/nvim-dap-ui'},
  --     {'theHamsta/nvim-dap-virtual-text'}
  --   },
  -- }

  use('RishabhRD/popfix')
  use('RishabhRD/nvim-cheat.sh')

  use("ellisonleao/glow.nvim")

  use({
    'jakewvincent/mkdnflow.nvim',
    rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    config = function()
      require('mkdnflow').setup()
    end
  })

  use({ 'michaelb/sniprun', run = 'bash ./install.sh' })
  use('rcarriga/nvim-notify')

  use('github/copilot.vim')

  use('tpope/vim-surround')
end)
