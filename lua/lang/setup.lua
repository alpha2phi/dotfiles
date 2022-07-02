---@diagnostic disable:undefined-global
local root_pattern = require("lspconfig.util").root_pattern
local lsp_format = require("lsp-format")
local on_attach = require("lang/attach")
local capabilities = require("lang/capabilities")

local setup = {}
local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server/bin"
local sumneko_binary = sumneko_root_path .. "/lua-language-server"

function setup.diagnosticls()
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach.minimal,
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    -- root_dir = root_pattern("tsconfig.json", ".eslintrc.json", "package.json", ".git"),
    init_options = {
      filetypes = {
        javascript = "eslint",
        typescript = "eslint",
        javascriptreact = "eslint",
        typescriptreact = "eslint",
      },
      linters = {
        eslint = {
          sourceName = "eslint",
          command = "eslint_d",
          rootPatterns = {
            ".eslintrc.js",
            ".eslintrc.json",
            ".eslintrc",
            "package.json",
          },
          debounce = 100,
          args = {
            "--cache",
            "--stdin",
            "--stdin-filename",
            "%filepath",
            "--format",
            "json",
          },
          parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity",
          },
          securities = {
            [2] = "error",
            [1] = "warning",
          },
        },
      },
    },
  }

  return opts
end

function setup.eslint()
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach.minimal,
    settings = {
      format = { enable = false }, -- this will enable formatting
    },
  }

  return opts
end

function setup.jsonls()
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach.generic,
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
          {
            fileMatch = { "tsconfig*.json" },
            url = "https://json.schemastore.org/tsconfig.json",
          },
          {
            fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
            url = "https://json.schemastore.org/prettierrc.json",
          },
          {
            fileMatch = { ".eslintrc", ".eslintrc.json" },
            url = "https://json.schemastore.org/eslintrc.json",
          },
          {
            fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
            url = "https://json.schemastore.org/babelrc.json",
          },
          {
            fileMatch = { "lerna.json" },
            url = "https://json.schemastore.org/lerna.json",
          },
          {
            fileMatch = { "now.json", "vercel.json" },
            url = "https://json.schemastore.org/now.json",
          },
          {
            fileMatch = { "ecosystem.json" },
            url = "https://json.schemastore.org/pm2-ecosystem.json",
          },
        },
      },
    },
  }

  return opts
end

function setup.tsserver()
  local opts = {
    capabilities = capabilities,
    handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    },
    on_attach = on_attach.tsserver,
    settings = { format = { enable = true } }
  }

  return opts
end

function setup.sumneko_lua()
  local opts = require("lua-dev").setup({
    library = { vimruntime = true, types = true, plugins = true },
    lspconfig = {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach.generic(client, bufnr)
        lsp_format.on_attach(client, bufnr)
      end,
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      settings = {
        format = { enable = true }, -- this will enable formatting
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Setup your lua path
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/config")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/lang")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/statusline")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/utils")] = true,
            },
          },
        },
      },
    },
  })

  return opts
end

function setup.cssls()
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach.minimal,
    settings = {
      cmd = { "vscode-css-language-server", "--stdio" },
      filetypes = { "css", "scss", "less" },
      -- root_dir = root_pattern("package.json", ".git"),
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
      less = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
      scss = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  }

  return opts
end

function setup.cssmodules_ls()
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach.minimal,
    settings = {
      cmd = { "cssmodules-language-server" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      -- root_dir = root_pattern("package.json", ".git"),
    },
  }

  return opts
end

function setup.efm()
  local efmls = require("efmls-configs")
  local fs = require("efmls-configs.fs")
  local root_path = vim.api.nvim_call_function("getcwd", {})

  local eslint_cfg_path   = table.foreach({
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
  }, function(_, value)
    return exists(root_path .. "/" .. value) and root_path .. "/" .. value or nil
  end) or root_path .. "/package.json"
  local prettier_cfg_path = table.foreach({
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.json5",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.config.js",
    ".prettierrc.config.cjs",
    ".prettierrc.toml",
  }, function(_, value)
    return exists(root_path .. "/" .. value) and root_path .. "/" .. value or nil
  end) or root_path .. "/package.json"


  local stylelint = require("efmls-configs.linters.stylelint")
  local eslint = require("efmls-configs.linters.eslint_d")
  -- local luacheck = require("efmls-configs.linters.luacheck")
  local prettier = {
    formatCommand = string.format('%s --stdin --stdin-filepath ${INPUT}' ..
      ' --eslint-config-path ' .. eslint_cfg_path .. ' --config ' .. prettier_cfg_path,
      fs.executable('prettier-eslint', fs.Scope.NODE)),
    formatStdin = true,
  }

  local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virutal_text = false,
      underline = true,
      signs = true,
      update_in_insert = false,
    })
  }


  efmls.init({
    on_attach = lsp_format.on_attach,
    handlers = handlers,
    init_options = {
      documentFormatting = true,
    },
  })

  efmls.setup({
    css = {
      linter = stylelint,
    },
    javascript = {
      linter = eslint,
      formatter = prettier,
    },
    javascriptreact = {
      linter = eslint,
      formatter = prettier,
    },
    typescript = {
      linter = eslint,
      formatter = prettier,
    },
    typescriptreact = {
      linter = eslint,
      formatter = prettier,
    }
  })
end

function setup.generic()
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach.minimal,
    settings = {
      format = { enable = false }, -- this will enable formatting
      -- root_dir = root_pattern("tsconfig.json", ".eslintrc.json", "package.json", ".git"),
    },
    autostart = true,
  }

  return opts
end

function setup.null_ls()
  local ls = require("null-ls")

  ls.setup({
    sources = {
      ls.builtins.diagnostics.eslint_d,
      ls.builtins.code_actions.eslint_d,
      ls.builtins.formatting.prettier
    },
    on_attach = on_attach.null_ls,
    update_in_insert = true,
  })
end

return setup
