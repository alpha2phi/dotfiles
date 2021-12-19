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
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ale = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  aniseed = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/aniseed",
    url = "https://github.com/Olical/aniseed"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bufutils.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/bufutils.vim",
    url = "https://github.com/smitajit/bufutils.vim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cheat.sh-vim",
    url = "https://github.com/dbeniamine/cheat.sh-vim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-look",
    url = "https://github.com/octaltree/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["codicons.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/codicons.nvim",
    url = "https://github.com/mortepau/codicons.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  edge = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/edge",
    url = "https://github.com/sainnhe/edge"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  everforest = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  firenvim = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["floobits-neovim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/floobits-neovim",
    url = "https://github.com/Floobits/floobits-neovim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nfocus\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/NTBBloodbath/galaxyline.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\nç\6\0\0\a\0 \0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\3=\3\b\0025\3\v\0006\4\0\0'\6\t\0B\4\2\0029\4\n\4=\4\f\0036\4\0\0'\6\t\0B\4\2\0029\4\r\4=\4\14\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\16\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\17\0036\4\0\0'\6\t\0B\4\2\0029\4\18\4=\4\19\0036\4\0\0'\6\t\0B\4\2\0029\4\20\4=\4\21\0036\4\0\0'\6\t\0B\4\2\0029\4\22\4=\4\23\0036\4\0\0'\6\t\0B\4\2\0029\4\24\4=\4\25\0036\4\0\0'\6\t\0B\4\2\0029\4\26\4=\4\27\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\29\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\14callbacks\25git.savannah.gnu.org\19git.kernel.org\22get_cgit_type_url\15repo.or.cz\26get_repoorcz_type_url\22git.launchpad.net\27get_launchpad_type_url\14git.sr.ht\22get_srht_type_url\16try.gogs.io\22get_gogs_type_url\18bitbucket.org\27get_bitbucket_type_url\17codeberg.org\17try.gitea.io\23get_gitea_type_url\15gitlab.com\24get_gitlab_type_url\15github.com\1\0\0\24get_github_type_url\20gitlinker.hosts\topts\1\0\0\20action_callback\22copy_to_clipboard\22gitlinker.actions\1\0\2$add_current_line_on_normal_mode\2\14print_url\2\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nø\n\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\tn [h\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]h\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\vbuffer\2\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\nsigns\1\0\6\nnumhl\1\22use_internal_diff\2\vlinehl\1\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\2\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/npxbr/glow.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\nÅ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\21default_mappings\2\fopacity\3\n\20dismiss_on_move\2\22resizing_mappings\2\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  hop = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/hop",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-guides.nvim"] = {
    config = { "\27LJ\2\nä\3\0\0\4\0\17\0#6\0\0\0009\0\1\0009\0\2\0\18\2\0\0009\0\3\0B\0\2\2\a\0\4\0X\0\vÄ6\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1X\0\nÄ6\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\14\0005\3\r\0=\3\n\0025\3\15\0=\3\f\2B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\16\0B\0\1\1K\0\1\0\25indent_guides_enable\1\0\2\abg\f#cdcdcd\afg\f#cdcdcd\1\0\1\22indent_guide_size\3\1\1\0\2\abg\f#5d4d7a\afg\f#5d4d7a\15odd_colors\1\0\2\abg\f#333333\afg\f#333333\16even_colors\1\0\1\22indent_guide_size\3\1\1\0\2\abg\f#FC5C94\afg\f#FC5C94\nsetup\18indent_guides\frequire\nlight\bget\15background\bopt\bvim\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/indent-guides.nvim",
    url = "https://github.com/glepnir/indent-guides.nvim"
  },
  ["iron.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/iron.nvim",
    url = "https://github.com/hkupty/iron.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\niswap\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/iswap.nvim",
    url = "https://github.com/mizlan/iswap.nvim"
  },
  ["kat.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/kat.nvim",
    url = "https://github.com/joehannes-ux/kat.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lush-jsx.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lush-jsx.nvim",
    url = "https://github.com/joehannes-ux/lush-jsx.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\nÿ\n\0\0\4\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\15bookmark_9\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 9) \15bookmark_8\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 8) \15bookmark_7\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 7) \15bookmark_6\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 6) \15bookmark_5\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 5) \15bookmark_4\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 4) \15bookmark_3\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 3) \15bookmark_2\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 2) \15bookmark_1\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 1) \15bookmark_0\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 0) \rmappings\1\0\0\1\0)\19prev_bookmark7\b[m7\19next_bookmark6\b]m6\18set_bookmark8\am8\21delete_bookmark6\bmd6\21delete_bookmark8\bmd8\18set_bookmark6\am6\19next_bookmark8\b]m8\19prev_bookmark5\b[m5\19prev_bookmark8\b[m8\19next_bookmark5\b]m5\18set_bookmark9\am9\21delete_bookmark5\bmd5\21delete_bookmark9\bmd9\18set_bookmark5\am5\19next_bookmark9\b]m9\19prev_bookmark4\b[m4\19prev_bookmark9\b[m9\19next_bookmark4\b]m4\21delete_bookmark4\bmd4\18set_bookmark4\am4\19prev_bookmark3\b[m3\19next_bookmark3\b]m3\21delete_bookmark3\bmd3\18set_bookmark3\am3\19prev_bookmark2\b[m2\19next_bookmark2\b]m2\21delete_bookmark2\bmd2\18set_bookmark2\am2\19prev_bookmark1\b[m1\19next_bookmark1\b]m1\21delete_bookmark1\bmd1\18set_bookmark1\am1\19prev_bookmark0\b[m0\19next_bookmark0\b]m0\21delete_bookmark0\bmd0\18set_bookmark0\am0\20delete_bookmark\bmd.\19next_bookmark7\b]m7\21delete_bookmark7\bmd7\18set_bookmark7\am7\19prev_bookmark6\b[m6\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentau/marks.nvim"
  },
  melange = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/melange",
    url = "https://github.com/savq/melange"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/monokai.nvim",
    url = "https://github.com/tanvirtin/monokai.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neon = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neon",
    url = "https://github.com/rafamadriz/neon"
  },
  neoranger = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neoranger",
    url = "https://github.com/lokaltog/neoranger"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nest.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nest.nvim",
    url = "https://github.com/LionC/nest.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nñ\3\0\0\6\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0B\3\2\2'\4\b\0&\3\4\3=\3\t\0025\3\n\0=\3\v\0025\3\14\0005\4\f\0004\5\0\0=\5\r\4=\4\15\0035\4\16\0004\5\0\0=\5\r\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\tkeys\6n\1\0\3\npaste\6p\17paste_behind\6P\vselect\t<cr>\6i\1\0\0\vcustom\1\0\3\npaste\n<c-p>\17paste_behind\n<c-P>\vselect\t<cr>\ron_paste\1\0\1\fset_reg\1\fdb_path\31/databases/neoclip.sqlite3\tdata\fstdpath\afn\bvim\1\0\5\30enable_persistant_history\2\24content_spec_column\1\fhistory\3Ë\a\fpreview\2\21default_register\6\"\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nï\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rpatterns\1\b\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\1\0\1\venable\2\nsetup\30treesitter-context.config\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\nÜ\20\0\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\a\3=\3\20\2B\0\2\1K\0\1\0\rmappings\1\0\n\15prev_entry\6k\15next_entry\6j\18toggle_viewed\20<leader><space>\21close_review_tab\n<C-c>\22select_prev_entry\a[q\17toggle_files\14<leader>b\22select_next_entry\a]q\16focus_files\14<leader>e\18refresh_files\6R\17select_entry\t<cr>\16review_diff\1\0\n\18toggle_viewed\20<leader><space>\16prev_thread\a[t\21close_review_tab\n<C-c>\16next_thread\a]t\22select_prev_entry\a[q\17toggle_files\14<leader>b\22select_next_entry\a]q\16focus_files\14<leader>e\26add_review_suggestion\14<space>sa\23add_review_comment\14<space>ca\15submit_win\1\0\4\21close_review_tab\n<C-c>\19approve_review\n<C-a>\20request_changes\n<C-r>\19comment_review\n<C-m>\18review_thread\1\0\17\19react_confused\14<space>rc\16react_heart\14<space>rh\16react_laugh\14<space>rl\17react_hooray\14<space>rp\17react_rocket\14<space>rr\21close_review_tab\n<C-c>\22react_thumbs_down\14<space>r-\15react_eyes\14<space>re\20react_thumbs_up\14<space>r+\22select_prev_entry\a[q\22select_next_entry\a]q\19add_suggestion\14<space>sa\17prev_comment\a[c\17next_comment\a]c\19delete_comment\14<space>cd\16add_comment\14<space>ca\15goto_issue\14<space>gi\17pull_request\1\0\31\19react_confused\14<space>rc\17react_hooray\14<space>rp\20remove_assignee\14<space>ad\16react_heart\14<space>rh\17add_assignee\14<space>aa\15react_eyes\14<space>re\rcopy_url\n<C-y>\20react_thumbs_up\14<space>r+\20open_in_browser\n<C-b>\22react_thumbs_down\14<space>r-\vreload\n<C-r>\17react_rocket\14<space>rr\16list_issues\14<space>il\16react_laugh\14<space>rl\17reopen_issue\14<space>io\17prev_comment\a[c\16close_issue\14<space>ic\20remove_reviewer\14<space>vd\17next_comment\a]c\17add_reviewer\14<space>va\19delete_comment\14<space>cd\17show_pr_diff\14<space>pd\16add_comment\14<space>ca\23list_changed_files\14<space>pf\15goto_issue\14<space>gi\17list_commits\14<space>pc\17remove_label\14<space>ld\rmerge_pr\14<space>pm\14add_label\14<space>la\16checkout_pr\14<space>po\17create_label\14<space>lc\nissue\1\0\0\1\0\24\19react_confused\14<space>rc\17react_hooray\14<space>rp\20remove_assignee\14<space>ad\16react_heart\14<space>rh\17add_assignee\14<space>aa\15react_eyes\14<space>re\rcopy_url\n<C-y>\20react_thumbs_up\14<space>r+\20open_in_browser\n<C-b>\22react_thumbs_down\14<space>r-\vreload\n<C-r>\17react_rocket\14<space>rr\16list_issues\14<space>il\16react_laugh\14<space>rl\17reopen_issue\14<space>io\16close_issue\14<space>ic\17prev_comment\a[c\17next_comment\a]c\19delete_comment\14<space>cd\16add_comment\14<space>ca\15goto_issue\14<space>gi\17remove_label\14<space>ld\14add_label\14<space>la\17create_label\14<space>lc\15file_panel\1\0\2\14use_icons\2\tsize\3\n\19default_remote\1\0\b\14user_icon\tÔäΩ \26snippet_context_lines\3\4\30reaction_viewer_hint_icon\bÔëÑ\20github_hostname\5\26left_bubble_delimiter\bÓÇ∂\27right_bubble_delimiter\bÓÇ¥\20timeline_indent\0062\20timeline_marker\bÔë†\1\3\0\0\rupstream\vorigin\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/papercolor-theme",
    url = "https://github.com/NLKNguyen/papercolor-theme"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/parinfer-rust",
    url = "https://github.com/eraserhd/parinfer-rust"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\22detection_methods\1\0\0\1\2\0\0\fpattern\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["session-lens"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\n†\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\rdelay_ms\3\21\nwidth\0032\nwinhl\nPMenu\nblend\3\30\vinc_ms\3\5\1\0\2\rmin_jump\3\21\15show_jumps\2\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/specs.nvim",
    url = "https://github.com/edluffy/specs.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\ni\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vnested(QuickFixCmdPost,DiagnosticChanged *\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-smart-history.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-smart-history.nvim",
    url = "https://github.com/nvim-telescope/telescope-smart-history.nvim"
  },
  ["telescope-snippets.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-snippets.nvim",
    url = "https://github.com/nvim-telescope/telescope-snippets.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-ultisnips.nvim",
    url = "https://github.com/fhill2/telescope-ultisnips.nvim"
  },
  ["telescope-vim-bookmarks.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-vim-bookmarks.nvim",
    url = "https://github.com/tom-anders/telescope-vim-bookmarks.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n√\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\a\15treesitter\2\1\0\2\nalpha\4\0ÄÄÄˇ\3\rinactive\2\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/unicode.vim",
    url = "https://github.com/chrisbra/unicode.vim"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-bookmarks",
    url = "https://github.com/MattesGroeger/vim-bookmarks"
  },
  ["vim-browser-search"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-browser-search",
    url = "https://github.com/voldikss/vim-browser-search"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dasht"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-dasht",
    url = "https://github.com/sunaku/vim-dasht"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-floaterm-repl"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-floaterm-repl",
    url = "https://github.com/windwp/vim-floaterm-repl"
  },
  ["vim-grepper"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-grepper",
    url = "https://github.com/mhinz/vim-grepper"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rest-console"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-rest-console",
    url = "https://github.com/diepm/vim-rest-console"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-signature",
    url = "https://github.com/kshenoy/vim-signature"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-tmux-clipboard"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-tmux-clipboard",
    url = "https://github.com/roxma/vim-tmux-clipboard"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\nÅ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\21default_mappings\2\fopacity\3\n\20dismiss_on_move\2\22resizing_mappings\2\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\ni\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vnested(QuickFixCmdPost,DiagnosticChanged *\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nï\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rpatterns\1\b\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\1\0\1\venable\2\nsetup\30treesitter-context.config\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\nÜ\20\0\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\a\3=\3\20\2B\0\2\1K\0\1\0\rmappings\1\0\n\15prev_entry\6k\15next_entry\6j\18toggle_viewed\20<leader><space>\21close_review_tab\n<C-c>\22select_prev_entry\a[q\17toggle_files\14<leader>b\22select_next_entry\a]q\16focus_files\14<leader>e\18refresh_files\6R\17select_entry\t<cr>\16review_diff\1\0\n\18toggle_viewed\20<leader><space>\16prev_thread\a[t\21close_review_tab\n<C-c>\16next_thread\a]t\22select_prev_entry\a[q\17toggle_files\14<leader>b\22select_next_entry\a]q\16focus_files\14<leader>e\26add_review_suggestion\14<space>sa\23add_review_comment\14<space>ca\15submit_win\1\0\4\21close_review_tab\n<C-c>\19approve_review\n<C-a>\20request_changes\n<C-r>\19comment_review\n<C-m>\18review_thread\1\0\17\19react_confused\14<space>rc\16react_heart\14<space>rh\16react_laugh\14<space>rl\17react_hooray\14<space>rp\17react_rocket\14<space>rr\21close_review_tab\n<C-c>\22react_thumbs_down\14<space>r-\15react_eyes\14<space>re\20react_thumbs_up\14<space>r+\22select_prev_entry\a[q\22select_next_entry\a]q\19add_suggestion\14<space>sa\17prev_comment\a[c\17next_comment\a]c\19delete_comment\14<space>cd\16add_comment\14<space>ca\15goto_issue\14<space>gi\17pull_request\1\0\31\19react_confused\14<space>rc\17react_hooray\14<space>rp\20remove_assignee\14<space>ad\16react_heart\14<space>rh\17add_assignee\14<space>aa\15react_eyes\14<space>re\rcopy_url\n<C-y>\20react_thumbs_up\14<space>r+\20open_in_browser\n<C-b>\22react_thumbs_down\14<space>r-\vreload\n<C-r>\17react_rocket\14<space>rr\16list_issues\14<space>il\16react_laugh\14<space>rl\17reopen_issue\14<space>io\17prev_comment\a[c\16close_issue\14<space>ic\20remove_reviewer\14<space>vd\17next_comment\a]c\17add_reviewer\14<space>va\19delete_comment\14<space>cd\17show_pr_diff\14<space>pd\16add_comment\14<space>ca\23list_changed_files\14<space>pf\15goto_issue\14<space>gi\17list_commits\14<space>pc\17remove_label\14<space>ld\rmerge_pr\14<space>pm\14add_label\14<space>la\16checkout_pr\14<space>po\17create_label\14<space>lc\nissue\1\0\0\1\0\24\19react_confused\14<space>rc\17react_hooray\14<space>rp\20remove_assignee\14<space>ad\16react_heart\14<space>rh\17add_assignee\14<space>aa\15react_eyes\14<space>re\rcopy_url\n<C-y>\20react_thumbs_up\14<space>r+\20open_in_browser\n<C-b>\22react_thumbs_down\14<space>r-\vreload\n<C-r>\17react_rocket\14<space>rr\16list_issues\14<space>il\16react_laugh\14<space>rl\17reopen_issue\14<space>io\16close_issue\14<space>ic\17prev_comment\a[c\17next_comment\a]c\19delete_comment\14<space>cd\16add_comment\14<space>ca\15goto_issue\14<space>gi\17remove_label\14<space>ld\14add_label\14<space>la\17create_label\14<space>lc\15file_panel\1\0\2\14use_icons\2\tsize\3\n\19default_remote\1\0\b\14user_icon\tÔäΩ \26snippet_context_lines\3\4\30reaction_viewer_hint_icon\bÔëÑ\20github_hostname\5\26left_bubble_delimiter\bÓÇ∂\27right_bubble_delimiter\bÓÇ¥\20timeline_indent\0062\20timeline_marker\bÔë†\1\3\0\0\rupstream\vorigin\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\nç\6\0\0\a\0 \0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\3=\3\b\0025\3\v\0006\4\0\0'\6\t\0B\4\2\0029\4\n\4=\4\f\0036\4\0\0'\6\t\0B\4\2\0029\4\r\4=\4\14\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\16\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\17\0036\4\0\0'\6\t\0B\4\2\0029\4\18\4=\4\19\0036\4\0\0'\6\t\0B\4\2\0029\4\20\4=\4\21\0036\4\0\0'\6\t\0B\4\2\0029\4\22\4=\4\23\0036\4\0\0'\6\t\0B\4\2\0029\4\24\4=\4\25\0036\4\0\0'\6\t\0B\4\2\0029\4\26\4=\4\27\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\29\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\14callbacks\25git.savannah.gnu.org\19git.kernel.org\22get_cgit_type_url\15repo.or.cz\26get_repoorcz_type_url\22git.launchpad.net\27get_launchpad_type_url\14git.sr.ht\22get_srht_type_url\16try.gogs.io\22get_gogs_type_url\18bitbucket.org\27get_bitbucket_type_url\17codeberg.org\17try.gitea.io\23get_gitea_type_url\15gitlab.com\24get_gitlab_type_url\15github.com\1\0\0\24get_github_type_url\20gitlinker.hosts\topts\1\0\0\20action_callback\22copy_to_clipboard\22gitlinker.actions\1\0\2$add_current_line_on_normal_mode\2\14print_url\2\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\nÿ\n\0\0\4\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\15bookmark_9\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 9) \15bookmark_8\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 8) \15bookmark_7\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 7) \15bookmark_6\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 6) \15bookmark_5\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 5) \15bookmark_4\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 4) \15bookmark_3\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 3) \15bookmark_2\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 2) \15bookmark_1\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 1) \15bookmark_0\1\0\2\tsign\bÔÄÆ\14virt_text\14 (ÔÄÆ 0) \rmappings\1\0\0\1\0)\19prev_bookmark7\b[m7\19next_bookmark6\b]m6\18set_bookmark8\am8\21delete_bookmark6\bmd6\21delete_bookmark8\bmd8\18set_bookmark6\am6\19next_bookmark8\b]m8\19prev_bookmark5\b[m5\19prev_bookmark8\b[m8\19next_bookmark5\b]m5\18set_bookmark9\am9\21delete_bookmark5\bmd5\21delete_bookmark9\bmd9\18set_bookmark5\am5\19next_bookmark9\b]m9\19prev_bookmark4\b[m4\19prev_bookmark9\b[m9\19next_bookmark4\b]m4\21delete_bookmark4\bmd4\18set_bookmark4\am4\19prev_bookmark3\b[m3\19next_bookmark3\b]m3\21delete_bookmark3\bmd3\18set_bookmark3\am3\19prev_bookmark2\b[m2\19next_bookmark2\b]m2\21delete_bookmark2\bmd2\18set_bookmark2\am2\19prev_bookmark1\b[m1\19next_bookmark1\b]m1\21delete_bookmark1\bmd1\18set_bookmark1\am1\19prev_bookmark0\b[m0\19next_bookmark0\b]m0\21delete_bookmark0\bmd0\18set_bookmark0\am0\20delete_bookmark\bmd.\19next_bookmark7\b]m7\21delete_bookmark7\bmd7\18set_bookmark7\am7\19prev_bookmark6\b[m6\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nø\n\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\tn [h\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]h\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\vbuffer\2\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\nsigns\1\0\6\nnumhl\1\22use_internal_diff\2\vlinehl\1\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\2\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: indent-guides.nvim
time([[Config for indent-guides.nvim]], true)
try_loadstring("\27LJ\2\nä\3\0\0\4\0\17\0#6\0\0\0009\0\1\0009\0\2\0\18\2\0\0009\0\3\0B\0\2\2\a\0\4\0X\0\vÄ6\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1X\0\nÄ6\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\14\0005\3\r\0=\3\n\0025\3\15\0=\3\f\2B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\16\0B\0\1\1K\0\1\0\25indent_guides_enable\1\0\2\abg\f#cdcdcd\afg\f#cdcdcd\1\0\1\22indent_guide_size\3\1\1\0\2\abg\f#5d4d7a\afg\f#5d4d7a\15odd_colors\1\0\2\abg\f#333333\afg\f#333333\16even_colors\1\0\1\22indent_guide_size\3\1\1\0\2\abg\f#FC5C94\afg\f#FC5C94\nsetup\18indent_guides\frequire\nlight\bget\15background\bopt\bvim\0", "config", "indent-guides.nvim")
time([[Config for indent-guides.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n√\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\a\15treesitter\2\1\0\2\nalpha\4\0ÄÄÄˇ\3\rinactive\2\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: iswap.nvim
time([[Config for iswap.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\niswap\frequire\0", "config", "iswap.nvim")
time([[Config for iswap.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\nñ\3\0\0\6\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0B\3\2\2'\4\b\0&\3\4\3=\3\t\0025\3\n\0=\3\v\0025\3\14\0005\4\f\0004\5\0\0=\5\r\4=\4\15\0035\4\16\0004\5\0\0=\5\r\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\tkeys\6n\1\0\3\npaste\6p\17paste_behind\6P\vselect\t<cr>\6i\1\0\0\vcustom\1\0\3\npaste\n<c-p>\17paste_behind\n<c-P>\vselect\t<cr>\ron_paste\1\0\1\fset_reg\1\fdb_path\31/databases/neoclip.sqlite3\tdata\fstdpath\afn\bvim\1\0\5\30enable_persistant_history\2\24content_spec_column\1\fhistory\3Ë\a\fpreview\2\21default_register\6\"\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\22detection_methods\1\0\0\1\2\0\0\fpattern\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\n†\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\rdelay_ms\3\21\nwidth\0032\nwinhl\nPMenu\nblend\3\30\vinc_ms\3\5\1\0\2\rmin_jump\3\21\15show_jumps\2\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nfocus\frequire\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
