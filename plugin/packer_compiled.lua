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
  ["2077.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/2077.nvim",
    url = "https://github.com/akai54/2077.nvim"
  },
  aniseed = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/aniseed",
    url = "https://github.com/Olical/aniseed"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24config/auto_session\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bufresize.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\a\0\21\0,5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\16\0005\4\f\0004\5\t\0005\6\4\0>\0\4\6>\6\1\0055\6\5\0>\0\4\6>\6\2\0055\6\6\0>\0\4\6>\6\3\0055\6\a\0>\0\4\6>\6\4\0055\6\b\0>\0\4\6>\6\5\0055\6\t\0>\0\4\6>\6\6\0055\6\n\0>\0\4\6>\6\a\0055\6\v\0>\0\4\6>\6\b\5=\5\r\0045\5\14\0=\5\15\4=\4\17\0035\4\18\0004\5\0\0=\5\r\0045\5\19\0=\5\15\4=\4\20\3B\1\2\1K\0\1\0\vresize\1\2\0\0\15VimResized\1\0\0\rregister\1\0\0\19trigger_events\1\3\0\0\16BufWinEnter\rWinEnter\tkeys\1\0\0\1\4\0\0\6n\15<leader>wo\17<C-w>|<C-w>_\1\4\0\0\6n\15<leader>w|\v<C-w>|\1\4\0\0\6n\15<leader>w=\v<C-w>=\1\4\0\0\6n\15<leader>w_\v<C-w>_\1\4\0\0\6n\15<leader>w-\r10<C-w>-\1\4\0\0\6n\15<leader>w+\r10<C-w>+\1\4\0\0\6n\15<leader>w>\r30<C-w>>\1\4\0\0\6n\15<leader>w<\r30<C-w><\nsetup\14bufresize\frequire\1\0\2\fnoremap\2\vsilent\2\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/bufresize.nvim",
    url = "https://github.com/kwkarlwang/bufresize.nvim"
  },
  ["bufutils.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/bufutils.vim",
    url = "https://github.com/smitajit/bufutils.vim"
  },
  carbonized = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/carbonized",
    url = "https://github.com/haystackandroid/carbonized"
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
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/codicons\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/codicons.nvim",
    url = "https://github.com/mortepau/codicons.nvim"
  },
  ["copilot-cmp"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  cosmic_latte = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/cosmic_latte",
    url = "https://github.com/haystackandroid/cosmic_latte"
  },
  ["dash.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\23file_type_keywords\20javascriptreact\1\b\0\0\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\20typescriptreact\1\t\0\0\15typescript\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\15typescript\1\t\0\0\15typescript\15javascript\vnodejs\thtml\bsvg\vnodejs\bcss\tsass\15javascript\1\b\0\0\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\fclojure\1\a\0\0\fclojure\bclj\15javascript\thtml\bsvg\bcss\blua\1\3\0\0\blua\vNeovim\1\0\6\bfzf\1\14dashboard\1\rNvimTree\1\vpacker\1\rterminal\1\20TelescopePrompt\1\1\0\3\rdebounce\3d\18search_engine\vgoogle\18dash_app_path\27/Applications/Dash.app\nsetup\tdash\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/dash.nvim",
    url = "https://github.com/mrjones2014/dash.nvim"
  },
  ["diaglist.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\ndebug\1\16debounce_ms\3�\1\tinit\rdiaglist\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/diaglist.nvim",
    url = "https://github.com/onsails/diaglist.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/diffview\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
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
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/NTBBloodbath/galaxyline.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\a\0 \0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\3=\3\b\0025\3\v\0006\4\0\0'\6\t\0B\4\2\0029\4\n\4=\4\f\0036\4\0\0'\6\t\0B\4\2\0029\4\r\4=\4\14\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\16\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\17\0036\4\0\0'\6\t\0B\4\2\0029\4\18\4=\4\19\0036\4\0\0'\6\t\0B\4\2\0029\4\20\4=\4\21\0036\4\0\0'\6\t\0B\4\2\0029\4\22\4=\4\23\0036\4\0\0'\6\t\0B\4\2\0029\4\24\4=\4\25\0036\4\0\0'\6\t\0B\4\2\0029\4\26\4=\4\27\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\29\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\14callbacks\25git.savannah.gnu.org\19git.kernel.org\22get_cgit_type_url\15repo.or.cz\26get_repoorcz_type_url\22git.launchpad.net\27get_launchpad_type_url\14git.sr.ht\22get_srht_type_url\16try.gogs.io\22get_gogs_type_url\18bitbucket.org\27get_bitbucket_type_url\17codeberg.org\17try.gitea.io\23get_gitea_type_url\15gitlab.com\24get_gitlab_type_url\15github.com\1\0\0\24get_github_type_url\20gitlinker.hosts\topts\1\0\0\20action_callback\22copy_to_clipboard\22gitlinker.actions\1\0\2$add_current_line_on_normal_mode\2\14print_url\2\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1�4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0�\bset\vkeymap\bvim\vbuffer(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1�\6~\rdiffthis�\5\1\1\t\0\"\0D6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0'\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0'\a\t\0005\b\n\0B\3\5\1\18\3\2\0005\5\v\0'\6\f\0'\a\r\0B\3\4\1\18\3\2\0005\5\14\0'\6\15\0'\a\16\0B\3\4\1\18\3\2\0'\5\4\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\4\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\4\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\4\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\4\0'\6\25\0009\a\26\1B\3\4\1\18\3\2\0'\5\4\0'\6\27\0003\a\28\0B\3\4\1\18\3\2\0'\5\4\0'\6\29\0009\a\30\1B\3\4\1\18\3\2\0005\5\31\0'\6 \0'\a!\0B\3\4\0012\0\0�K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\16<leader>tgd\0\15<leader>hD\rdiffthis\15<leader>hd\17preview_hunk\15<leader>ph\20undo_stage_hunk\16<leader>hS.\17stage_buffer\16<leader>hs*\17reset_buffer\16<leader>hr*\29:Gitsigns reset_hunk<CR>\16<leader>hr.\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\16<leader>hs.\1\3\0\0\6n\6v\1\0\1\texpr\0021&diff ? ']h' : '<cmd>Gitsigns next_hunk<CR>'\a]h\1\0\1\texpr\0021&diff ? '[h' : '<cmd>Gitsigns prev_hunk<CR>'\a[h\6n\0\rgitsigns\vloaded\fpackage�\a\1\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0023\3\24\0=\3\25\2B\0\2\1K\0\1\0\14on_attach\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\nstyle\fminimal\rrelative\vcursor\brow\3\0\bcol\3\1\vborder\vsingle\28current_line_blame_opts\1\0\4\ndelay\3�\2\18virt_text_pos\beol\14virt_text\2\22ignore_whitespace\1\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3�\a\nsigns\1\0\n\20max_file_length\3��\2\15signcolumn\2\20update_debounce\3d\18sign_priority\3\6\vlinehl\2!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\nnumhl\2\14word_diff\1\23current_line_blame\2\24attach_to_untracked\2\17changedelete\1\0\4\ttext\6~\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\14topdelete\1\0\4\ttext\b‾\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vdelete\1\0\4\ttext\6_\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vchange\1\0\4\ttext\b│\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\4\ttext\6+\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\frequire\0" },
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
    config = { "\27LJ\2\n�\2\0\0\a\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0006\4\0\0'\6\6\0B\4\2\0029\4\a\0045\6\b\0B\4\2\2=\4\n\3=\3\v\2B\0\2\1K\0\1\0\15references\14telescope\1\0\0\1\0\1\17hide_preview\1\17get_dropdown\21telescope.themes\vborder\1\t\0\0\b↖\b─\b┐\b│\b┘\b─\b└\b│\1\0\n\nwidth\3Z\16force_close\2\20dismiss_on_move\1\18focus_on_open\2\14bufhidden\twipe\22resizing_mappings\2\fopacity\3\n\21default_mappings\2\vheight\3\21\ndebug\1\nsetup\17goto-preview\frequire\0" },
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
  ["hop-extensions"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/hop-extensions",
    url = "https://github.com/indianboy42/hop-extensions"
  },
  ["hover.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24hover.providers.lsp\frequire�\2\1\0\a\0\17\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0006\4\0\0'\6\1\0B\4\2\0029\4\1\0045\5\r\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\14\0006\4\0\0'\6\1\0B\4\2\0029\4\15\0045\5\16\0B\0\5\1K\0\1\0\1\0\1\tdesc\24hover.nvim (select)\17hover_select\agK\1\0\1\tdesc\15hover.nvim\6K\6n\bset\vkeymap\bvim\17preview_opts\1\0\1\vborder\frounded\tinit\1\0\1\ntitle\2\0\nsetup\nhover\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/hover.nvim",
    url = "https://github.com/lewis6991/hover.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\31show_current_context_start\2\25show_current_context\2\21show_end_of_line\2\nsetup\21indent_blankline\frequire\0" },
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
    config = { "\27LJ\2\n�\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0026\3\b\0009\3\t\0039\3\n\3=\3\v\2B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\rmappings\1\0\0\6j\1\0\2\n<Esc>\24<cmd>stopinsert<cr>\a;;G<cmd>stopinsert<cr><cmd>w<cr><cmd>normal E<cr><cmd>startinsert<cr>\1\0\1\6k\"<cmd>stopinsert<cr><cmd>w<cr>\nsetup\fjeskape\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/jeskape.nvim",
    url = "https://github.com/Krafi2/jeskape.nvim"
  },
  ["kat.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/kat.nvim",
    url = "https://github.com/joehannes-ux/kat.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/lspcolors\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp-format.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15lsp-format\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nb\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1#floating_window_above_cur_line\2\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/lspkind\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/lspsaga\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lush-jsx.nvim"] = {
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
    config = { "\27LJ\2\n�\4\0\0\4\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\15bookmark_9\1\0\2\tsign\b\14virt_text\14 ( 9) \15bookmark_8\1\0\2\tsign\b\14virt_text\14 ( 8) \15bookmark_7\1\0\2\tsign\b\14virt_text\14 ( 7) \15bookmark_6\1\0\2\tsign\b\14virt_text\14 ( 6) \15bookmark_5\1\0\2\tsign\b\14virt_text\14 ( 5) \15bookmark_4\1\0\2\tsign\b\14virt_text\14 ( 4) \15bookmark_3\1\0\2\tsign\b\14virt_text\14 ( 3) \15bookmark_2\1\0\2\tsign\b\14virt_text\14 ( 2) \15bookmark_1\1\0\2\tsign\b\14virt_text\14 ( 1) \15bookmark_0\1\0\2\tsign\b\14virt_text\14 ( 0) \1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0" },
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
  nemo = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nemo",
    url = "https://github.com/haystackandroid/nemo"
  },
  neogen = {
    config = { "\27LJ\2\n�\1\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\n\0005\5\t\0=\5\6\4=\4\v\3=\3\f\2B\0\2\1K\0\1\0\14languages\20typescriptreact\1\0\0\1\0\1\26annotation_convention\ntsdoc\15typescript\1\0\0\rtemplate\1\0\0\1\0\1\26annotation_convention\ntsdoc\1\0\2\fenabled\2\24input_after_comment\2\nsetup\vneogen\frequire\0" },
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
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/scroll\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nest.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nest.nvim",
    url = "https://github.com/LionC/nest.nvim"
  },
  ["night-and-day"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/night-and-day",
    url = "https://github.com/haystackandroid/night-and-day"
  },
  ["nvi-gps"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvi-gps",
    url = "https://github.com/nvi-gps"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/autopairs\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/bqf\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/bufferline\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "tabout.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/colorizer\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/hlslens\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/lightbulb\frequire\0" },
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
  ["nvim-neoclip.lua"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/notify\frequire\0" },
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
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/scrollbar\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/treesitter\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\t\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\tcase\1\0\3\venable\2\14max_lines\3\0\rthrottle\2\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\15\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\rrefactor\15navigation\fkeymaps\1\0\2\24goto_previous_usage\14<leader>#\20goto_next_usage\14<leader>*\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\2\26highlight_definitions\1\0\0\1\0\2\venable\2\25clear_on_cursor_move\2\fautotag\1\0\0\14highlight\1\0\4\venable\2\20highlight_delay\3�\1\20highlight_group\24TSRefactorHighlight\21highlight_method\nblock\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/devicon\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim.diagnostic_virtual_text_config"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup(nvim.diagnostic_virtual_text_config\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/nvim.diagnostic_virtual_text_config",
    url = "https://github.com/joehannes-os/nvim.diagnostic_virtual_text_config"
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
  ["pretty-fold.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16pretty-fold\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
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
  ["session-lens"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  sniprun = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/sniprun\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  snow = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/snow",
    url = "https://github.com/haystackandroid/snow"
  },
  spaceduck = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/spaceduck",
    url = "https://github.com/pineapplegiant/spaceduck"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\nwinhl\nPMenu\rdelay_ms\3\21\nblend\3\30\vinc_ms\3\5\nwidth\3P\1\0\2\rmin_jump\3\2\15show_jumps\2\nsetup\nspecs\frequire\0" },
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
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/starry\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/starry.nvim",
    url = "https://github.com/ray-x/starry.nvim"
  },
  stellarized = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/stellarized",
    url = "https://github.com/haystackandroid/stellarized"
  },
  strawberry = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/strawberry",
    url = "https://github.com/haystackandroid/strawberry"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config/symbols_outline\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\r\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\b\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\nclose\6>\topen\6<\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\a\15completion\1\21ignore_beginning\2\21enable_backwards\2\21act_as_shift_tab\1\15act_as_tab\1\21backwards_tabkey\a;H\vtabkey\a;L\nsetup\vtabout\frequire\0" },
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
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
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
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/joehannes-os/telescope-media-files.nvim"
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
  ["telescope-vim-bookmarks.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope-vim-bookmarks.nvim",
    url = "https://github.com/tom-anders/telescope-vim-bookmarks.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0019\2\3\1B\2\1\0016\2\0\0'\4\4\0B\2\2\0029\2\3\0025\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\4B\2\2\1K\0\1\0\15theme_conf\1\0\1\vborder\1\17path_display\1\0\1\14previewer\1\1\2\0\0\fshorten\17session-lens\nsetup\19config/neoclip\21config/telescope\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["themer.lua"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\3\0004\4\0\0=\4\4\0035\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\20\2B\0\2\1K\0\1\0\vstyles\1\0\0\16conditional\1\0\1\nstyle\tbold\14parameter\1\0\1\nstyle\vitalic\20variableBuiltIn\1\0\1\nstyle\16italic,bold\rvariable\1\0\1\nstyle\vitalic\roperator\1\0\1\nstyle\tbold\20functionbuiltin\1\0\1\nstyle\16italic,bold\rfunction\1\0\1\nstyle\16italic,bold\fcomment\1\0\0\nsetup\vthemer\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/themer.lua",
    url = "https://github.com/themercorp/themer.lua"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vresize\1\0\3\18resize_step_y\3\5\31enable_default_keybindings\2\18resize_step_x\3\n\15navigation\1\0\3\21cycle_navigation\1\31enable_default_keybindings\2\17persist_zoom\1\14copy_sync\1\0\0\1\0\1\venable\2\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
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
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\21\15treesitter\2\1\0\2\rinactive\2\nalpha\4ܞ��\15����\3\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
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
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
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
  ["vim-qf_resize"] = {
    config = { "\27LJ\2\n6\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\3\0=\1\2\0K\0\1\0\25qf_resize_min_height\6g\bvim\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-qf_resize",
    url = "https://github.com/blueyed/vim-qf_resize"
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
  vimspectr = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vimspectr",
    url = "https://github.com/haystackandroid/vimspectr"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vscode-javascript",
    url = "https://github.com/xabikos/vscode-javascript"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config/wilder\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  },
  ["winbar.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21exclude_filetype\1\14\0\0\thelp\rstartify\14dashboard\vpacker\17neogitstatus\rNvimTree\fTrouble\nalpha\blir\fOutline\18spectre_panel\15toggleterm\aqf\nicons\1\0\4\17editor_state\b●\14seperator\6>\14lock_icon\b\22file_icon_default\b\vcolors\1\0\3\tpath\tcyan\fsymbols\vyellow\14file_name\fmagenta\1\0\3\fenabled\2\17show_symbols\2\19show_file_path\2\nsetup\vwinbar\frequire\0" },
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/winbar.nvim",
    url = "https://github.com/fgheng/winbar.nvim"
  },
  wonka = {
    loaded = true,
    path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/wonka",
    url = "https://github.com/haystackandroid/wonka"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/zen\frequire\0" },
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
local module_lazy_loads = {
  ["^copilot_cmp"] = "copilot-cmp"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/lspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: bufresize.nvim
time([[Config for bufresize.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\a\0\21\0,5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\16\0005\4\f\0004\5\t\0005\6\4\0>\0\4\6>\6\1\0055\6\5\0>\0\4\6>\6\2\0055\6\6\0>\0\4\6>\6\3\0055\6\a\0>\0\4\6>\6\4\0055\6\b\0>\0\4\6>\6\5\0055\6\t\0>\0\4\6>\6\6\0055\6\n\0>\0\4\6>\6\a\0055\6\v\0>\0\4\6>\6\b\5=\5\r\0045\5\14\0=\5\15\4=\4\17\0035\4\18\0004\5\0\0=\5\r\0045\5\19\0=\5\15\4=\4\20\3B\1\2\1K\0\1\0\vresize\1\2\0\0\15VimResized\1\0\0\rregister\1\0\0\19trigger_events\1\3\0\0\16BufWinEnter\rWinEnter\tkeys\1\0\0\1\4\0\0\6n\15<leader>wo\17<C-w>|<C-w>_\1\4\0\0\6n\15<leader>w|\v<C-w>|\1\4\0\0\6n\15<leader>w=\v<C-w>=\1\4\0\0\6n\15<leader>w_\v<C-w>_\1\4\0\0\6n\15<leader>w-\r10<C-w>-\1\4\0\0\6n\15<leader>w+\r10<C-w>+\1\4\0\0\6n\15<leader>w>\r30<C-w>>\1\4\0\0\6n\15<leader>w<\r30<C-w><\nsetup\14bufresize\frequire\1\0\2\fnoremap\2\vsilent\2\0", "config", "bufresize.nvim")
time([[Config for bufresize.nvim]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: vim-qf_resize
time([[Config for vim-qf_resize]], true)
try_loadstring("\27LJ\2\n6\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\3\0=\1\2\0K\0\1\0\25qf_resize_min_height\6g\bvim\0", "config", "vim-qf_resize")
time([[Config for vim-qf_resize]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\n�\6\0\0\a\0 \0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\3=\3\b\0025\3\v\0006\4\0\0'\6\t\0B\4\2\0029\4\n\4=\4\f\0036\4\0\0'\6\t\0B\4\2\0029\4\r\4=\4\14\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\16\0036\4\0\0'\6\t\0B\4\2\0029\4\15\4=\4\17\0036\4\0\0'\6\t\0B\4\2\0029\4\18\4=\4\19\0036\4\0\0'\6\t\0B\4\2\0029\4\20\4=\4\21\0036\4\0\0'\6\t\0B\4\2\0029\4\22\4=\4\23\0036\4\0\0'\6\t\0B\4\2\0029\4\24\4=\4\25\0036\4\0\0'\6\t\0B\4\2\0029\4\26\4=\4\27\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\29\0036\4\0\0'\6\t\0B\4\2\0029\4\28\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\14callbacks\25git.savannah.gnu.org\19git.kernel.org\22get_cgit_type_url\15repo.or.cz\26get_repoorcz_type_url\22git.launchpad.net\27get_launchpad_type_url\14git.sr.ht\22get_srht_type_url\16try.gogs.io\22get_gogs_type_url\18bitbucket.org\27get_bitbucket_type_url\17codeberg.org\17try.gitea.io\23get_gitea_type_url\15gitlab.com\24get_gitlab_type_url\15github.com\1\0\0\24get_github_type_url\20gitlinker.hosts\topts\1\0\0\20action_callback\22copy_to_clipboard\22gitlinker.actions\1\0\2$add_current_line_on_normal_mode\2\14print_url\2\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: hover.nvim
time([[Config for hover.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24hover.providers.lsp\frequire�\2\1\0\a\0\17\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0006\4\0\0'\6\1\0B\4\2\0029\4\1\0045\5\r\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\14\0006\4\0\0'\6\1\0B\4\2\0029\4\15\0045\5\16\0B\0\5\1K\0\1\0\1\0\1\tdesc\24hover.nvim (select)\17hover_select\agK\1\0\1\tdesc\15hover.nvim\6K\6n\bset\vkeymap\bvim\17preview_opts\1\0\1\vborder\frounded\tinit\1\0\1\ntitle\2\0\nsetup\nhover\frequire\0", "config", "hover.nvim")
time([[Config for hover.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\22detection_methods\1\0\0\1\2\0\0\fpattern\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: monokaipro
time([[Config for monokaipro]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0K\0\1\0\25monokaipro_flat_term\1\2\0\0\vaerial\24monokaipro_sidebars monokaipro_italic_functions\rspectrum\22monokaipro_filter\6g\bvim\0", "config", "monokaipro")
time([[Config for monokaipro]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\4\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\15bookmark_9\1\0\2\tsign\b\14virt_text\14 ( 9) \15bookmark_8\1\0\2\tsign\b\14virt_text\14 ( 8) \15bookmark_7\1\0\2\tsign\b\14virt_text\14 ( 7) \15bookmark_6\1\0\2\tsign\b\14virt_text\14 ( 6) \15bookmark_5\1\0\2\tsign\b\14virt_text\14 ( 5) \15bookmark_4\1\0\2\tsign\b\14virt_text\14 ( 4) \15bookmark_3\1\0\2\tsign\b\14virt_text\14 ( 3) \15bookmark_2\1\0\2\tsign\b\14virt_text\14 ( 2) \15bookmark_1\1\0\2\tsign\b\14virt_text\14 ( 1) \15bookmark_0\1\0\2\tsign\b\14virt_text\14 ( 0) \1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/scroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0006\4\0\0'\6\6\0B\4\2\0029\4\a\0045\6\b\0B\4\2\2=\4\n\3=\3\v\2B\0\2\1K\0\1\0\15references\14telescope\1\0\0\1\0\1\17hide_preview\1\17get_dropdown\21telescope.themes\vborder\1\t\0\0\b↖\b─\b┐\b│\b┘\b─\b└\b│\1\0\n\nwidth\3Z\16force_close\2\20dismiss_on_move\1\18focus_on_open\2\14bufhidden\twipe\22resizing_mappings\2\fopacity\3\n\21default_mappings\2\vheight\3\21\ndebug\1\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: dash.nvim
time([[Config for dash.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\23file_type_keywords\20javascriptreact\1\b\0\0\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\20typescriptreact\1\t\0\0\15typescript\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\15typescript\1\t\0\0\15typescript\15javascript\vnodejs\thtml\bsvg\vnodejs\bcss\tsass\15javascript\1\b\0\0\15javascript\thtml\bsvg\vnodejs\bcss\tsass\nreact\fclojure\1\a\0\0\fclojure\bclj\15javascript\thtml\bsvg\bcss\blua\1\3\0\0\blua\vNeovim\1\0\6\bfzf\1\14dashboard\1\rNvimTree\1\vpacker\1\rterminal\1\20TelescopePrompt\1\1\0\3\rdebounce\3d\18search_engine\vgoogle\18dash_app_path\27/Applications/Dash.app\nsetup\tdash\frequire\0", "config", "dash.nvim")
time([[Config for dash.nvim]], false)
-- Config for: nvim-treesitter-refactor
time([[Config for nvim-treesitter-refactor]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\15\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\rrefactor\15navigation\fkeymaps\1\0\2\24goto_previous_usage\14<leader>#\20goto_next_usage\14<leader>*\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\2\26highlight_definitions\1\0\0\1\0\2\venable\2\25clear_on_cursor_move\2\fautotag\1\0\0\14highlight\1\0\4\venable\2\20highlight_delay\3�\1\20highlight_group\24TSRefactorHighlight\21highlight_method\nblock\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-refactor")
time([[Config for nvim-treesitter-refactor]], false)
-- Config for: diaglist.nvim
time([[Config for diaglist.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\ndebug\1\16debounce_ms\3�\1\tinit\rdiaglist\frequire\0", "config", "diaglist.nvim")
time([[Config for diaglist.nvim]], false)
-- Config for: sniprun
time([[Config for sniprun]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/sniprun\frequire\0", "config", "sniprun")
time([[Config for sniprun]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0019\2\3\1B\2\1\0016\2\0\0'\4\4\0B\2\2\0029\2\3\0025\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\4B\2\2\1K\0\1\0\15theme_conf\1\0\1\vborder\1\17path_display\1\0\1\14previewer\1\1\2\0\0\fshorten\17session-lens\nsetup\19config/neoclip\21config/telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: themer.lua
time([[Config for themer.lua]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\3\0004\4\0\0=\4\4\0035\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\20\2B\0\2\1K\0\1\0\vstyles\1\0\0\16conditional\1\0\1\nstyle\tbold\14parameter\1\0\1\nstyle\vitalic\20variableBuiltIn\1\0\1\nstyle\16italic,bold\rvariable\1\0\1\nstyle\vitalic\roperator\1\0\1\nstyle\tbold\20functionbuiltin\1\0\1\nstyle\16italic,bold\rfunction\1\0\1\nstyle\16italic,bold\fcomment\1\0\0\nsetup\vthemer\frequire\0", "config", "themer.lua")
time([[Config for themer.lua]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\t\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\tcase\1\0\3\venable\2\14max_lines\3\0\rthrottle\2\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: nvim-bqf
time([[Config for nvim-bqf]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/bqf\frequire\0", "config", "nvim-bqf")
time([[Config for nvim-bqf]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\31show_current_context_start\2\25show_current_context\2\21show_end_of_line\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vresize\1\0\3\18resize_step_y\3\5\31enable_default_keybindings\2\18resize_step_x\3\n\15navigation\1\0\3\21cycle_navigation\1\31enable_default_keybindings\2\17persist_zoom\1\14copy_sync\1\0\0\1\0\1\venable\2\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\nwinhl\nPMenu\rdelay_ms\3\21\nblend\3\30\vinc_ms\3\5\nwidth\3P\1\0\2\rmin_jump\3\2\15show_jumps\2\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\fcmp-npm\nsetup\22config/completion\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/diffview\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/hlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/devicon\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: starry.nvim
time([[Config for starry.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/starry\frequire\0", "config", "starry.nvim")
time([[Config for starry.nvim]], false)
-- Config for: iswap.nvim
time([[Config for iswap.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\niswap\frequire\0", "config", "iswap.nvim")
time([[Config for iswap.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: jeskape.nvim
time([[Config for jeskape.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0026\3\b\0009\3\t\0039\3\n\3=\3\v\2B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\rmappings\1\0\0\6j\1\0\2\n<Esc>\24<cmd>stopinsert<cr>\a;;G<cmd>stopinsert<cr><cmd>w<cr><cmd>normal E<cr><cmd>startinsert<cr>\1\0\1\6k\"<cmd>stopinsert<cr><cmd>w<cr>\nsetup\fjeskape\frequire\0", "config", "jeskape.nvim")
time([[Config for jeskape.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\21\15treesitter\2\1\0\2\rinactive\2\nalpha\4ܞ��\15����\3\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config/wilder\frequire\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1�4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0�\bset\vkeymap\bvim\vbuffer(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1�\6~\rdiffthis�\5\1\1\t\0\"\0D6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0'\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0'\a\t\0005\b\n\0B\3\5\1\18\3\2\0005\5\v\0'\6\f\0'\a\r\0B\3\4\1\18\3\2\0005\5\14\0'\6\15\0'\a\16\0B\3\4\1\18\3\2\0'\5\4\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\4\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\4\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\4\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\4\0'\6\25\0009\a\26\1B\3\4\1\18\3\2\0'\5\4\0'\6\27\0003\a\28\0B\3\4\1\18\3\2\0'\5\4\0'\6\29\0009\a\30\1B\3\4\1\18\3\2\0005\5\31\0'\6 \0'\a!\0B\3\4\0012\0\0�K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\16<leader>tgd\0\15<leader>hD\rdiffthis\15<leader>hd\17preview_hunk\15<leader>ph\20undo_stage_hunk\16<leader>hS.\17stage_buffer\16<leader>hs*\17reset_buffer\16<leader>hr*\29:Gitsigns reset_hunk<CR>\16<leader>hr.\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\16<leader>hs.\1\3\0\0\6n\6v\1\0\1\texpr\0021&diff ? ']h' : '<cmd>Gitsigns next_hunk<CR>'\a]h\1\0\1\texpr\0021&diff ? '[h' : '<cmd>Gitsigns prev_hunk<CR>'\a[h\6n\0\rgitsigns\vloaded\fpackage�\a\1\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0023\3\24\0=\3\25\2B\0\2\1K\0\1\0\14on_attach\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\nstyle\fminimal\rrelative\vcursor\brow\3\0\bcol\3\1\vborder\vsingle\28current_line_blame_opts\1\0\4\ndelay\3�\2\18virt_text_pos\beol\14virt_text\2\22ignore_whitespace\1\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3�\a\nsigns\1\0\n\20max_file_length\3��\2\15signcolumn\2\20update_debounce\3d\18sign_priority\3\6\vlinehl\2!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\nnumhl\2\14word_diff\1\23current_line_blame\2\24attach_to_untracked\2\17changedelete\1\0\4\ttext\6~\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\14topdelete\1\0\4\ttext\b‾\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vdelete\1\0\4\ttext\6_\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vchange\1\0\4\ttext\b│\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\4\ttext\6+\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/lspcolors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: nvim.diagnostic_virtual_text_config
time([[Config for nvim.diagnostic_virtual_text_config]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup(nvim.diagnostic_virtual_text_config\frequire\0", "config", "nvim.diagnostic_virtual_text_config")
time([[Config for nvim.diagnostic_virtual_text_config]], false)
-- Config for: winbar.nvim
time([[Config for winbar.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21exclude_filetype\1\14\0\0\thelp\rstartify\14dashboard\vpacker\17neogitstatus\rNvimTree\fTrouble\nalpha\blir\fOutline\18spectre_panel\15toggleterm\aqf\nicons\1\0\4\17editor_state\b●\14seperator\6>\14lock_icon\b\22file_icon_default\b\vcolors\1\0\3\tpath\tcyan\fsymbols\vyellow\14file_name\fmagenta\1\0\3\fenabled\2\17show_symbols\2\19show_file_path\2\nsetup\vwinbar\frequire\0", "config", "winbar.nvim")
time([[Config for winbar.nvim]], false)
-- Config for: lsp-format.nvim
time([[Config for lsp-format.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15lsp-format\frequire\0", "config", "lsp-format.nvim")
time([[Config for lsp-format.nvim]], false)
-- Config for: close-buffers.nvim
time([[Config for close-buffers.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\1\v\0\b\0\0236\1\0\0'\3\1\0B\1\2\0029\1\2\1)\3\1\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1B\1\1\0026\2\6\0\18\4\0\0B\2\2\4X\5\6�6\a\3\0009\a\4\a9\a\a\a\18\t\6\0\18\n\1\0B\a\3\1E\5\3\3R\5�\127K\0\1\0\21nvim_win_set_buf\vipairs\25nvim_get_current_buf\bapi\bvim\ncycle\15bufferline\frequire�\1\1\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\20next_buffer_cmd\0\27preserve_window_layout\1\3\0\0\tthis\rnameless\21file_glob_ignore\1\2\0\0\rsrc/**/*\20filetype_ignore\1\0\0\1\2\0\0\aqf\nsetup\18close_buffers\frequire\0", "config", "close-buffers.nvim")
time([[Config for close-buffers.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/zen\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1#floating_window_above_cur_line\2\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24config/auto_session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\n\0005\5\t\0=\5\6\4=\4\v\3=\3\f\2B\0\2\1K\0\1\0\14languages\20typescriptreact\1\0\0\1\0\1\26annotation_convention\ntsdoc\15typescript\1\0\0\rtemplate\1\0\0\1\0\1\26annotation_convention\ntsdoc\1\0\2\fenabled\2\24input_after_comment\2\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/lspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config/symbols_outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: codicons.nvim
time([[Config for codicons.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/codicons\frequire\0", "config", "codicons.nvim")
time([[Config for codicons.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd tabout.nvim ]]

-- Config for: tabout.nvim
try_loadstring("\27LJ\2\n�\2\0\0\5\0\r\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\b\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\nclose\6>\topen\6<\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\a\15completion\1\21ignore_beginning\2\21enable_backwards\2\21act_as_shift_tab\1\15act_as_tab\1\21backwards_tabkey\a;H\vtabkey\a;L\nsetup\vtabout\frequire\0", "config", "tabout.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-notify', 'copilot.lua'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
