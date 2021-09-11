-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alpha2phi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/alpha2phi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/alpha2phi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/alpha2phi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alpha2phi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["alpha.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/alpha.nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\24config.auto-session\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-spell"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/cmp-tabnine"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config.dashboard\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  everforest = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/everforest"
  },
  fzf = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config.galaxyline\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["magma-nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config.magma\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/magma-nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neogit = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config.neogit\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n³\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\5\16diagnostics\rnvim_lsp\fnumbers\tboth\20show_close_icon\1\28show_buffer_close_icons\1\24show_tab_indicators\2\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.cmp\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rlspfuzzy\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config.treesitter\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\30treesitter-context.config\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-hint-textobject"] = {
    config = { "\27LJ\2\n¢\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0009vnoremap <silent> m :lua require('tsht').nodes()<CR>>omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-ts-hint-textobject"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/papercolor-theme"
  },
  playground = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-vimspector.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/telescope-vimspector.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config.telescope\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ultisnips = {
    config = { "\27LJ\2\n¦\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0†\1                let g:UltiSnipsJumpForwardTrigger=\"<c-j>\"\n                let g:UltiSnipsJumpBackwardTrigger=\"<c-k>\"\n            \bcmd\bvim\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-browser-search"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-browser-search"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-doge"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16config.doge\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-ultest"] = {
    config = { "require('config.test').setup()" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-ultest"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  vimspector = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vimspector"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config.which-key\frequire\0" },
    loaded = true,
    path = "/home/alpha2phi/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-doge
time([[Config for vim-doge]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16config.doge\frequire\0", "config", "vim-doge")
time([[Config for vim-doge]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\30treesitter-context.config\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n³\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\5\16diagnostics\rnvim_lsp\fnumbers\tboth\20show_close_icon\1\28show_buffer_close_icons\1\24show_tab_indicators\2\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\n¦\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0†\1                let g:UltiSnipsJumpForwardTrigger=\"<c-j>\"\n                let g:UltiSnipsJumpBackwardTrigger=\"<c-k>\"\n            \bcmd\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config.galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-ts-hint-textobject
time([[Config for nvim-ts-hint-textobject]], true)
try_loadstring("\27LJ\2\n¢\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0009vnoremap <silent> m :lua require('tsht').nodes()<CR>>omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>\bcmd\bvim\0", "config", "nvim-ts-hint-textobject")
time([[Config for nvim-ts-hint-textobject]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config.dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: magma-nvim
time([[Config for magma-nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config.magma\frequire\0", "config", "magma-nvim")
time([[Config for magma-nvim]], false)
-- Config for: telescope-frecency.nvim
time([[Config for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time([[Config for telescope-frecency.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-lspfuzzy
time([[Config for nvim-lspfuzzy]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rlspfuzzy\frequire\0", "config", "nvim-lspfuzzy")
time([[Config for nvim-lspfuzzy]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\24config.auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config.neogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: vim-ultest
time([[Config for vim-ultest]], true)
require('config.test').setup()
time([[Config for vim-ultest]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config.which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
