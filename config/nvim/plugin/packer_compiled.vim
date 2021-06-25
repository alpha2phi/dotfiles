" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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
local package_path_str = "/Users/joehannes/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/joehannes/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/joehannes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/joehannes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/joehannes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["Dusk-til-Dawn.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/Dusk-til-Dawn.nvim"
  },
  ale = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["async-clj-omni"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/async-clj-omni"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["bufutils.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/bufutils.vim"
  },
  chadtree = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["codicons.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/codicons.nvim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  conjure = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/conjure"
  },
  edge = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/edge"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  everforest = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/everforest"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nÕ\n\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3è\a\fkeymaps\tn [h\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]h\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\vbuffer\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\fnoremap\2\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\nsigns\1\0\a\22use_internal_diff\2\23use_decoration_api\2\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\1\vlinehl\1\nnumhl\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\bâ”‚\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["indent-guides.nvim"] = {
    config = { "\27LJ\2\nØ\1\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0B\0\1\1K\0\1\0\25indent_guides_enable\15odd_colors\1\0\2\abg\f#e7e7fc\afg\f#e7e7fc\16even_colors\1\0\1\22indent_guide_size\3\4\1\0\2\abg\f#d3d3e7\afg\f#d3d3e7\nsetup\18indent_guides\frequireØ\1\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0B\0\1\1K\0\1\0\25indent_guides_enable\15odd_colors\1\0\2\abg\f#3b314d\afg\f#3b314d\16even_colors\1\0\1\22indent_guide_size\3\4\1\0\2\abg\f#444155\afg\f#444155\nsetup\18indent_guides\frequireK\1\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0003\3\4\0B\0\3\2B\0\1\1K\0\1\0\0\0\ftimeMan\18Dusk-til-Dawn\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/monokai.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neogit = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neogit"
  },
  neoranger = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neoranger"
  },
  ["neuron.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neuron.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/papercolor-theme"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/parinfer-rust"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["reply.vim"] = {
    commands = { "'Repl', 'ReplAuto'" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/reply.vim"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\nx\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15theme_conf\1\0\1\vborder\1\1\0\2\17shorten_path\1\14previewer\2\nsetup\17session-lens\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  sexp = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/sexp"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-node-modules.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-node-modules.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope-snippets.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-snippets.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-ultisnips.nvim"
  },
  ["telescope-vim-bookmarks.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-vim-bookmarks.nvim"
  },
  ["telescope-vimspector.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-vimspector.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/unicode.vim"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
  },
  ["vim-browser-search"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-browser-search"
  },
  ["vim-cljfmt"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-cljfmt"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dasht"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-dasht"
  },
  ["vim-delete-hidden-buffers"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-delete-hidden-buffers"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-monokai-tasty"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-monokai-tasty"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rest-console"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-rest-console"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sexp-mappings-for-regular-people"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-sexp-mappings-for-regular-people"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-clipboard"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-tmux-clipboard"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-wakatime"
  },
  ["vim-wintabs"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-wintabs"
  },
  ["vim-wintabs-powerline"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-wintabs-powerline"
  },
  vimspector = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vimspector"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vscode-javascript"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-guides.nvim
time([[Config for indent-guides.nvim]], true)
try_loadstring("\27LJ\2\nØ\1\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0B\0\1\1K\0\1\0\25indent_guides_enable\15odd_colors\1\0\2\abg\f#e7e7fc\afg\f#e7e7fc\16even_colors\1\0\1\22indent_guide_size\3\4\1\0\2\abg\f#d3d3e7\afg\f#d3d3e7\nsetup\18indent_guides\frequireØ\1\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0B\0\1\1K\0\1\0\25indent_guides_enable\15odd_colors\1\0\2\abg\f#3b314d\afg\f#3b314d\16even_colors\1\0\1\22indent_guide_size\3\4\1\0\2\abg\f#444155\afg\f#444155\nsetup\18indent_guides\frequireK\1\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0003\3\4\0B\0\3\2B\0\1\1K\0\1\0\0\0\ftimeMan\18Dusk-til-Dawn\frequire\0", "config", "indent-guides.nvim")
time([[Config for indent-guides.nvim]], false)
-- Config for: telescope-frecency.nvim
time([[Config for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time([[Config for telescope-frecency.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nÕ\n\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3è\a\fkeymaps\tn [h\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]h\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\vbuffer\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\fnoremap\2\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\nsigns\1\0\a\22use_internal_diff\2\23use_decoration_api\2\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\1\vlinehl\1\nnumhl\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\bâ”‚\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: session-lens
time([[Config for session-lens]], true)
try_loadstring("\27LJ\2\nx\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15theme_conf\1\0\1\vborder\1\1\0\2\17shorten_path\1\14previewer\2\nsetup\17session-lens\frequire\0", "config", "session-lens")
time([[Config for session-lens]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file 'Repl', 'ReplAuto' lua require("packer.load")({'reply.vim'}, { cmd = "'Repl', 'ReplAuto'", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
