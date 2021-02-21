return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Development
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'wellle/targets.vim' }
  use { 'easymotion/vim-easymotion'}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Testing
  use { 'vim-test/vim-test' }

  -- Fuzzy finder
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-telescope/telescope.nvim' }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Snippets
  use { 'honza/vim-snippets' }
  use { 'SirVer/ultisnips' }
  -- use { 'norcalli/snippets.nvim' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }

  -- Better syntax
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } 
  use { 'nvim-treesitter/playground' }
  

  -- Note taking
  -- use { 'oberblastmeister/neuron.nvim' }
  -- use { 'junegunn/fzf', run = '-> fzf#install()' }
  -- use { 'junegunn/fzf.vim'}
  -- use { 'fiatjaf/neuron.vim' }

  -- Code action light bulb
  -- use { 'kosayoda/nvim-lightbulb' }

  -- Embed in browser
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- OSC 52 yank
  -- use { 'ojroques/vim-oscyank' }

  -- Jupyter Vim
   --use { 'jupyter-vim/jupyter-vim' }

  -- Scratch pad
  -- use { 'metakirby5/codi.vim' }

  -- Slime
  -- use { 'jpalardy/vim-slime' }

  -- Latex
  -- use { 'lervag/vimtex' }

  -- Floaterm
  -- use { 'voldikss/vim-floaterm' }

  -- Neoterm
  -- use { 'kassio/neoterm' }

  -- NeoFormat
  -- use { 'sbdchd/neoformat' }

  -- Better terminal
  -- use { 'nikvdp/neomux' }

end)

