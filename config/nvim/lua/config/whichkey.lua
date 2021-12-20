local M = {}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = false,
  noremap = true,
  nowait = true,
}

local xopts = {
  mode = "x",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["w"] = { "<Cmd>w<Cr>", "Save" },
  ["q"] = { "<Cmd>q<Cr>", "Quit!" },

  -- System
  ["z"] = {
    name = "System",
    b = {
      "<Cmd>hi Normal ctermbg=none guibg=none<CR>",
      "Transparent background",
    },
    s = { ":<C-u>SaveSession<Cr>", "Save session" },
    l = { ":<C-u>SearchSession<Cr>", "Load session" },
    c = { "<Cmd>Telescope colorscheme<Cr>", "Color scheme" },
    h = { "<Cmd>15sp +term<CR>", "New horizontal terminal" },
    t = { "<Cmd>terminal<CR>", "New terminal" },
    e = { "!!$SHELL<CR>", "Execute line" },
    z = {
      "<Cmd>lua require('config.telescope').search_dotfiles()<CR>",
      "Configuration",
    },
    r = { "<Cmd>luafile %<Cr>", "Reload lua file" },
    m = { "<Cmd>messages<Cr>", "Messages" },
    p = { "<Cmd>messages clear<Cr>", "Clear messages" },
    -- p = {
    --   ":let &runtimepath.=','.escape(expand('%:p:h'), '\\,')<Cr>",
    --   "Set runtime path",
    -- },
    f = { "<Cmd>FloatermNew<Cr>", "Floating terminal" },
    i = { "<Cmd>PackerUpdate<Cr>", "Packer update" },
    y = { "<Cmd>Telescope neoclip<Cr>", "Clipboard manager" },
    x = { "<Cmd>Telescope bookmarks<Cr>", "Browser bookmarks" },
  },

  -- Buffer
  b = {
    name = "Buffer",
    a = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    d = { "<Cmd>bd<Cr>", "Delete current buffer" },
    l = { "<Cmd>ls<Cr>", "List buffers" },
    n = { "<Cmd>bn<Cr>", "Next buffer" },
    p = { "<Cmd>bp<Cr>", "Previous buffer" },
    f = { "<Cmd>bd!<Cr>", "Force delete current buffer" },
  },

  -- Quick fix
  c = {
    name = "Quickfix",
    o = { "<Cmd>copen<Cr>", "Open quickfix" },
    c = { "<Cmd>cclose<Cr>", "Close quickfix" },
    n = { "<Cmd>cnext<Cr>", "Next quickfix" },
    p = { "<Cmd>cprev<Cr>", "Previous quickfix" },
    x = { "<Cmd>cex []<Cr>", "Clear quickfix" },
  },

  -- File
  f = {
    name = "File",
    b = { "<Cmd>Telescope buffers<Cr>", "Search buffers" },
    f = { "<Cmd>Telescope git_files<Cr>", "Git files" },
    g = { "<Cmd>Telescope live_grep<Cr>", "Live grep" },
    h = { "<Cmd>Telescope help_tags<Cr>", "Help" },
    p = { "<Cmd>Telescope file_browser<Cr>", "Pop-up file browser" },
    o = { "<Cmd>Telescope oldfiles<Cr>", "Old files" },
    m = { "<Cmd>Telescope marks<Cr>", "Mark" },
    n = { "<Cmd>ene <BAR> startinsert <Cr>", "New file" },
    r = { "<Cmd>Telescope frecency<Cr>", "Recent file" },
    s = { "<Cmd>Telescope symbols<Cr>", "Symbols" },
    a = { "<Cmd>xa<Cr>", "Save all & quit" },
    e = { "<Cmd>NvimTreeToggle<CR>", "Explorer" },
    z = { "<Cmd>lefta 20vsp ~/workspace/dev/alpha2phi<CR>", "Netrw" },
    v = { "<Cmd>Telescope media_files<CR>", "View media files" },
    t = { "<Cmd>Telescope<CR>", "Telescope" },
    l = { "<Cmd>e!<CR>", "Reload file" },
    j = { "<Cmd>Telescope zoxide list<CR>", "Jump to folder" },
  },

  -- Git
  g = {
    name = "Source code",
    a = { "<Cmd>Telescope repo list<Cr>", "All repositories" },
    s = { "<Cmd>Git<Cr>", "Git status" },
    p = { "<Cmd>Git push<Cr>", "Git push" },
    b = { "<Cmd>Git branch<Cr>", "Git branch" },
    d = { "<Cmd>Gvdiffsplit<Cr>", "Git diff" },
    f = { "<Cmd>Git fetch --all<Cr>", "Git fetch" },
    m = { "<Cmd>GitMessenger<Cr>", "Git messenger" },
    n = { "<Cmd>Neogit<Cr>", "NeoGit" },
    v = { "<Cmd>DiffviewOpen<Cr>", "Diffview open" },
    c = { "<Cmd>DiffviewClose<Cr>", "Diffview close" },
    h = { "<Cmd>DiffviewFileHistory<Cr>", "File history" },
    ["r"] = {
      name = "Rebase",
      u = {
        "<Cmd>Git rebase upstream/master<Cr>",
        "Git rebase upstream/master",
      },
      o = {
        "<Cmd>Git rebase origin/master<Cr>",
        "Git rebase origin/master",
      },
    },
    x = {
      name = "Diff",
      ["2"] = { "<Cmd>diffget //2", "Diffget 2" },
      ["3"] = { "<Cmd>diffget //3", "Diffget 3" },
    },
    g = { name = "Generate doc" },
    y = { name = "Git URL" },
  },

  -- eSpeak
  e = { name = "eSpeak", s = { "<Cmd>call tts#Speak()<CR>", "Speak" } },

  -- Project
  p = {
    name = "Project",
    s = {
      "<Cmd>lua require('config.telescope').switch_projects()<CR>",
      "Search files",
    },
    p = {
      "<Cmd>lua require('telescope').extensions.project.project({})<Cr>",
      "List projects",
    },
    r = {
      "<Cmd>Telescope projects<Cr>",
      "Recent projects",
    },
  },

  -- Easymotion
  ["<Space>"] = { name = "Easymotion" },

  -- Search
  ["s"] = {
    name = "Search",
    w = {
      "<Cmd>lua require('telescope').extensions.arecibo.websearch()<CR>",
      "Web search",
    },
    s = { "<Cmd>lua require('spectre').open()<CR>", "Search file" },
    z = { "<Plug>SearchNormal", "Browser search" },
    v = {
      "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      "Visual search",
    },
    f = {
      "viw:lua require('spectre').open_file_search()<Cr>",
      "Open file search",
    },
    c = { "q:", "Command history" },
    g = { "q/", "Grep history" },
    l = { "<Cmd>lua require('utils.cheatsheet').cheatsheet()<CR>", "Search code" },
    o = { "<Cmd>SymbolsOutline<CR>", "Symbols Outline" },
    b = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy find buffer" },
    u = { "<Cmd>Telescope ultisnips<CR>", "Search snippets" },
  },

  -- Testing
  t = {
    name = "Test",
    n = { "<Cmd>w<CR>:TestNearest<CR>", "Test nearest" },
    f = { "<Cmd>w<CR>:TestFile<CR>", "Test file" },
    s = { "<Cmd>w<CR>:TestSuite<CR>", "Test suite" },
    l = { "<Cmd>w<CR>:TestLast<CR>", "Test last" },
    v = { "<Cmd>w<CR>:TestVisit<CR>", "Test visit" },
  },

  -- Run
  r = {
    name = "Run",
    x = "Swap next parameter",
    X = "Swap previous parameter",
    s = { "<Cmd>lua require'sniprun'.run()<CR>", "Run snippets" },
  },

  -- Git signs
  h = {
    name = "Git signs",
    b = "Blame line",
    p = "Preview hunk",
    R = "Reset buffer",
    r = "Reset buffer",
    s = "Stage hunk",
    S = "Stage buffer",
    u = "Undo stage hunk",
    U = "Reset buffer index",
  },

  -- Notes
  n = {
    name = "Notes",
    n = {
      "<Cmd>FloatermNew nvim ~/workspace/dev/notes/<Cr>",
      "New note",
    },
    o = { "<Cmd>GkeepOpen<Cr>", "GKeep Open" },
    c = { "<Cmd>GkeepClose<Cr>", "GKeep Close" },
    r = { "<Cmd>GkeepRefresh<Cr>", "GKeep Refresh" },
    s = { "<Cmd>GkeepSync<Cr>", "GKeep Sync" },
    p = { "<Cmd>MarkdownPreview<Cr>", "Preview markdown" },
    z = { "<Cmd>ZenMode<Cr>", "Zen Mode" },
    h = { "<Cmd>Twilight<Cr>", "Twilight" },
    g = { "<Cmd>GrammarousCheck<Cr>", "Grammar check" },
  },

  -- Magma
  m = {
    name = "Magma",
    l = { "<Cmd>MagmaEvaluateLine<Cr>", "Evaluate line" },
    r = { "<Cmd>MagmaReevaluateCell<Cr>", "Reevaluate Cell" },
    d = { "<Cmd>MagmaDelete<Cr>", "Delete" },
    o = { "<Cmd>MagmaShowOutput<Cr>", "Show output" },
    i = { "<Cmd>MagmaInit<Cr>", "Init" },
    u = { "<Cmd>MagmaDeinit<Cr>", "Deinit" },
  },

  -- Database
  x = {
    name = "Database",
    u = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
    f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
    r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
    q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
  },

  -- Viewer
  v = {
    name = "View",
    v = { "<Cmd>vsplit term://vd <cfile><CR>", "VisiData" },
  },
  -- K = {name = "Cheatsheet"},
  -- C = {name = "Cheatsheet (toggle comment)"},
}

local vmappings = {
  s = {
    name = "Search",
    v = { "<Cmd>lua require('spectre').open_visual()<CR>", "Visual search" },
    b = { "<Plug>SearchVisual", "Browser search" },
    c = { "<Cmd>lua require('utils.codex').complete()<CR>", "Codex complete" },
  },
  h = { name = "Git signs" },
  e = { name = "eSpeak", s = { "<Cmd>call tts#Speak(1)<CR>", "Speak" } },
  r = {
    name = "Run",
    s = { "<Cmd>lua require'sniprun'.run('v')<CR>", "Run snippets" },
  },
  g = {
    name = "Source code",
    y = { name = "Git URL" },
  },
  b = {
    name = "Buffer",
    h = { ":fold<CR>", "Hide/fold code" },
  },
}

local xmappings = {
  m = {
    name = "Magma",
    e = { "<Cmd><C-u>MagmaEvaluateVisual<Cr>", "Evaluate" },
  },
}

local lsp_mappings = {

  l = {
    name = "LSP",
    r = { "<Cmd>Lspsaga rename<CR>", "Rename" },
    u = { "<Cmd>Telescope lsp_references<CR>", "References" },
    o = { "<Cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
    d = { "<Cmd>Telescope lsp_definitions<CR>", "Definition" },
    a = { "<Cmd>Telescope lsp_code_actions<CR>", "Code actions" },
    e = { "<Cmd>lua vim.diagnostic.enable()<CR>", "Enable diagnostics" },
    x = { "<Cmd>lua vim.diagnostic.disable()<CR>", "Disable diagnostics" },
    n = { "<Cmd>update<CR>:Neoformat<CR>", "Neoformat" },
    t = { "<Cmd>TroubleToggle<CR>", "Trouble" },
  },

  -- WIP - refactoring
  -- nnoremap <silent><leader>chd :Lspsaga hover_doc<CR>
  -- nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
  -- nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
  -- nnoremap <silent><leader>cpd:Lspsaga preview_definition<CR>
  -- nnoremap <silent> <leader>cld :Lspsaga show_line_diagnostics<CR>
  -- {'n', '<leader>lds', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>' },
  -- {'n', '<leader>lde', '<cmd>lua vim.diagnostic.enable()<CR>'},
  -- {'n', '<leader>ldd', '<cmd>lua vim.diagnostic.disable()<CR>'},
  -- {'n', '<leader>ll', '<cmd>lua vim.diagnostic.set_loclist()<CR>'},
  -- {'n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
  -- {'v', '<leader>lcr', '<cmd>lua vim.lsp.buf.range_code_action()<CR>'},
}

local lsp_mappings_opts = {
  {
    "document_formatting",
    { ["lf"] = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format" } },
  },
  {
    "code_lens",
    {
      ["ll"] = {
        "<Cmd>lua vim.lsp.codelens.refresh()<CR>",
        "Codelens refresh",
      },
    },
  },
  {
    "code_lens",
    { ["ls"] = { "<Cmd>lua vim.lsp.codelens.run()<CR>", "Codelens run" } },
  },
}

local dap_nvim_dap_mappings = {
  d = {
    name = "DAP",
    b = { "<Cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
    c = { "<Cmd>lua require('dap').continue()<CR>", "Continue" },
    s = { "<Cmd>lua require('dap').step_over()<CR>", "Step over" },
    i = { "<Cmd>lua require('dap').step_into()<CR>", "Step into" },
    o = { "<Cmd>lua require('dap').step_out()<CR>", "Step out" },
    u = { "<Cmd>lua require('dapui').toggle()<CR>", "Toggle UI" },
    p = { "<Cmd>lua require('dap').repl.open()<CR>", "REPL" },
    e = { '<Cmd>lua require"telescope".extensions.dap.commands{}<CR>', "Commands" },
    f = { '<Cmd>lua require"telescope".extensions.dap.configurations{}<CR>', "Configurations" },
    r = { '<Cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', "List breakpoints" },
    v = { '<Cmd>lua require"telescope".extensions.dap.variables{}<CR>', "Variables" },
    m = { '<Cmd>lua require"telescope".extensions.dap.frames{}<CR>', "Frames" },
  },
}

local dap_vimspector_mappings = {
  d = {
    name = "DAP",
    b = { "<Cmd>call vimspector#ToggleBreakpoint()<CR>", "Toggle breakpoint" },
    c = { "<Cmd>call vimspector#Continue()<CR>", "Continue" },
    s = { "<Cmd>call vimspector#StepOver()<CR>", "Step over" },
    i = { "<Cmd>call vimspector#StepInto()<CR>", "Step into" },
    o = { "<Cmd>call vimspector#StepOut()<CR>", "Step out" },
    u = { "<Cmd>call vimspector#Launch()<CR>", "Launch" },
    f = { "<Cmd>call vimspector#GetConfigurations()<CR>", "Configurations" },
    r = { "<Cmd>call vimspector#ListBreakPoints()<CR>", "List breakpoints" },
    v = { "<Cmd>call vimspector#AddWatch()<CR>", "Add watch" },
    m = { "<Cmd>call vimspector#Evaluate()<CR>", "Evaluate" },
  },

  --- REFACTORING WIP
  --
  -- Vimspector
  -- ["<F5>"] = {name = "Vimspector - Launch"},
  -- ["<F8>"] = {name = "Vimspector - Run to Cursor"},
  -- ["<F9>"] = {name = "Vimspector - Cond. Breakpoint"},

  --     utils.map_key('n', '<leader>dsc',
  --                   '<cmd>lua require"dap.ui.variables".scopes()<CR>')
  --     utils.map_key('n', '<leader>dhh',
  --                   '<cmd>lua require"dap.ui.variables".hover()<CR>')
  --     utils.map_key('v', '<leader>dhv',
  --                   '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

  --     utils.map_key('n', '<leader>duh',
  --                   '<cmd>lua require"dap.ui.widgets".hover()<CR>')
  --     utils.map_key('n', '<leader>duf',
  --                   "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

  --     utils.map_key('n', '<leader>dsbr',
  --                   '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
  --     utils.map_key('n', '<leader>dsbm',
  --                   '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
  --     utils.map_key('n', '<leader>drl',
  --                   '<cmd>lua require"dap".repl.run_last()<CR>')
}

function M.register_lsp(client)
  local wk = require "which-key"
  wk.register(lsp_mappings, opts)

  for _, m in pairs(lsp_mappings_opts) do
    local capability, key = unpack(m)
    if client.resolved_capabilities[capability] then
      wk.register(key, opts)
    end
  end
end

function M.register_dap_vimspector()
  local wk = require "which-key"
  wk.register({
    ["dx"] = {
      ":lua require('config.whichkey').register_dap_nvim_dap()<CR>",
      "Switch to nvim-dap",
    },
  }, opts)
  wk.register(dap_vimspector_mappings, opts)
  vim.g.my_debugger = "v"
  vim.g.vimspector_enable_mappings = "HUMAN"
end

function M.register_dap_nvim_dap()
  local wk = require "which-key"
  wk.register({
    ["dx"] = { ":lua require('config.whichkey').register_dap_vimspector()<CR>", "Switch to vimspector" },
  }, opts)
  wk.register(dap_nvim_dap_mappings, opts)
  vim.g.my_debugger = "d"
  vim.g.vimspector_enable_mappings = ""
end

function M.register_dap()
  if vim.g.my_debugger == "v" then
    M.register_dap_vimspector()
  else
    M.register_dap_nvim_dap()
  end
end

function M.setup()
  local wk = require "which-key"
  wk.setup {}
  wk.register(mappings, opts)
  wk.register(vmappings, vopts)
  wk.register(xmappings, xopts)
end

return M
