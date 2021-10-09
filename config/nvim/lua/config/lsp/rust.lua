local M = {}

local lsputils = require "config.lsp.utils"

CONFIG = {}

function M.setup()
  require("rust-tools").setup {
    tools = {
      hover_actions = {
        auto_focus = true,
      },
    },
    server = {
      capabilities = lsputils.get_capabilities(),
      on_attach = lsputils.lsp_attach,
      on_init = lsputils.lsp_init,
      on_exit = lsputils.lsp_exit,
      flags = { debounce_text_changes = 150 },
    },
  }

  M.autocmds()
  M.keymappings()
end

function M.autocmds()
  vim.api.nvim_exec(
    [[

      augroup RUST
        autocmd!

        autocmd FileType rust packadd termdebug
        autocmd BufEnter *.rs lua require("config.lsp.rust").keymappings()
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
      r = { ":update<CR>:RustRun<CR>", "Rust run" },
      d = { ":update<CR>:RustDebuggables<CR>", "Rust debuggables" },
      w = {
        ":update<CR>:sp term://cargo watch -s 'clear && cargo run -q'<CR>",
        "Cargo watch",
      },
      c = { ":update<CR>:Cargo run<CR>", "Cargo run" },
      l = { ":RustRunnables<CR>", "Rust runnables" },
    },
  }
  wk.register(mappings, opts)
end

return M
