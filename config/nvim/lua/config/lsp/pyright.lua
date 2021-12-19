local M = {}

-- local lsputils = require "config.lsp.utils"

function M.config(installed_server)
  return {
    -- cmd = installed_server._default_options.cmd,
  }
end

function M.setup(installed_server)
  -- lsputils.setup_server("pyright", M.config(installed_server))
  M.autocmds()
  M.keymappings()
  return M.config(installed_server)
end

function M.autocmds()
  vim.api.nvim_exec(
    [[

      augroup PYTHON
        autocmd!

        autocmd BufEnter *.py lua require("config.lsp.pyright").keymappings()
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
      r = {
        ":update<CR>:exec '!python3' shellescape(@%, 1)<CR>",
        "Python run",
      },
      d = { ":update<CR>:sp term://python3 -m pdb %<CR>", "PDB debug" },
      w = { ":update<CR>:sp term://nodemon -e py %<CR>", "Nodemon watch" },
      c = { ":PyrightOrganizeImports<CR>", "Organize imports" },
      l = { ":update<CR>:exec '!python3'<CR>", "REPL" },
    },
  }
  wk.register(mappings, opts)
end

return M
