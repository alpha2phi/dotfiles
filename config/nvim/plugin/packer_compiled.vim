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

time("Luarocks path setup", true)
local package_path_str = "/Users/mengwangk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/mengwangk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/mengwangk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/mengwangk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mengwangk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["alpha.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/alpha.nvim"
  },
  ["any-jump.vim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/any-jump.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/ctrlsf.vim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0" },
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neogit = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/papercolor-theme"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["python-snippets"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/python-snippets"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-vimspector.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/telescope-vimspector.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/unicode.vim"
  },
  ["vader.vim"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vader.vim"
  },
  ["vim-browser-search"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-browser-search"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-themis"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-themis"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimspector = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vimspector"
  },
  ["vscode-go"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vscode-go"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vscode-javascript"
  },
  ["vscode-python-snippet-pack"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vscode-python-snippet-pack"
  },
  ["vscode-rust"] = {
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/vscode-rust"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/mengwangk/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
-- Config for: neogit
time("Config for neogit", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time("Config for neogit", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: telescope-frecency.nvim
time("Config for telescope-frecency.nvim", true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time("Config for telescope-frecency.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
