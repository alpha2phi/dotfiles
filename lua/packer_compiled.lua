-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

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
  ["2077.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/2077.nvim",
    url = "https://github.com/akai54/2077.nvim"
  },
  ["ChatGPT.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/ravenxrz/DAPInstall.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["NeoSolarized.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/NeoSolarized.nvim",
    url = "https://github.com/Tsuzat/NeoSolarized.nvim"
  },
  aniseed = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/aniseed",
    url = "https://github.com/Olical/aniseed"
  },
  ["async-clj-omni"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/async-clj-omni",
    url = "https://github.com/clojure-vim/async-clj-omni"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/asynctasks.vim",
    url = "https://github.com/skywind3000/asynctasks.vim"
  },
  ["auto-dark-mode.nvim"] = {
    config = { "\27LJ\2\nK\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\tdark\15background\20nvim_set_option\bapi\bvimL\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\nlight\15background\20nvim_set_option\bapi\bvim�\1\1\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\3B\1\2\0019\1\b\0B\1\1\1K\0\1\0\tinit\19set_light_mode\0\18set_dark_mode\0\1\0\1\20update_interval\3�\a\nsetup\19auto-dark-mode\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/auto-dark-mode.nvim",
    url = "https://github.com/f-person/auto-dark-mode.nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25plugins/auto_session\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23plugins/bufferline\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["bufresize.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\a\0\21\0,5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\16\0005\4\f\0004\5\t\0005\6\4\0>\0\4\6>\6\1\0055\6\5\0>\0\4\6>\6\2\0055\6\6\0>\0\4\6>\6\3\0055\6\a\0>\0\4\6>\6\4\0055\6\b\0>\0\4\6>\6\5\0055\6\t\0>\0\4\6>\6\6\0055\6\n\0>\0\4\6>\6\a\0055\6\v\0>\0\4\6>\6\b\5=\5\r\0045\5\14\0=\5\15\4=\4\17\0035\4\18\0004\5\0\0=\5\r\0045\5\19\0=\5\15\4=\4\20\3B\1\2\1K\0\1\0\vresize\1\2\0\0\15VimResized\1\0\0\rregister\1\0\0\19trigger_events\1\3\0\0\16BufWinEnter\rWinEnter\tkeys\1\0\0\1\4\0\0\6n\15<leader>wo\17<C-w>|<C-w>_\1\4\0\0\6n\15<leader>w|\v<C-w>|\1\4\0\0\6n\15<leader>w=\v<C-w>=\1\4\0\0\6n\15<leader>w_\v<C-w>_\1\4\0\0\6n\15<leader>w-\r10<C-w>-\1\4\0\0\6n\15<leader>w+\r10<C-w>+\1\4\0\0\6n\15<leader>w>\r30<C-w>>\1\4\0\0\6n\15<leader>w<\r30<C-w><\nsetup\14bufresize\frequire\1\0\2\vsilent\2\fnoremap\2\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/bufresize.nvim",
    url = "https://github.com/kwkarlwang/bufresize.nvim"
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
  ["close-buffers.nvim"] = {
    config = { "\27LJ\2\n�\1\0\1\v\0\b\0\0236\1\0\0'\3\1\0B\1\2\0029\1\2\1)\3\1\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1B\1\1\0026\2\6\0\18\4\0\0B\2\2\4X\5\6�6\a\3\0009\a\4\a9\a\a\a\18\t\6\0\18\n\1\0B\a\3\1E\5\3\3R\5�\127K\0\1\0\21nvim_win_set_buf\vipairs\25nvim_get_current_buf\bapi\bvim\ncycle\15bufferline\frequire�\1\1\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\20next_buffer_cmd\0\27preserve_window_layout\1\3\0\0\tthis\rnameless\21file_glob_ignore\1\2\0\0\rsrc/**/*\20filetype_ignore\1\0\0\1\2\0\0\aqf\nsetup\18close_buffers\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/close-buffers.nvim",
    url = "https://github.com/kazhala/close-buffers.nvim"
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
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
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
  ["cmp-npm"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
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
  ["cmp-tabnine"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\5\0\n6\0\0\0'\2\1\0B\0\2\2\18\3\0\0009\1\2\0005\4\3\0004\5\0\0=\5\4\4B\1\3\1K\0\1\0\23ignored_file_types\1\0\6\14max_lines\0032\29show_prediction_strength\1\tsort\2\27run_on_every_keystroke\2\20max_num_results\3\3\24snippet_placeholder\a..\nsetup\23cmp_tabnine.config\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["codicons.nvim"] = {
    config = { "\27LJ\2\n:\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\rcodicons\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/codicons.nvim",
    url = "https://github.com/mortepau/codicons.nvim"
  },
  ["colorful-winsep.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\6\0006\4\3\0009\4\4\0049\4\3\0049\4\5\4=\4\a\0036\4\3\0009\4\4\0049\4\3\0049\4\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\14highlight\1\0\0\nguifg\taqua\nguibg\1\0\0\fmagenta\ncolor\amy\nsetup\20colorful-winsep\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/colorful-winsep.nvim",
    url = "https://github.com/nvim-zh/colorful-winsep.nvim"
  },
  ["colortils.nvim"] = {
    commands = { "Colortils" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colortils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/colortils.nvim",
    url = "https://github.com/max397574/colortils.nvim"
  },
  ["darkplus.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/darkplus.nvim",
    url = "https://github.com/martinsione/darkplus.nvim"
  },
  ["dash.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\23file_type_keywords\20javascriptreact\1\b\0\0\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\20typescriptreact\1\t\0\0\15typescript\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\15typescript\1\t\0\0\15typescript\15javascript\vnodejs\thtml\bsvg\vnodejs\bcss\tsass\15javascript\1\b\0\0\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\fclojure\1\a\0\0\fclojure\bclj\15javascript\thtml\bsvg\bcss\blua\1\3\0\0\blua\vNeovim\1\0\6\vpacker\1\14dashboard\1\rNvimTree\1\20TelescopePrompt\1\bfzf\1\rterminal\1\1\0\3\rdebounce\3d\18dash_app_path\27/Applications/Dash.app\18search_engine\vgoogle\nsetup\tdash\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/dash.nvim",
    url = "https://github.com/mrjones2014/dash.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21plugins/diffview\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["document-color.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tmode\15background\nsetup\19document-color\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/document-color.nvim",
    url = "https://github.com/mrshmllow/document-color.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["edge.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/edge.nvim",
    url = "https://github.com/meijieru/edge.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["efmls-configs-nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/efmls-configs-nvim",
    url = "https://github.com/creativenull/efmls-configs-nvim"
  },
  ["es.next.syntax.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/es.next.syntax.vim",
    url = "https://github.com/othree/es.next.syntax.vim"
  },
  everblush = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/everblush",
    url = "https://github.com/Everblush/everblush.nvim"
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
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\nf\0\0\6\0\6\0\v6\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\3'\5\5\0B\3\2\2&\2\3\2B\0\2\1K\0\1\0\f<afile>\vexpand\afn\26Conflict detected in \vnotify\bvim�\2\1\0\5\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0005\3\n\0003\4\v\0=\4\f\3B\0\3\1K\0\1\0\rcallback\0\1\0\1\fpattern\24GitConflictDetected\tUser\24nvim_create_autocmd\bapi\bvim\15highlights\1\0\2\fcurrent\fDiffAdd\rincoming\rDiffText\1\0\2\24disable_diagnostics\2\21default_mappings\2\nsetup\17git-conflict\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\a\0 \0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\3=\3\b\0025\3\v\0006\4\0\0'\6\t\0B\4\2\0029\4\n\4=\4\f\0036\4\0\0'\6\t\0B\4\2\0029\4\r\4=\4\14\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\16\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\17\0036\4\0\0'\6\t\0B\4\2\0029\4\18\4=\4\19\0036\4\0\0'\6\t\0B\4\2\0029\4\20\4=\4\21\0036\4\0\0'\6\t\0B\4\2\0029\4\22\4=\4\23\0036\4\0\0'\6\t\0B\4\2\0029\4\24\4=\4\25\0036\4\0\0'\6\t\0B\4\2\0029\4\26\4=\4\27\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\29\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\14callbacks\25git.savannah.gnu.org\19git.kernel.org\22get_cgit_type_url\15repo.or.cz\26get_repoorcz_type_url\22git.launchpad.net\27get_launchpad_type_url\14git.sr.ht\22get_srht_type_url\16try.gogs.io\22get_gogs_type_url\18bitbucket.org\27get_bitbucket_type_url\17codeberg.org\17try.gitea.io\23get_gitea_type_url\15gitlab.com\24get_gitlab_type_url\15github.com\1\0\0\24get_github_type_url\20gitlinker.hosts\topts\1\0\0\20action_callback\22copy_to_clipboard\22gitlinker.actions\1\0\2\14print_url\2$add_current_line_on_normal_mode\2\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1�4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0�\bset\vkeymap\bvim\vbufferv\1\1\b\0\a\0\v6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0005\5\4\0'\6\5\0'\a\6\0B\3\4\0012\0\0�K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\0\rgitsigns\vloaded\fpackage�\a\1\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0023\3\24\0=\3\25\2B\0\2\1K\0\1\0\14on_attach\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\bcol\3\1\brow\3\0\vborder\vsingle\nstyle\fminimal\rrelative\vcursor\28current_line_blame_opts\1\0\4\ndelay\3�\2\22ignore_whitespace\1\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3�\a\nsigns\1\0\n\vlinehl\2\15signcolumn\2\nnumhl\2\20update_debounce\3d\20max_file_length\3��\2\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\24attach_to_untracked\2\23current_line_blame\2\14word_diff\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b│\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\npager\2\nsetup\tglow\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0006\4\0\0'\6\6\0B\4\2\0029\4\a\0045\6\b\0B\4\2\2=\4\n\3=\3\v\2B\0\2\1K\0\1\0\15references\14telescope\1\0\0\1\0\1\17hide_preview\1\17get_dropdown\21telescope.themes\vborder\1\t\0\0\b↖\b─\b┐\b│\b┘\b─\b└\b│\1\0\n\18focus_on_open\2\16force_close\2\vheight\3\21\nwidth\3Z\ndebug\1\fopacity\3\n\20dismiss_on_move\1\21default_mappings\2\22resizing_mappings\2\14bufhidden\twipe\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["heirline.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0+\2\2\0B\0\2\1K\0\1\0\nsetup\21plugins/heirline\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/heirline.nvim",
    url = "https://github.com/rebelot/heirline.nvim"
  },
  hop = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/hop",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["hop-extensions"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/hop-extensions",
    url = "https://github.com/indianboy42/hop-extensions"
  },
  ["inc-rename.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\31show_current_context_start\2\21show_end_of_line\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\niswap\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/iswap.nvim",
    url = "https://github.com/mizlan/iswap.nvim"
  },
  ["javascript-libraries-syntax.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/javascript-libraries-syntax.vim",
    url = "https://github.com/othree/javascript-libraries-syntax.vim"
  },
  ["jeskape.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0026\3\n\0009\3\v\0039\3\f\3=\3\r\2B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\rmappings\1\0\0\r<leader>\1\0\1\r<leader>\15<cmd>w<cr>\6j\1\0\1\n<Esc>\24<cmd>stopinsert<cr>\1\0\1\6k\24<cmd>stopinsert<cr>\nsetup\fjeskape\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/jeskape.nvim",
    url = "https://github.com/Krafi2/jeskape.nvim"
  },
  ["karen-yank.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15karen-yank\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/karen-yank.nvim",
    url = "https://github.com/tenxsoydev/karen-yank.nvim"
  },
  ["kat.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/kat.nvim",
    url = "https://github.com/joehannes-ux/kat.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22plugins/lspcolors\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp-format.nvim"] = {
    config = { "\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tsync\2\nsetup\15lsp-format\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "/Users/joehannes/.local/git/joehannes-nvim/lsp_lines.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20plugins/lspkind\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lush-jsx.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\r\0\0196\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\nlangs\1\r\0\0\fclojure\bcss\thtml\ajs\tjson\bjsx\blua\rmarkdown\vpython\15typescript\tviml\bxml\fplugins\1\0\0\1\b\0\0\bcmp\rgitsigns\blsp\flspsaga\vneogit\14telescope\15treesitter\nsetup\rlush_jsx\frequire\28lush_jsx_contrast_light\thard\27lush_jsx_contrast_dark\6g\bvim\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lush-jsx.nvim",
    url = "/Users/joehannes/.local/git/joehannes-ux/lush-jsx.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\4\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\15bookmark_9\1\0\2\tsign\b\14virt_text\14 ( 9) \15bookmark_8\1\0\2\tsign\b\14virt_text\14 ( 8) \15bookmark_7\1\0\2\tsign\b\14virt_text\14 ( 7) \15bookmark_6\1\0\2\tsign\b\14virt_text\14 ( 6) \15bookmark_5\1\0\2\tsign\b\14virt_text\14 ( 5) \15bookmark_4\1\0\2\tsign\b\14virt_text\14 ( 4) \15bookmark_3\1\0\2\tsign\b\14virt_text\14 ( 3) \15bookmark_2\1\0\2\tsign\b\14virt_text\14 ( 2) \15bookmark_1\1\0\2\tsign\b\14virt_text\14 ( 1) \15bookmark_0\1\0\2\tsign\b\14virt_text\14 ( 0) \rmappings\1\0\v\am9\1\rannotate\am@\am1\1\am2\1\am4\1\am3\1\am8\1\am7\1\am0\1\am5\1\am6\1\1\0\1\21default_mappings\2\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
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
  monokaipro = {
    config = { "\27LJ\2\n�\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0K\0\1\0\25monokaipro_flat_term\1\2\0\0\vaerial\24monokaipro_sidebars monokaipro_italic_functions\rspectrum\22monokaipro_filter\6g\bvim\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/monokaipro",
    url = "https://gitlab.com/__tpb/monokai-pro.nvim"
  },
  ["neodev.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneodev\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neogen = {
    config = { "\27LJ\2\n�\2\0\0\6\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\n\0005\5\t\0=\5\6\4=\4\v\0035\4\r\0005\5\f\0=\5\6\4=\4\14\0035\4\16\0005\5\15\0=\5\6\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\14languages\20typescriptreact\1\0\0\1\0\1\26annotation_convention\ntsdoc\15typescript\1\0\0\1\0\1\26annotation_convention\ntsdoc\20javascriptreact\1\0\0\1\0\1\26annotation_convention\njsdoc\15javascript\1\0\0\rtemplate\1\0\0\1\0\1\26annotation_convention\njsdoc\1\0\2\24input_after_comment\2\fenabled\2\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    config = { "\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0" },
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
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19plugins/scroll\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22plugins/autopairs\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16plugins/bqf\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "tabout.nvim" },
    config = { "\27LJ\2\n`\0\0\3\0\4\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\fcmp-npm\nsetup\23plugins/completion\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
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
  ["nvim-dap-vscode-js"] = {
    config = { "\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\nclose�\21\1\0\t\0K\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2'\2\3\0006\3\0\0'\5\4\0B\3\2\0029\3\5\0035\5\v\0006\6\6\0009\6\a\0069\6\b\0069\6\t\6'\a\n\0&\6\a\6=\6\f\0055\6\r\0=\6\14\5B\3\2\0019\3\14\0005\4\16\0004\5\3\0006\6\6\0009\6\a\0069\6\b\0069\6\t\6'\a\17\0&\6\a\6>\6\1\5=\5\18\4=\4\15\0039\3\14\0005\4\20\0004\5\3\0006\6\6\0009\6\a\0069\6\b\0069\6\t\6'\a\21\0&\6\a\6>\6\1\5=\5\18\4=\4\19\0039\3\22\0005\4\24\0=\2\25\4=\4\23\0039\3\22\0004\4\3\0005\5\27\0=\2\25\5>\5\1\0045\5\28\0006\6\29\0009\6\30\0069\6\31\6B\6\1\2=\6 \5>\5\2\4=\4\26\0039\3\22\0005\4\"\0=\2\25\4=\4!\0039\3\22\0004\4\a\0005\5$\0=\2\25\5>\5\1\0045\5%\0006\6\29\0009\6\30\0069\6\31\6B\6\1\2=\6 \5>\5\2\0045\5&\0>\5\3\0045\5'\0006\6\0\0'\b(\0B\6\2\0029\6)\6=\6*\5>\5\4\0045\5+\0>\5\5\0045\5,\0006\6\0\0'\b(\0B\6\2\0029\6)\6=\6*\5>\5\6\4=\4#\0039\3\5\0015\5.\0005\6-\0=\6/\0055\0061\0005\a0\0=\a2\6=\0063\0054\6\3\0005\a5\0005\b4\0=\b6\a>\a\1\0065\a8\0005\b7\0=\b6\a>\a\2\6=\0069\0055\6:\0005\a<\0005\b;\0=\b=\a=\a3\6=\6>\0055\6?\0=\6@\5B\3\2\0019\3A\0009\3B\0039\3C\0033\4E\0=\4D\0039\3A\0009\3F\0039\3G\0033\4H\0=\4D\0039\3A\0009\3F\0039\3I\0033\4J\0=\4D\0032\0\0�K\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\fwindows\1\0\1\vindent\3\1\rfloating\nclose\1\0\0\1\3\0\0\6q\n<Esc>\1\0\2\15max_height\3\1\14max_width\3\1\flayouts\1\0\2\tsize\3\n\rposition\vbottom\1\3\0\0\trepl\fconsole\relements\1\0\2\tsize\3(\rposition\tleft\1\5\0\0\vscopes\16breakpoints\vstacks\fwatches\rmappings\vexpand\1\0\4\trepl\6r\tedit\6e\vremove\6d\topen\6o\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\2\14collapsed\b▸\rexpanded\b▾\1\0\5\bcwd\23${workspaceFolder}\tname!Debug TSX: attach pwa-chrome\burl\19localhost:3000\frequest\vattach\ttype\15pwa-chrome\1\0\5\bcwd\23${workspaceFolder}\tname!Debug TSX: launch pwa-chrome\frequest\vlaunch\fprogram\f${file}\ttype\15pwa-chrome\14processId\17pick_process\14dap.utils\1\0\4\bcwd\23${workspaceFolder}\tname\31Debug TSX: attach pwa-node\frequest\vattach\ttype\rpwa-node\1\0\5\bcwd\23${workspaceFolder}\tname\31Debug TSX: launch pwa-node\frequest\vlaunch\fprogram\f${file}\ttype\rpwa-node\1\0\b\15sourceMaps\2\fwebRoot\23${workspaceFolder}\fprogram\f${file}\tname\26Debug TSX with Chrome\rprotocol\14inspector\frequest\vattach\tport\3�H\ttype\vchrome\1\0\6\tname\27Debug TSX with Firefox\rreAttach\2\frequest\vlaunch\fwebRoot\23${workspaceFolder}\burl\26http://localhost:3000\ttype\ffirefox\20typescriptreact\1\0\6\tname\26Debug TS with Firefox\rreAttach\2\frequest\vlaunch\fwebRoot\23${workspaceFolder}\burl\26http://localhost:3000\ttype\ffirefox\15typescript\bcwd\vgetcwd\afn\bvim\1\0\b\15sourceMaps\2\fwebRoot\23${workspaceFolder}\fprogram\f${file}\tname\26Debug JSX with Chrome\rprotocol\14inspector\frequest\vattach\tport\3�H\ttype\vchrome\1\0\6\tname\27Debug JSX with Firefox\rreAttach\2\frequest\vlaunch\fwebRoot\23${workspaceFolder}\burl\26http://localhost:3000\ttype\ffirefox\20javascriptreact\22firefoxExecutable\1\0\6\tname\26Debug JS with Firefox\rreAttach\2\frequest\vlaunch\fwebRoot\23${workspaceFolder}\burl\26http://localhost:3000\ttype\ffirefox\15javascript\19configurationsF/site/pack/packer/opt/vscode-firefox-debug/dist/adapter.bundle.js\1\0\2\fcommand\tnode\ttype\15executable\ffirefox\targsE/site/pack/packer/opt/vscode-chrome-debug/out/src/chromeDebug.js\1\0\2\fcommand\tnode\ttype\15executable\vchrome\radapters\1\6\0\0\rpwa-node\15pwa-chrome\15pwa-msedge\18node-terminal\22pwa-extensionHost\18debugger_path\1\0\0*/site/pack/packer/opt/vscode-js-debug\tdata\bdir\afs\amy\nsetup\18dap-vscode-jsq/opt/homebrew/Caskroom/firefox-developer-edition/latest/Firefox Developer Edition.app/Contents/MacOS/firefox\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-dap-vscode-js",
    url = "https://github.com/mxsdev/nvim-dap-vscode-js"
  },
  ["nvim-docs-view"] = {
    commands = { "DocsViewToggle" },
    config = { "\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vheight\3\15\rposition\vbottom\nsetup\14docs-view\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/nvim-docs-view",
    url = "https://github.com/amrbashir/nvim-docs-view"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n�\3\0\0\3\0\b\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0B\0\1\0016\0\5\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0�\1    hi default link HlSearchNear IncSearch\n    hi default link HlSearchLens WildMenu\n    hi default link HlSearchLensNear IncSearch\n    hi default link HlSearchFloat IncSearch\n  \bcmd\bvim\30scrollbar.handlers.search\1\0\a\23float_shadow_blend\0032\18virt_priority\3d\21enable_incsearch\2\14calm_down\1\23nearest_float_when\tauto\17nearest_only\1\16auto_enable\2\nsetup\fhlslens\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0004\4\0\0=\4\a\3=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\17virtual_text\1\0\1\fenabled\1\nfloat\rwin_opts\1\0\1\fenabled\1\tsign\1\0\0\1\0\2\rpriority\3\20\fenabled\2\21update_lightbulb\19nvim-lightbulb\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
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
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-neoclip.lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19plugins/notify\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-redux"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-redux",
    url = "https://github.com/Azeirah/nvim-redux"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22plugins/scrollbar\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23plugins/treesitter\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rrefactor\15navigation\fkeymaps\1\0\2\24goto_previous_usage\14<leader>#\20goto_next_usage\14<leader>*\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\2\26highlight_definitions\1\0\0\1\0\2\25clear_on_cursor_move\2\venable\2\fautotag\14highlight\1\0\4\20highlight_group\24TSRefactorHighlight\venable\2\20highlight_delay\3�\1\21highlight_method\nblock\1\0\1\venable\2\frainbow\1\0\0\1\0\2\18extended_mode\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
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
  ["nvim-ts-hint-textobject"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-ts-hint-textobject",
    url = "https://github.com/mfussenegger/nvim-ts-hint-textobject"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["oxocarbon-lua.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/oxocarbon-lua.nvim",
    url = "https://github.com/B4mbus/oxocarbon-lua.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme-slim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/papercolor-theme-slim",
    url = "https://github.com/pappasam/papercolor-theme-slim"
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
  ["portal.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0005\5\6\0=\5\b\0045\5\t\0=\5\n\4=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\19\0005\4\16\0005\5\17\0=\5\18\4=\4\20\0035\4\21\0005\5\22\0=\5\18\4=\4\1\3=\3\23\2B\0\2\1K\0\1\0\vwindow\1\0\b\vborder\vsingle\14noautocmd\2\vheight\3\3\nwidth\3P\vzindex\3c\bcol\3\2\14focusable\1\rrelative\vcursor\1\0\1\17render_empty\1\ntitle\1\0\0\foptions\1\0\t\vzindex\3b\vheight\3\1\nwidth\3P\bcol\3\2\14noautocmd\2\vborder\vsingle\nstyle\fminimal\14focusable\1\rrelative\vcursor\1\0\1\17render_empty\2\tjump\1\0\0\tkeys\1\0\2\fforward\n<c-i>\rbackward\n<c-o>\vlabels\vescape\1\0\1\n<esc>\2\vselect\1\0\0\1\5\0\0\6j\6k\6h\6l\nquery\1\0\0\1\4\0\0\rmodified\14different\nvalid\nsetup\vportal\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/portal.nvim",
    url = "https://github.com/cbochs/portal.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\22detection_methods\1\0\0\1\2\0\0\fpattern\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  purify = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/purify/vim",
    url = "https://github.com/kyoz/purify"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["roshnivim-cs"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/roshnivim-cs",
    url = "https://github.com/shaeinst/roshnivim-cs"
  },
  ["session-lens"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  sniprun = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20plugins/sniprun\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  spaceduck = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/spaceduck",
    url = "https://github.com/pineapplegiant/spaceduck"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\nwidth\3P\nwinhl\nPMenu\nblend\3\30\vinc_ms\3\5\rdelay_ms\3\21\1\0\2\rmin_jump\3\2\15show_jumps\2\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/specs.nvim",
    url = "https://github.com/edluffy/specs.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["starry.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19plugins/starry\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/starry.nvim",
    url = "https://github.com/ray-x/starry.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n�\f\0\0\4\0B\0H5\0\0\0005\1\1\0=\1\2\0005\1\4\0005\2\3\0=\2\5\1=\1\6\0004\1\0\0=\1\a\0004\1\0\0=\1\b\0005\1\n\0005\2\t\0=\2\v\0015\2\f\0=\2\r\0015\2\14\0=\2\15\0015\2\16\0=\2\17\0015\2\18\0=\2\19\0015\2\20\0=\2\21\0015\2\22\0=\2\23\0015\2\24\0=\2\25\0015\2\26\0=\2\27\0015\2\28\0=\2\29\0015\2\30\0=\2\31\0015\2 \0=\2!\0015\2\"\0=\2#\0015\2$\0=\2%\0015\2&\0=\2'\0015\2(\0=\2)\0015\2*\0=\2+\0015\2,\0=\2-\0015\2.\0=\2/\0015\0020\0=\0021\0015\0022\0=\0023\0015\0024\0=\0025\0015\0026\0=\0027\0015\0028\0=\0029\0015\2:\0=\2;\0015\2<\0=\2=\1=\1>\0006\1?\0'\3@\0B\1\2\0029\1A\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\20symbols-outline\frequire\fsymbols\18TypeParameter\1\0\2\ahl\16TSParameter\ticon\t𝙏\rOperator\1\0\2\ahl\15TSOperator\ticon\6+\nEvent\1\0\2\ahl\vTSType\ticon\t🗲\vStruct\1\0\2\ahl\vTSType\ticon\t𝓢\15EnumMember\1\0\2\ahl\fTSField\ticon\b\tNull\1\0\2\ahl\vTSType\ticon\tNULL\bKey\1\0\2\ahl\vTSType\ticon\t🔐\vObject\1\0\2\ahl\vTSType\ticon\b⦿\nArray\1\0\2\ahl\15TSConstant\ticon\b\fBoolean\1\0\2\ahl\14TSBoolean\ticon\b⊨\vNumber\1\0\2\ahl\rTSNumber\ticon\6#\vString\1\0\2\ahl\rTSString\ticon\t𝓐\rConstant\1\0\2\ahl\15TSConstant\ticon\b\rVariable\1\0\2\ahl\15TSConstant\ticon\b\rFunction\1\0\2\ahl\15TSFunction\ticon\b\14Interface\1\0\2\ahl\vTSType\ticon\bﰮ\tEnum\1\0\2\ahl\vTSType\ticon\bℰ\16Constructor\1\0\2\ahl\18TSConstructor\ticon\b\nField\1\0\2\ahl\fTSField\ticon\b\rProperty\1\0\2\ahl\rTSMethod\ticon\b\vMethod\1\0\2\ahl\rTSMethod\ticon\aƒ\nClass\1\0\2\ahl\vTSType\ticon\t𝓒\fPackage\1\0\2\ahl\16TSNamespace\ticon\b\14Namespace\1\0\2\ahl\16TSNamespace\ticon\b\vModule\1\0\2\ahl\16TSNamespace\ticon\b\tFile\1\0\0\1\0\2\ahl\nTSURI\ticon\b\21symbol_blacklist\18lsp_blacklist\fkeymaps\nclose\1\0\v\15fold_reset\6R\rfold_all\6C\19focus_location\6o\tfold\6c\19toggle_preview\6K\vunfold\6o\17hover_symbol\14<C-space>\15unfold_all\6O\18goto_location\t<Cr>\18rename_symbol\6r\17code_actions\6a\1\3\0\0\n<Esc>\6q\17fold_markers\1\3\0\0\b\b\1\0\f\nwidth\3\15\17auto_preview\2\15auto_close\1\26show_relative_numbers\1\24show_symbol_details\2\27highlight_hovered_item\2\19relative_width\2\17show_numbers\1\16show_guides\2\25preview_bg_highlight\nPmenu\22auto_unfold_hover\2\rposition\nright\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\r\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\b\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\nclose\6>\topen\6<\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\a\15act_as_tab\1\21enable_backwards\2\21act_as_shift_tab\1\vtabkey\a>>\21backwards_tabkey\a<<\21ignore_beginning\2\15completion\1\nsetup\vtabout\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-arecibo.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-arecibo.nvim",
    url = "https://github.com/nvim-telescope/telescope-arecibo.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "/Users/joehannes/.local/git/joehannes-os/telescope-media-files.nvim"
  },
  ["telescope-node-modules.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-node-modules.nvim",
    url = "https://github.com/nvim-telescope/telescope-node-modules.nvim"
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
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0019\2\3\1B\2\1\0016\2\0\0'\4\4\0B\2\2\0029\2\3\0025\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\4B\2\2\1K\0\1\0\15theme_conf\1\0\1\vborder\1\17path_display\1\0\1\14previewer\1\1\2\0\0\fshorten\17session-lens\nsetup\20plugins/neoclip\22plugins/telescope\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["themer.lua"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\3\0004\4\0\0=\4\4\0035\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\20\2B\0\2\1K\0\1\0\vstyles\1\0\0\16conditional\1\0\1\nstyle\tbold\14parameter\1\0\1\nstyle\vitalic\20variableBuiltIn\1\0\1\nstyle\16italic,bold\rvariable\1\0\1\nstyle\vitalic\roperator\1\0\1\nstyle\tbold\20functionbuiltin\1\0\1\nstyle\16italic,bold\rfunction\1\0\1\nstyle\vitalic\fcomment\1\0\0\nsetup\vthemer\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/themer.lua",
    url = "https://github.com/themercorp/themer.lua"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20plugins/trouble\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\15treesitter\2\fcontext\3\21\1\0\2\nalpha\4ܞ��\15����\3\rinactive\2\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  undotree = {
    config = { "\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fkeymaps\1\0\a\t<cr>\17action_enter\6J\21move_change_next\6K\21move_change_prev\6p\18enter_diffbuf\6k\14move_prev\6q\tquit\6j\14move_next\vwindow\1\0\1\rwinblend\3\30\20ignore_filetype\1\a\0\0\rUndotree\17UndotreeDiff\aqf\20TelescopePrompt\18spectre_panel\17tsplayground\1\0\2\vlayout\16left_bottom\15float_diff\2\nsetup\rundotree\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/jiaoshijie/undotree"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/unicode.vim",
    url = "https://github.com/chrisbra/unicode.vim"
  },
  ["vim-browser-search"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-browser-search",
    url = "https://github.com/voldikss/vim-browser-search"
  },
  ["vim-cljfmt"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-cljfmt",
    url = "https://github.com/dmac/vim-cljfmt"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-delete-hidden-buffers"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-delete-hidden-buffers",
    url = "https://github.com/arithran/vim-delete-hidden-buffers"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
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
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grepper"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-grepper",
    url = "https://github.com/mhinz/vim-grepper"
  },
  ["vim-hexokinase"] = {
    config = { "\27LJ\2\no\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\3\0\0\16sign_column\19foregroundfull\28Hexokinase_highlighters\17nvim_set_var\bapi\bvim\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-hexokinase",
    url = "https://github.com/rrethy/vim-hexokinase"
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
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-sexp"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-sexp",
    url = "https://github.com/guns/vim-sexp"
  },
  ["vim-sexp-mappings-for-regular-people"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-sexp-mappings-for-regular-people",
    url = "https://github.com/tpope/vim-sexp-mappings-for-regular-people"
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
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-snippets"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-vsnip-snippets",
    url = "https://github.com/stevearc/vim-vsnip-snippets"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["vscode-chrome-debug"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/vscode-chrome-debug",
    url = "https://github.com/microsoft/vscode-chrome-debug"
  },
  ["vscode-firefox-debug"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/vscode-firefox-debug",
    url = "https://github.com/firefox-devtools/vscode-firefox-debug"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vscode-javascript",
    url = "https://github.com/xabikos/vscode-javascript"
  },
  ["vscode-js-debug"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/vscode-js-debug",
    url = "https://github.com/microsoft/vscode-js-debug"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19plugins/wilder\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16plugins/zen\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/Users/joehannes/.local/share/nvim/site/pack/packer/start/purify/vim"
time([[Runtimepath customization]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\4\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\15bookmark_9\1\0\2\tsign\b\14virt_text\14 ( 9) \15bookmark_8\1\0\2\tsign\b\14virt_text\14 ( 8) \15bookmark_7\1\0\2\tsign\b\14virt_text\14 ( 7) \15bookmark_6\1\0\2\tsign\b\14virt_text\14 ( 6) \15bookmark_5\1\0\2\tsign\b\14virt_text\14 ( 5) \15bookmark_4\1\0\2\tsign\b\14virt_text\14 ( 4) \15bookmark_3\1\0\2\tsign\b\14virt_text\14 ( 3) \15bookmark_2\1\0\2\tsign\b\14virt_text\14 ( 2) \15bookmark_1\1\0\2\tsign\b\14virt_text\14 ( 1) \15bookmark_0\1\0\2\tsign\b\14virt_text\14 ( 0) \rmappings\1\0\v\am9\1\rannotate\am@\am1\1\am2\1\am4\1\am3\1\am8\1\am7\1\am0\1\am5\1\am6\1\1\0\1\21default_mappings\2\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: cmp-tabnine
time([[Config for cmp-tabnine]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\5\0\n6\0\0\0'\2\1\0B\0\2\2\18\3\0\0009\1\2\0005\4\3\0004\5\0\0=\5\4\4B\1\3\1K\0\1\0\23ignored_file_types\1\0\6\14max_lines\0032\29show_prediction_strength\1\tsort\2\27run_on_every_keystroke\2\20max_num_results\3\3\24snippet_placeholder\a..\nsetup\23cmp_tabnine.config\frequire\0", "config", "cmp-tabnine")
time([[Config for cmp-tabnine]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\nwidth\3P\nwinhl\nPMenu\nblend\3\30\vinc_ms\3\5\rdelay_ms\3\21\1\0\2\rmin_jump\3\2\15show_jumps\2\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: lush-jsx.nvim
time([[Config for lush-jsx.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\r\0\0196\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\nlangs\1\r\0\0\fclojure\bcss\thtml\ajs\tjson\bjsx\blua\rmarkdown\vpython\15typescript\tviml\bxml\fplugins\1\0\0\1\b\0\0\bcmp\rgitsigns\blsp\flspsaga\vneogit\14telescope\15treesitter\nsetup\rlush_jsx\frequire\28lush_jsx_contrast_light\thard\27lush_jsx_contrast_dark\6g\bvim\0", "config", "lush-jsx.nvim")
time([[Config for lush-jsx.nvim]], false)
-- Config for: jeskape.nvim
time([[Config for jeskape.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0026\3\n\0009\3\v\0039\3\f\3=\3\r\2B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\rmappings\1\0\0\r<leader>\1\0\1\r<leader>\15<cmd>w<cr>\6j\1\0\1\n<Esc>\24<cmd>stopinsert<cr>\1\0\1\6k\24<cmd>stopinsert<cr>\nsetup\fjeskape\frequire\0", "config", "jeskape.nvim")
time([[Config for jeskape.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20plugins/trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-dap-vscode-js
time([[Config for nvim-dap-vscode-js]], true)
try_loadstring("\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\nclose�\21\1\0\t\0K\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2'\2\3\0006\3\0\0'\5\4\0B\3\2\0029\3\5\0035\5\v\0006\6\6\0009\6\a\0069\6\b\0069\6\t\6'\a\n\0&\6\a\6=\6\f\0055\6\r\0=\6\14\5B\3\2\0019\3\14\0005\4\16\0004\5\3\0006\6\6\0009\6\a\0069\6\b\0069\6\t\6'\a\17\0&\6\a\6>\6\1\5=\5\18\4=\4\15\0039\3\14\0005\4\20\0004\5\3\0006\6\6\0009\6\a\0069\6\b\0069\6\t\6'\a\21\0&\6\a\6>\6\1\5=\5\18\4=\4\19\0039\3\22\0005\4\24\0=\2\25\4=\4\23\0039\3\22\0004\4\3\0005\5\27\0=\2\25\5>\5\1\0045\5\28\0006\6\29\0009\6\30\0069\6\31\6B\6\1\2=\6 \5>\5\2\4=\4\26\0039\3\22\0005\4\"\0=\2\25\4=\4!\0039\3\22\0004\4\a\0005\5$\0=\2\25\5>\5\1\0045\5%\0006\6\29\0009\6\30\0069\6\31\6B\6\1\2=\6 \5>\5\2\0045\5&\0>\5\3\0045\5'\0006\6\0\0'\b(\0B\6\2\0029\6)\6=\6*\5>\5\4\0045\5+\0>\5\5\0045\5,\0006\6\0\0'\b(\0B\6\2\0029\6)\6=\6*\5>\5\6\4=\4#\0039\3\5\0015\5.\0005\6-\0=\6/\0055\0061\0005\a0\0=\a2\6=\0063\0054\6\3\0005\a5\0005\b4\0=\b6\a>\a\1\0065\a8\0005\b7\0=\b6\a>\a\2\6=\0069\0055\6:\0005\a<\0005\b;\0=\b=\a=\a3\6=\6>\0055\6?\0=\6@\5B\3\2\0019\3A\0009\3B\0039\3C\0033\4E\0=\4D\0039\3A\0009\3F\0039\3G\0033\4H\0=\4D\0039\3A\0009\3F\0039\3I\0033\4J\0=\4D\0032\0\0�K\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\fwindows\1\0\1\vindent\3\1\rfloating\nclose\1\0\0\1\3\0\0\6q\n<Esc>\1\0\2\15max_height\3\1\14max_width\3\1\flayouts\1\0\2\tsize\3\n\rposition\vbottom\1\3\0\0\trepl\fconsole\relements\1\0\2\tsize\3(\rposition\tleft\1\5\0\0\vscopes\16breakpoints\vstacks\fwatches\rmappings\vexpand\1\0\4\trepl\6r\tedit\6e\vremove\6d\topen\6o\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\2\14collapsed\b▸\rexpanded\b▾\1\0\5\bcwd\23${workspaceFolder}\tname!Debug TSX: attach pwa-chrome\burl\19localhost:3000\frequest\vattach\ttype\15pwa-chrome\1\0\5\bcwd\23${workspaceFolder}\tname!Debug TSX: launch pwa-chrome\frequest\vlaunch\fprogram\f${file}\ttype\15pwa-chrome\14processId\17pick_process\14dap.utils\1\0\4\bcwd\23${workspaceFolder}\tname\31Debug TSX: attach pwa-node\frequest\vattach\ttype\rpwa-node\1\0\5\bcwd\23${workspaceFolder}\tname\31Debug TSX: launch pwa-node\frequest\vlaunch\fprogram\f${file}\ttype\rpwa-node\1\0\b\15sourceMaps\2\fwebRoot\23${workspaceFolder}\fprogram\f${file}\tname\26Debug TSX with Chrome\rprotocol\14inspector\frequest\vattach\tport\3�H\ttype\vchrome\1\0\6\tname\27Debug TSX with Firefox\rreAttach\2\frequest\vlaunch\fwebRoot\23${workspaceFolder}\burl\26http://localhost:3000\ttype\ffirefox\20typescriptreact\1\0\6\tname\26Debug TS with Firefox\rreAttach\2\frequest\vlaunch\fwebRoot\23${workspaceFolder}\burl\26http://localhost:3000\ttype\ffirefox\15typescript\bcwd\vgetcwd\afn\bvim\1\0\b\15sourceMaps\2\fwebRoot\23${workspaceFolder}\fprogram\f${file}\tname\26Debug JSX with Chrome\rprotocol\14inspector\frequest\vattach\tport\3�H\ttype\vchrome\1\0\6\tname\27Debug JSX with Firefox\rreAttach\2\frequest\vlaunch\fwebRoot\23${workspaceFolder}\burl\26http://localhost:3000\ttype\ffirefox\20javascriptreact\22firefoxExecutable\1\0\6\tname\26Debug JS with Firefox\rreAttach\2\frequest\vlaunch\fwebRoot\23${workspaceFolder}\burl\26http://localhost:3000\ttype\ffirefox\15javascript\19configurationsF/site/pack/packer/opt/vscode-firefox-debug/dist/adapter.bundle.js\1\0\2\fcommand\tnode\ttype\15executable\ffirefox\targsE/site/pack/packer/opt/vscode-chrome-debug/out/src/chromeDebug.js\1\0\2\fcommand\tnode\ttype\15executable\vchrome\radapters\1\6\0\0\rpwa-node\15pwa-chrome\15pwa-msedge\18node-terminal\22pwa-extensionHost\18debugger_path\1\0\0*/site/pack/packer/opt/vscode-js-debug\tdata\bdir\afs\amy\nsetup\18dap-vscode-jsq/opt/homebrew/Caskroom/firefox-developer-edition/latest/Firefox Developer Edition.app/Contents/MacOS/firefox\ndapui\bdap\frequire\0", "config", "nvim-dap-vscode-js")
time([[Config for nvim-dap-vscode-js]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\6\0\6\0\v6\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\3'\5\5\0B\3\2\2&\2\3\2B\0\2\1K\0\1\0\f<afile>\vexpand\afn\26Conflict detected in \vnotify\bvim�\2\1\0\5\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0005\3\n\0003\4\v\0=\4\f\3B\0\3\1K\0\1\0\rcallback\0\1\0\1\fpattern\24GitConflictDetected\tUser\24nvim_create_autocmd\bapi\bvim\15highlights\1\0\2\fcurrent\fDiffAdd\rincoming\rDiffText\1\0\2\24disable_diagnostics\2\21default_mappings\2\nsetup\17git-conflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: starry.nvim
time([[Config for starry.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19plugins/starry\frequire\0", "config", "starry.nvim")
time([[Config for starry.nvim]], false)
-- Config for: monokaipro
time([[Config for monokaipro]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0K\0\1\0\25monokaipro_flat_term\1\2\0\0\vaerial\24monokaipro_sidebars monokaipro_italic_functions\rspectrum\22monokaipro_filter\6g\bvim\0", "config", "monokaipro")
time([[Config for monokaipro]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\n�\3\0\0\3\0\b\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0B\0\1\0016\0\5\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0�\1    hi default link HlSearchNear IncSearch\n    hi default link HlSearchLens WildMenu\n    hi default link HlSearchLensNear IncSearch\n    hi default link HlSearchFloat IncSearch\n  \bcmd\bvim\30scrollbar.handlers.search\1\0\a\23float_shadow_blend\0032\18virt_priority\3d\21enable_incsearch\2\14calm_down\1\23nearest_float_when\tauto\17nearest_only\1\16auto_enable\2\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\n�\6\0\0\a\0 \0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\3=\3\b\0025\3\v\0006\4\0\0'\6\t\0B\4\2\0029\4\n\4=\4\f\0036\4\0\0'\6\t\0B\4\2\0029\4\r\4=\4\14\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\16\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\17\0036\4\0\0'\6\t\0B\4\2\0029\4\18\4=\4\19\0036\4\0\0'\6\t\0B\4\2\0029\4\20\4=\4\21\0036\4\0\0'\6\t\0B\4\2\0029\4\22\4=\4\23\0036\4\0\0'\6\t\0B\4\2\0029\4\24\4=\4\25\0036\4\0\0'\6\t\0B\4\2\0029\4\26\4=\4\27\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\29\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\14callbacks\25git.savannah.gnu.org\19git.kernel.org\22get_cgit_type_url\15repo.or.cz\26get_repoorcz_type_url\22git.launchpad.net\27get_launchpad_type_url\14git.sr.ht\22get_srht_type_url\16try.gogs.io\22get_gogs_type_url\18bitbucket.org\27get_bitbucket_type_url\17codeberg.org\17try.gitea.io\23get_gitea_type_url\15gitlab.com\24get_gitlab_type_url\15github.com\1\0\0\24get_github_type_url\20gitlinker.hosts\topts\1\0\0\20action_callback\22copy_to_clipboard\22gitlinker.actions\1\0\2\14print_url\2$add_current_line_on_normal_mode\2\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n�\f\0\0\4\0B\0H5\0\0\0005\1\1\0=\1\2\0005\1\4\0005\2\3\0=\2\5\1=\1\6\0004\1\0\0=\1\a\0004\1\0\0=\1\b\0005\1\n\0005\2\t\0=\2\v\0015\2\f\0=\2\r\0015\2\14\0=\2\15\0015\2\16\0=\2\17\0015\2\18\0=\2\19\0015\2\20\0=\2\21\0015\2\22\0=\2\23\0015\2\24\0=\2\25\0015\2\26\0=\2\27\0015\2\28\0=\2\29\0015\2\30\0=\2\31\0015\2 \0=\2!\0015\2\"\0=\2#\0015\2$\0=\2%\0015\2&\0=\2'\0015\2(\0=\2)\0015\2*\0=\2+\0015\2,\0=\2-\0015\2.\0=\2/\0015\0020\0=\0021\0015\0022\0=\0023\0015\0024\0=\0025\0015\0026\0=\0027\0015\0028\0=\0029\0015\2:\0=\2;\0015\2<\0=\2=\1=\1>\0006\1?\0'\3@\0B\1\2\0029\1A\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\20symbols-outline\frequire\fsymbols\18TypeParameter\1\0\2\ahl\16TSParameter\ticon\t𝙏\rOperator\1\0\2\ahl\15TSOperator\ticon\6+\nEvent\1\0\2\ahl\vTSType\ticon\t🗲\vStruct\1\0\2\ahl\vTSType\ticon\t𝓢\15EnumMember\1\0\2\ahl\fTSField\ticon\b\tNull\1\0\2\ahl\vTSType\ticon\tNULL\bKey\1\0\2\ahl\vTSType\ticon\t🔐\vObject\1\0\2\ahl\vTSType\ticon\b⦿\nArray\1\0\2\ahl\15TSConstant\ticon\b\fBoolean\1\0\2\ahl\14TSBoolean\ticon\b⊨\vNumber\1\0\2\ahl\rTSNumber\ticon\6#\vString\1\0\2\ahl\rTSString\ticon\t𝓐\rConstant\1\0\2\ahl\15TSConstant\ticon\b\rVariable\1\0\2\ahl\15TSConstant\ticon\b\rFunction\1\0\2\ahl\15TSFunction\ticon\b\14Interface\1\0\2\ahl\vTSType\ticon\bﰮ\tEnum\1\0\2\ahl\vTSType\ticon\bℰ\16Constructor\1\0\2\ahl\18TSConstructor\ticon\b\nField\1\0\2\ahl\fTSField\ticon\b\rProperty\1\0\2\ahl\rTSMethod\ticon\b\vMethod\1\0\2\ahl\rTSMethod\ticon\aƒ\nClass\1\0\2\ahl\vTSType\ticon\t𝓒\fPackage\1\0\2\ahl\16TSNamespace\ticon\b\14Namespace\1\0\2\ahl\16TSNamespace\ticon\b\vModule\1\0\2\ahl\16TSNamespace\ticon\b\tFile\1\0\0\1\0\2\ahl\nTSURI\ticon\b\21symbol_blacklist\18lsp_blacklist\fkeymaps\nclose\1\0\v\15fold_reset\6R\rfold_all\6C\19focus_location\6o\tfold\6c\19toggle_preview\6K\vunfold\6o\17hover_symbol\14<C-space>\15unfold_all\6O\18goto_location\t<Cr>\18rename_symbol\6r\17code_actions\6a\1\3\0\0\n<Esc>\6q\17fold_markers\1\3\0\0\b\b\1\0\f\nwidth\3\15\17auto_preview\2\15auto_close\1\26show_relative_numbers\1\24show_symbol_details\2\27highlight_hovered_item\2\19relative_width\2\17show_numbers\1\16show_guides\2\25preview_bg_highlight\nPmenu\22auto_unfold_hover\2\rposition\nright\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Config for: colorful-winsep.nvim
time([[Config for colorful-winsep.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\6\0006\4\3\0009\4\4\0049\4\3\0049\4\5\4=\4\a\0036\4\3\0009\4\4\0049\4\3\0049\4\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\14highlight\1\0\0\nguifg\taqua\nguibg\1\0\0\fmagenta\ncolor\amy\nsetup\20colorful-winsep\frequire\0", "config", "colorful-winsep.nvim")
time([[Config for colorful-winsep.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1�4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0�\bset\vkeymap\bvim\vbufferv\1\1\b\0\a\0\v6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0005\5\4\0'\6\5\0'\a\6\0B\3\4\0012\0\0�K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\0\rgitsigns\vloaded\fpackage�\a\1\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0023\3\24\0=\3\25\2B\0\2\1K\0\1\0\14on_attach\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\bcol\3\1\brow\3\0\vborder\vsingle\nstyle\fminimal\rrelative\vcursor\28current_line_blame_opts\1\0\4\ndelay\3�\2\22ignore_whitespace\1\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3�\a\nsigns\1\0\n\vlinehl\2\15signcolumn\2\nnumhl\2\20update_debounce\3d\20max_file_length\3��\2\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\24attach_to_untracked\2\23current_line_blame\2\14word_diff\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b│\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fkeymaps\1\0\a\t<cr>\17action_enter\6J\21move_change_next\6K\21move_change_prev\6p\18enter_diffbuf\6k\14move_prev\6q\tquit\6j\14move_next\vwindow\1\0\1\rwinblend\3\30\20ignore_filetype\1\a\0\0\rUndotree\17UndotreeDiff\aqf\20TelescopePrompt\18spectre_panel\17tsplayground\1\0\2\vlayout\16left_bottom\15float_diff\2\nsetup\rundotree\frequire\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\n\0005\5\t\0=\5\6\4=\4\v\0035\4\r\0005\5\f\0=\5\6\4=\4\14\0035\4\16\0005\5\15\0=\5\6\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\14languages\20typescriptreact\1\0\0\1\0\1\26annotation_convention\ntsdoc\15typescript\1\0\0\1\0\1\26annotation_convention\ntsdoc\20javascriptreact\1\0\0\1\0\1\26annotation_convention\njsdoc\15javascript\1\0\0\rtemplate\1\0\0\1\0\1\26annotation_convention\njsdoc\1\0\2\24input_after_comment\2\fenabled\2\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: glow.nvim
time([[Config for glow.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\npager\2\nsetup\tglow\frequire\0", "config", "glow.nvim")
time([[Config for glow.nvim]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-bqf
time([[Config for nvim-bqf]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16plugins/bqf\frequire\0", "config", "nvim-bqf")
time([[Config for nvim-bqf]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0006\4\0\0'\6\6\0B\4\2\0029\4\a\0045\6\b\0B\4\2\2=\4\n\3=\3\v\2B\0\2\1K\0\1\0\15references\14telescope\1\0\0\1\0\1\17hide_preview\1\17get_dropdown\21telescope.themes\vborder\1\t\0\0\b↖\b─\b┐\b│\b┘\b─\b└\b│\1\0\n\18focus_on_open\2\16force_close\2\vheight\3\21\nwidth\3Z\ndebug\1\fopacity\3\n\20dismiss_on_move\1\21default_mappings\2\22resizing_mappings\2\14bufhidden\twipe\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: close-buffers.nvim
time([[Config for close-buffers.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\1\v\0\b\0\0236\1\0\0'\3\1\0B\1\2\0029\1\2\1)\3\1\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1B\1\1\0026\2\6\0\18\4\0\0B\2\2\4X\5\6�6\a\3\0009\a\4\a9\a\a\a\18\t\6\0\18\n\1\0B\a\3\1E\5\3\3R\5�\127K\0\1\0\21nvim_win_set_buf\vipairs\25nvim_get_current_buf\bapi\bvim\ncycle\15bufferline\frequire�\1\1\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\20next_buffer_cmd\0\27preserve_window_layout\1\3\0\0\tthis\rnameless\21file_glob_ignore\1\2\0\0\rsrc/**/*\20filetype_ignore\1\0\0\1\2\0\0\aqf\nsetup\18close_buffers\frequire\0", "config", "close-buffers.nvim")
time([[Config for close-buffers.nvim]], false)
-- Config for: bufresize.nvim
time([[Config for bufresize.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\a\0\21\0,5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\16\0005\4\f\0004\5\t\0005\6\4\0>\0\4\6>\6\1\0055\6\5\0>\0\4\6>\6\2\0055\6\6\0>\0\4\6>\6\3\0055\6\a\0>\0\4\6>\6\4\0055\6\b\0>\0\4\6>\6\5\0055\6\t\0>\0\4\6>\6\6\0055\6\n\0>\0\4\6>\6\a\0055\6\v\0>\0\4\6>\6\b\5=\5\r\0045\5\14\0=\5\15\4=\4\17\0035\4\18\0004\5\0\0=\5\r\0045\5\19\0=\5\15\4=\4\20\3B\1\2\1K\0\1\0\vresize\1\2\0\0\15VimResized\1\0\0\rregister\1\0\0\19trigger_events\1\3\0\0\16BufWinEnter\rWinEnter\tkeys\1\0\0\1\4\0\0\6n\15<leader>wo\17<C-w>|<C-w>_\1\4\0\0\6n\15<leader>w|\v<C-w>|\1\4\0\0\6n\15<leader>w=\v<C-w>=\1\4\0\0\6n\15<leader>w_\v<C-w>_\1\4\0\0\6n\15<leader>w-\r10<C-w>-\1\4\0\0\6n\15<leader>w+\r10<C-w>+\1\4\0\0\6n\15<leader>w>\r30<C-w>>\1\4\0\0\6n\15<leader>w<\r30<C-w><\nsetup\14bufresize\frequire\1\0\2\vsilent\2\fnoremap\2\0", "config", "bufresize.nvim")
time([[Config for bufresize.nvim]], false)
-- Config for: karen-yank.nvim
time([[Config for karen-yank.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15karen-yank\frequire\0", "config", "karen-yank.nvim")
time([[Config for karen-yank.nvim]], false)
-- Config for: heirline.nvim
time([[Config for heirline.nvim]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0+\2\2\0B\0\2\1K\0\1\0\nsetup\21plugins/heirline\frequire\0", "config", "heirline.nvim")
time([[Config for heirline.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25plugins/auto_session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: dash.nvim
time([[Config for dash.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\23file_type_keywords\20javascriptreact\1\b\0\0\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\20typescriptreact\1\t\0\0\15typescript\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\15typescript\1\t\0\0\15typescript\15javascript\vnodejs\thtml\bsvg\vnodejs\bcss\tsass\15javascript\1\b\0\0\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\fclojure\1\a\0\0\fclojure\bclj\15javascript\thtml\bsvg\bcss\blua\1\3\0\0\blua\vNeovim\1\0\6\vpacker\1\14dashboard\1\rNvimTree\1\20TelescopePrompt\1\bfzf\1\rterminal\1\1\0\3\rdebounce\3d\18dash_app_path\27/Applications/Dash.app\18search_engine\vgoogle\nsetup\tdash\frequire\0", "config", "dash.nvim")
time([[Config for dash.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\15treesitter\2\fcontext\3\21\1\0\2\nalpha\4ܞ��\15����\3\rinactive\2\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19plugins/scroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21plugins/diffview\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20plugins/lspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23plugins/bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: document-color.nvim
time([[Config for document-color.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tmode\15background\nsetup\19document-color\frequire\0", "config", "document-color.nvim")
time([[Config for document-color.nvim]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0", "config", "inc-rename.nvim")
time([[Config for inc-rename.nvim]], false)
-- Config for: portal.nvim
time([[Config for portal.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0005\5\6\0=\5\b\0045\5\t\0=\5\n\4=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\19\0005\4\16\0005\5\17\0=\5\18\4=\4\20\0035\4\21\0005\5\22\0=\5\18\4=\4\1\3=\3\23\2B\0\2\1K\0\1\0\vwindow\1\0\b\vborder\vsingle\14noautocmd\2\vheight\3\3\nwidth\3P\vzindex\3c\bcol\3\2\14focusable\1\rrelative\vcursor\1\0\1\17render_empty\1\ntitle\1\0\0\foptions\1\0\t\vzindex\3b\vheight\3\1\nwidth\3P\bcol\3\2\14noautocmd\2\vborder\vsingle\nstyle\fminimal\14focusable\1\rrelative\vcursor\1\0\1\17render_empty\2\tjump\1\0\0\tkeys\1\0\2\fforward\n<c-i>\rbackward\n<c-o>\vlabels\vescape\1\0\1\n<esc>\2\vselect\1\0\0\1\5\0\0\6j\6k\6h\6l\nquery\1\0\0\1\4\0\0\rmodified\14different\nvalid\nsetup\vportal\frequire\0", "config", "portal.nvim")
time([[Config for portal.nvim]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22plugins/lspcolors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22plugins/scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\31show_current_context_start\2\21show_end_of_line\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\22detection_methods\1\0\0\1\2\0\0\fpattern\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: lsp-format.nvim
time([[Config for lsp-format.nvim]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tsync\2\nsetup\15lsp-format\frequire\0", "config", "lsp-format.nvim")
time([[Config for lsp-format.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23plugins/treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: iswap.nvim
time([[Config for iswap.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\niswap\frequire\0", "config", "iswap.nvim")
time([[Config for iswap.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: vim-hexokinase
time([[Config for vim-hexokinase]], true)
try_loadstring("\27LJ\2\no\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\3\0\0\16sign_column\19foregroundfull\28Hexokinase_highlighters\17nvim_set_var\bapi\bvim\0", "config", "vim-hexokinase")
time([[Config for vim-hexokinase]], false)
-- Config for: themer.lua
time([[Config for themer.lua]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\3\0004\4\0\0=\4\4\0035\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\20\2B\0\2\1K\0\1\0\vstyles\1\0\0\16conditional\1\0\1\nstyle\tbold\14parameter\1\0\1\nstyle\vitalic\20variableBuiltIn\1\0\1\nstyle\16italic,bold\rvariable\1\0\1\nstyle\vitalic\roperator\1\0\1\nstyle\tbold\20functionbuiltin\1\0\1\nstyle\16italic,bold\rfunction\1\0\1\nstyle\vitalic\fcomment\1\0\0\nsetup\vthemer\frequire\0", "config", "themer.lua")
time([[Config for themer.lua]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19plugins/wilder\frequire\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: nvim-treesitter-refactor
time([[Config for nvim-treesitter-refactor]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rrefactor\15navigation\fkeymaps\1\0\2\24goto_previous_usage\14<leader>#\20goto_next_usage\14<leader>*\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\2\26highlight_definitions\1\0\0\1\0\2\25clear_on_cursor_move\2\venable\2\fautotag\14highlight\1\0\4\20highlight_group\24TSRefactorHighlight\venable\2\20highlight_delay\3�\1\21highlight_method\nblock\1\0\1\venable\2\frainbow\1\0\0\1\0\2\18extended_mode\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-refactor")
time([[Config for nvim-treesitter-refactor]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0019\2\3\1B\2\1\0016\2\0\0'\4\4\0B\2\2\0029\2\3\0025\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\4B\2\2\1K\0\1\0\15theme_conf\1\0\1\vborder\1\17path_display\1\0\1\14previewer\1\1\2\0\0\fshorten\17session-lens\nsetup\20plugins/neoclip\22plugins/telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: codicons.nvim
time([[Config for codicons.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\rcodicons\frequire\0", "config", "codicons.nvim")
time([[Config for codicons.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16plugins/zen\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\4\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\fcmp-npm\nsetup\23plugins/completion\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: sniprun
time([[Config for sniprun]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20plugins/sniprun\frequire\0", "config", "sniprun")
time([[Config for sniprun]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0004\4\0\0=\4\a\3=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\17virtual_text\1\0\1\fenabled\1\nfloat\rwin_opts\1\0\1\fenabled\1\tsign\1\0\0\1\0\2\rpriority\3\20\fenabled\2\21update_lightbulb\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: auto-dark-mode.nvim
time([[Config for auto-dark-mode.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\tdark\15background\20nvim_set_option\bapi\bvimL\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\nlight\15background\20nvim_set_option\bapi\bvim�\1\1\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\3B\1\2\0019\1\b\0B\1\1\1K\0\1\0\tinit\19set_light_mode\0\18set_dark_mode\0\1\0\1\20update_interval\3�\a\nsetup\19auto-dark-mode\frequire\0", "config", "auto-dark-mode.nvim")
time([[Config for auto-dark-mode.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22plugins/autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd tabout.nvim ]]

-- Config for: tabout.nvim
try_loadstring("\27LJ\2\n�\2\0\0\5\0\r\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\b\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\nclose\6>\topen\6<\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\a\15act_as_tab\1\21enable_backwards\2\21act_as_shift_tab\1\vtabkey\a>>\21backwards_tabkey\a<<\21ignore_beginning\2\15completion\1\nsetup\vtabout\frequire\0", "config", "tabout.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'DocsViewToggle', function(cmdargs)
          require('packer.load')({'nvim-docs-view'}, { cmd = 'DocsViewToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-docs-view'}, { cmd = 'DocsViewToggle' }, _G.packer_plugins)
          return vim.fn.getcompletion('DocsViewToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Colortils', function(cmdargs)
          require('packer.load')({'colortils.nvim'}, { cmd = 'Colortils', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'colortils.nvim'}, { cmd = 'Colortils' }, _G.packer_plugins)
          return vim.fn.getcompletion('Colortils ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CodeActionMenu', function(cmdargs)
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu' }, _G.packer_plugins)
          return vim.fn.getcompletion('CodeActionMenu ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-notify'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
