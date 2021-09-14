local M = {}

local lsputils = require "config.lsp.utils"
local lspconfig = require "lspconfig"

function M.lsp_attach(client, bufnr)
  lsputils.lsp_attach(client, bufnr)

  -- disable tsserver formatting if you plan on formatting via null-ls
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local ts_utils = require "nvim-lsp-ts-utils"

  -- defaults
  ts_utils.setup {
    debug = false,
    disable_commands = false,
    enable_import_on_completion = false,

    -- import all
    import_all_timeout = 5000, -- ms
    import_all_priorities = {
      buffers = 4, -- loaded buffer names
      buffer_content = 3, -- loaded buffer content
      local_files = 2, -- git files or files with relative path markers
      same_file = 1, -- add to existing import statement
    },
    import_all_scan_buffers = 100,
    import_all_select_source = false,

    -- eslint
    eslint_enable_code_actions = false,
    eslint_enable_disable_comments = true,
    eslint_bin = "eslint",
    eslint_enable_diagnostics = false,
    eslint_opts = {},

    -- formatting
    enable_formatting = false,
    formatter = "prettier",
    formatter_opts = {},

    -- update imports on file move
    update_imports_on_move = false,
    require_confirmation_on_move = false,
    watch_dir = nil,

    -- filter diagnostics
    filter_out_diagnostics_by_severity = {},
    filter_out_diagnostics_by_code = {},
  }

  -- required to fix code action ranges and filter diagnostics
  ts_utils.setup_client(client)
end

CONFIG = {
  on_attach = M.lsp_attach,
  capabilities = lsputils.get_capabilities(),
  on_init = lsputils.lsp_init,
  on_exit = lsputils.lsp_exit,
}

function M.setup()
  lspconfig["typescript"].setup(CONFIG)
  -- M.autocmds()
  -- M.keymappings()
end

function M.autocmds()
  vim.api.nvim_exec(
    [[

      augroup TYPESCRIPT
        autocmd!

        autocmd BufEnter *.ts lua require("config.lsp.typescript").keymappings()
      augroup END

    ]],
    false
  )
end

function M.keymappings()
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = true,
  }

  local wk = require "which-key"
  local mappings = {
    ["r"] = {
      name = "Run",
      -- r = {
      --   ":update<CR>:exec '!python3' shellescape(@%, 1)<CR>",
      --   "Python run",
      -- },
      -- d = { ":update<CR>:sp term://python3 -m pdb %<CR>", "PDB debug" },
      -- w = { ":update<CR>:sp term://nodemon -e py %<CR>", "Nodemon watch" },
      -- c = { ":PyrightOrganizeImports<CR>", "Organize imports" },
      -- l = { ":update<CR>:exec '!python3'<CR>", "REPL" },
    },
  }
  wk.register(mappings, opts)
end

return M
