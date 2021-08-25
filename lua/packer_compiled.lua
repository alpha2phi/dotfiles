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
  ["Catppuccino.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/Catppuccino.nvim"
  },
  ["Dusk-til-Dawn.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/Dusk-til-Dawn.nvim"
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
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["codicons.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/codicons.nvim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/compe-tabnine"
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
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/formatter.nvim"
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
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17github-theme\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\n\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3�\a\fkeymaps\tn [h\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]h\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\vbuffer\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\fnoremap\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\a\23current_line_blame\1\23use_decoration_api\2\vlinehl\1\nnumhl\1\22use_internal_diff\2\20update_debounce\3d\18sign_priority\3\6\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‾\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b│\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  gruvqueen = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gruvqueen"
  },
  hop = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/hop"
  },
  ["indent-guides.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0B\0\1\1K\0\1\0\25indent_guides_enable\15odd_colors\1\0\2\afg\f#e7e7fc\abg\f#e7e7fc\16even_colors\1\0\1\22indent_guide_size\3\2\1\0\2\afg\f#d3d3e7\abg\f#d3d3e7\nsetup\18indent_guides\frequire�\1\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0B\0\1\1K\0\1\0\25indent_guides_enable\15odd_colors\1\0\2\afg\f#3b314d\abg\f#3b314d\16even_colors\1\0\1\22indent_guide_size\3\2\1\0\2\afg\f#444155\abg\f#444155\nsetup\18indent_guides\frequireK\1\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0003\3\4\0B\0\3\2B\0\1\1K\0\1\0\0\0\ftimeMan\18Dusk-til-Dawn\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["kosmikoa.nvim"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rkosmikoa\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/kosmikoa.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/monokai.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neogit"
  },
  neon = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neon"
  },
  neoranger = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neoranger"
  },
  ["nest.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nest.nvim"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\15\0005\4\v\0005\5\n\0=\5\f\0045\5\r\0=\5\14\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\vfilter\bfzf\1\0\0\15extra_opts\1\5\0\0\v--bind\22ctrl-o:toggle-all\r--prompt\a> \15action_for\1\0\0\1\0\1\vctrl-s\nsplit\rfunc_map\1\0\3\16ptogglemode\az,\vvsplit\5\14stoggleup\5\fpreview\1\0\0\17border_chars\1\n\0\0\b┃\b┃\b━\b━\b┏\b┓\b┗\b┛\b█\1\0\3\16win_vheight\3\f\15win_height\3\f\17delay_syntax\3P\nsetup\bbqf\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
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
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\30treesitter-context.config\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n�\20\0\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\a\3=\3\20\2B\0\2\1K\0\1\0\rmappings\1\0\n\15prev_entry\6k\15next_entry\6j\18toggle_viewed\20<leader><space>\21close_review_tab\n<C-c>\22select_prev_entry\a[q\17toggle_files\14<leader>b\22select_next_entry\a]q\16focus_files\14<leader>e\18refresh_files\6R\17select_entry\t<cr>\16review_diff\1\0\n\18toggle_viewed\20<leader><space>\16prev_thread\a[t\21close_review_tab\n<C-c>\16next_thread\a]t\22select_prev_entry\a[q\17toggle_files\14<leader>b\22select_next_entry\a]q\16focus_files\14<leader>e\26add_review_suggestion\14<space>sa\23add_review_comment\14<space>ca\15submit_win\1\0\4\19approve_review\n<C-a>\20request_changes\n<C-r>\19comment_review\n<C-m>\21close_review_tab\n<C-c>\18review_thread\1\0\17\19delete_comment\14<space>cd\16react_laugh\14<space>rl\16add_comment\14<space>ca\17react_rocket\14<space>rr\15goto_issue\14<space>gi\22react_thumbs_down\14<space>r-\20react_thumbs_up\14<space>r+\21close_review_tab\n<C-c>\15react_eyes\14<space>re\22select_prev_entry\a[q\16react_heart\14<space>rh\22select_next_entry\a]q\17react_hooray\14<space>rp\19add_suggestion\14<space>sa\17prev_comment\a[c\17next_comment\a]c\19react_confused\14<space>rc\17pull_request\1\0\31\19delete_comment\14<space>cd\16react_laugh\14<space>rl\16add_comment\14<space>ca\17react_rocket\14<space>rr\15goto_issue\14<space>gi\22react_thumbs_down\14<space>r-\17remove_label\14<space>ld\20react_thumbs_up\14<space>r+\14add_label\14<space>la\15react_eyes\14<space>re\17create_label\14<space>lc\16react_heart\14<space>rh\20remove_assignee\14<space>ad\17react_hooray\14<space>rp\17add_assignee\14<space>aa\17prev_comment\a[c\rcopy_url\n<C-y>\16list_issues\14<space>il\20open_in_browser\n<C-b>\17reopen_issue\14<space>io\vreload\n<C-r>\rmerge_pr\14<space>pm\23list_changed_files\14<space>pf\20remove_reviewer\14<space>vd\17list_commits\14<space>pc\17add_reviewer\14<space>va\16close_issue\14<space>ic\17show_pr_diff\14<space>pd\16checkout_pr\14<space>po\17next_comment\a]c\19react_confused\14<space>rc\nissue\1\0\0\1\0\24\19delete_comment\14<space>cd\16react_laugh\14<space>rl\16add_comment\14<space>ca\17react_rocket\14<space>rr\15goto_issue\14<space>gi\22react_thumbs_down\14<space>r-\17remove_label\14<space>ld\20react_thumbs_up\14<space>r+\14add_label\14<space>la\15react_eyes\14<space>re\17create_label\14<space>lc\16react_heart\14<space>rh\20remove_assignee\14<space>ad\17react_hooray\14<space>rp\17add_assignee\14<space>aa\17prev_comment\a[c\rcopy_url\n<C-y>\20open_in_browser\n<C-b>\vreload\n<C-r>\16list_issues\14<space>il\17reopen_issue\14<space>io\16close_issue\14<space>ic\17next_comment\a]c\19react_confused\14<space>rc\15file_panel\1\0\2\tsize\3\n\14use_icons\2\19default_remote\1\0\b\20github_hostname\5\26snippet_context_lines\3\4\26left_bubble_delimiter\b\27right_bubble_delimiter\b\20timeline_indent\0062\20timeline_marker\b\14user_icon\t \30reaction_viewer_hint_icon\b\1\3\0\0\rupstream\vorigin\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/packer.nvim"
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
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\nx\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15theme_conf\1\0\1\vborder\1\1\0\2\17shorten_path\1\14previewer\2\nsetup\17session-lens\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["space-nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/space-nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/targets.vim"
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
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/trouble.nvim"
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
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rest-console"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-rest-console"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-sandwich"
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
  ["vim-tmux-clipboard"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-tmux-clipboard"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-wakatime"
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
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: Dusk-til-Dawn.nvim
time([[Setup for Dusk-til-Dawn.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\b\0\0166\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0)\1\6\0=\1\6\0006\0\0\0009\0\1\0)\1\19\0=\1\a\0K\0\1\0\24dusk_til_dawn_night\28g_dusk_til_dawn_morning\tneon\29dusk_til_dawn_dark_theme\tedge\30dusk_til_dawn_light_theme\6g\bvim\0", "setup", "Dusk-til-Dawn.nvim")
time([[Setup for Dusk-til-Dawn.nvim]], false)
time([[packadd for Dusk-til-Dawn.nvim]], true)
vim.cmd [[packadd Dusk-til-Dawn.nvim]]
time([[packadd for Dusk-til-Dawn.nvim]], false)
-- Config for: kosmikoa.nvim
time([[Config for kosmikoa.nvim]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rkosmikoa\frequire\0", "config", "kosmikoa.nvim")
time([[Config for kosmikoa.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\n\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3�\a\fkeymaps\tn [h\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]h\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\vbuffer\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\fnoremap\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\a\23current_line_blame\1\23use_decoration_api\2\vlinehl\1\nnumhl\1\22use_internal_diff\2\20update_debounce\3d\18sign_priority\3\6\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‾\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b│\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17github-theme\frequire\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\30treesitter-context.config\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: nvim-bqf
time([[Config for nvim-bqf]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\15\0005\4\v\0005\5\n\0=\5\f\0045\5\r\0=\5\14\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\vfilter\bfzf\1\0\0\15extra_opts\1\5\0\0\v--bind\22ctrl-o:toggle-all\r--prompt\a> \15action_for\1\0\0\1\0\1\vctrl-s\nsplit\rfunc_map\1\0\3\16ptogglemode\az,\vvsplit\5\14stoggleup\5\fpreview\1\0\0\17border_chars\1\n\0\0\b┃\b┃\b━\b━\b┏\b┓\b┗\b┛\b█\1\0\3\16win_vheight\3\f\15win_height\3\f\17delay_syntax\3P\nsetup\bbqf\frequire\0", "config", "nvim-bqf")
time([[Config for nvim-bqf]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n�\20\0\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\a\3=\3\20\2B\0\2\1K\0\1\0\rmappings\1\0\n\15prev_entry\6k\15next_entry\6j\18toggle_viewed\20<leader><space>\21close_review_tab\n<C-c>\22select_prev_entry\a[q\17toggle_files\14<leader>b\22select_next_entry\a]q\16focus_files\14<leader>e\18refresh_files\6R\17select_entry\t<cr>\16review_diff\1\0\n\18toggle_viewed\20<leader><space>\16prev_thread\a[t\21close_review_tab\n<C-c>\16next_thread\a]t\22select_prev_entry\a[q\17toggle_files\14<leader>b\22select_next_entry\a]q\16focus_files\14<leader>e\26add_review_suggestion\14<space>sa\23add_review_comment\14<space>ca\15submit_win\1\0\4\19approve_review\n<C-a>\20request_changes\n<C-r>\19comment_review\n<C-m>\21close_review_tab\n<C-c>\18review_thread\1\0\17\19delete_comment\14<space>cd\16react_laugh\14<space>rl\16add_comment\14<space>ca\17react_rocket\14<space>rr\15goto_issue\14<space>gi\22react_thumbs_down\14<space>r-\20react_thumbs_up\14<space>r+\21close_review_tab\n<C-c>\15react_eyes\14<space>re\22select_prev_entry\a[q\16react_heart\14<space>rh\22select_next_entry\a]q\17react_hooray\14<space>rp\19add_suggestion\14<space>sa\17prev_comment\a[c\17next_comment\a]c\19react_confused\14<space>rc\17pull_request\1\0\31\19delete_comment\14<space>cd\16react_laugh\14<space>rl\16add_comment\14<space>ca\17react_rocket\14<space>rr\15goto_issue\14<space>gi\22react_thumbs_down\14<space>r-\17remove_label\14<space>ld\20react_thumbs_up\14<space>r+\14add_label\14<space>la\15react_eyes\14<space>re\17create_label\14<space>lc\16react_heart\14<space>rh\20remove_assignee\14<space>ad\17react_hooray\14<space>rp\17add_assignee\14<space>aa\17prev_comment\a[c\rcopy_url\n<C-y>\16list_issues\14<space>il\20open_in_browser\n<C-b>\17reopen_issue\14<space>io\vreload\n<C-r>\rmerge_pr\14<space>pm\23list_changed_files\14<space>pf\20remove_reviewer\14<space>vd\17list_commits\14<space>pc\17add_reviewer\14<space>va\16close_issue\14<space>ic\17show_pr_diff\14<space>pd\16checkout_pr\14<space>po\17next_comment\a]c\19react_confused\14<space>rc\nissue\1\0\0\1\0\24\19delete_comment\14<space>cd\16react_laugh\14<space>rl\16add_comment\14<space>ca\17react_rocket\14<space>rr\15goto_issue\14<space>gi\22react_thumbs_down\14<space>r-\17remove_label\14<space>ld\20react_thumbs_up\14<space>r+\14add_label\14<space>la\15react_eyes\14<space>re\17create_label\14<space>lc\16react_heart\14<space>rh\20remove_assignee\14<space>ad\17react_hooray\14<space>rp\17add_assignee\14<space>aa\17prev_comment\a[c\rcopy_url\n<C-y>\20open_in_browser\n<C-b>\vreload\n<C-r>\16list_issues\14<space>il\17reopen_issue\14<space>io\16close_issue\14<space>ic\17next_comment\a]c\19react_confused\14<space>rc\15file_panel\1\0\2\tsize\3\n\14use_icons\2\19default_remote\1\0\b\20github_hostname\5\26snippet_context_lines\3\4\26left_bubble_delimiter\b\27right_bubble_delimiter\b\20timeline_indent\0062\20timeline_marker\b\14user_icon\t \30reaction_viewer_hint_icon\b\1\3\0\0\rupstream\vorigin\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: session-lens
time([[Config for session-lens]], true)
try_loadstring("\27LJ\2\nx\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15theme_conf\1\0\1\vborder\1\1\0\2\17shorten_path\1\14previewer\2\nsetup\17session-lens\frequire\0", "config", "session-lens")
time([[Config for session-lens]], false)
-- Config for: indent-guides.nvim
time([[Config for indent-guides.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0B\0\1\1K\0\1\0\25indent_guides_enable\15odd_colors\1\0\2\afg\f#e7e7fc\abg\f#e7e7fc\16even_colors\1\0\1\22indent_guide_size\3\2\1\0\2\afg\f#d3d3e7\abg\f#d3d3e7\nsetup\18indent_guides\frequire�\1\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0B\0\1\1K\0\1\0\25indent_guides_enable\15odd_colors\1\0\2\afg\f#3b314d\abg\f#3b314d\16even_colors\1\0\1\22indent_guide_size\3\2\1\0\2\afg\f#444155\abg\f#444155\nsetup\18indent_guides\frequireK\1\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0003\3\4\0B\0\3\2B\0\1\1K\0\1\0\0\0\ftimeMan\18Dusk-til-Dawn\frequire\0", "config", "indent-guides.nvim")
time([[Config for indent-guides.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
