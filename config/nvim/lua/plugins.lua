return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Fuzzy finder
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-telescope/telescope.nvim' }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }

  -- Better syntax
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } 
  
  -- Fugitive for Git
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-fugitive' }


  -- Note taking
  -- use { 'oberblastmeister/neuron.nvim' }
  use { 'junegunn/fzf.vim' }
  use { 'fiatjaf/neuron.vim' }


  -- Embed in browser
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

end)

