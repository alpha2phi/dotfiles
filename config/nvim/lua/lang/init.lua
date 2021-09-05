USER = vim.fn.expand('$USER')

-- Language specific key mappings
require('lang.keymappings')

local key_mappings = {
    {'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>'},
    {'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>'},
    {'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>'},
    {'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
    {'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'},
    {'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'},
    {'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'},
    {'n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'},
    {'n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'},
    {
        'n', '<leader>lwl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'
    }, {'n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>'},
    {'n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>'},
    {'n', '<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>'},
    {
        'n', '<leader>lds',
        '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'
    }, {'n', '<leader>lde', '<cmd>lua vim.lsp.diagnostic.enable()<CR>'},
    {'n', '<leader>ldd', '<cmd>lua vim.lsp.diagnostic.disable()<CR>'},
    {'n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'},
    {'n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
    {'v', '<leader>lcr', '<cmd>lua vim.lsp.buf.range_code_action()<CR>'},
    {'n', '<leader>lss', '<cmd>lua vim.lsp.buf.document_symbol()<CR>'},
    {'n', '<leader>lsw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>'}
}

local alt_key_mappings = {
    {
        "document_formatting", "n", "<leader>lff",
        "<cmd>lua vim.lsp.buf.formatting()<CR>"
    }, {
        "document_range_formatting", "n", "<leader>lfr",
        "<cmd>lua vim.lsp.buf.range_formatting()<CR>"
    },
    {
        "code_lens", "n", "<leader>lcld",
        "<Cmd>lua vim.lsp.codelens.refresh()<CR>"
    }, {"code_lens", "n", "<leader>lclr", "<Cmd>lua vim.lsp.codelens.run()<CR>"}
}

local function set_lsp_config(client, bufnr)
    require"lsp_signature".on_attach({
        bind = true,
        handler_opts = {border = "single"}
    })

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(...) end

    buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Key mappings
    local opts = {noremap = true, silent = true}
    for _, mappings in pairs(key_mappings) do
        local mode, lhs, rhs = unpack(mappings)
        buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Other key mappings
    for _, mappings in pairs(alt_key_mappings) do
        local capability, mode, lhs, rhs = unpack(mappings)
        if client.resolved_capabilities[capability] then
            buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end
    end

end

local function set_lsp_highlight(client, bufnr)
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#282f45
        hi LspReferenceText cterm=bold ctermbg=red guibg=#282f45
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#282f45
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end

    -- if client.resolved_capabilities.code_lens then
    --     print("code lens")
    --     vim.api.nvim_exec([[
    --     augroup lsp_code_lens
    --     autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
    --     augroup END
    --     ]], false)
    -- end

end

local lsp_on_attach = function(client, bufnr)
    set_lsp_config(client, bufnr)
    set_lsp_highlight(client, bufnr)
end

-- local function lsp_on_exit(client, bufnr) print("LSP exit") end
-- local function lsp_on_init(client) print(vim.inspect(client)) end

local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- for nvim-cmp
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Code actions
capabilities.textDocument.codeAction = {
    -- FIX: Code actions not working
    dynamicRegistration = true,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = (function()
                local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                table.sort(res)
                return res
            end)()
        }
    }

    -- codeActionLiteralSupport = {
    --     codeActionKind = {
    --         valueSet = {
    --             "", "Empty", "QuickFix", "Refactor", "RefactorExtract",
    --             "RefactorInline", "RefactorRewrite", "Source",
    --             "SourceOrganizeImports", "quickfix", "refactor",
    --             "refactor.extract", "refactor.inline", "refactor.rewrite",
    --             "source", "source.organizeImports"
    --         }
    --     }
    -- },
    -- dynamicRegistration = false
}

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}
capabilities.experimental = {}
capabilities.experimental.hoverActions = true

-- Language servers
local servers = {
    pyright = {},
    gopls = {
        -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
        experimentalPostfixCompletions = true,
        analyses = {unusedparams = true, unreachable = false},
        codelenses = {
            generate = true,
            gc_details = true,
            test = true,
            tidy = true
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        matcher = "fuzzy",
        experimentalDiagnosticsDelay = "500ms",
        symbolMatcher = "fuzzy",
        gofumpt = true,
        buildFlags = {"-tags", "integration"}
    },
    tsserver = {},
    vimls = {}
    -- rust_analyzer = {},
}

-- local servers = require'lspinstall'.installed_servers()
-- local coq = require("coq")

local function setup_servers(lsp_servers)
    for server, config in pairs(lsp_servers) do

        nvim_lsp[server].setup( -- coq.lsp_ensure_capabilities(
        vim.tbl_deep_extend("force", {
            on_attach = lsp_on_attach,
            -- on_exit = lsp_on_exit,
            -- on_init = lsp_on_init,
            capabilities = capabilities,
            flags = {debounce_text_changes = 150},
            init_options = config
        }, {}))
        -- )

        local cfg = nvim_lsp[server]
        if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
            print(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
        end
    end
end

local function setup_null_ls()
    nvim_lsp["null-ls"].setup(vim.tbl_deep_extend("force", {
        on_attach = lsp_on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150}
    }, {}))

    local cfg = nvim_lsp["null-ls"]
    if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
        print("null-ls" .. ": cmd not found: " .. vim.inspect(cfg.cmd))
    end
end

local function configure_null_ls()
    local null_ls = require("null-ls")
    local sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.isort, null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.flake8
    }
    null_ls.config({sources = sources})
end

setup_servers(servers)
configure_null_ls()
setup_null_ls()

-- rust-tools.nvim
local function setup_rust_tools()
    local tools = {
        autoSetHints = true,
        runnables = {use_telescope = true},
        inlay_hints = {show_parameter_hints = true},
        hover_actions = {auto_focus = true}
    }
    require('rust-tools').setup({
        tools = tools,
        server = {
            on_attach = lsp_on_attach,
            capabilities = capabilities,
            flags = {debounce_text_changes = 150}
        }
        -- settings = {
        --     ["rust-analyzer"] = {
        --         assist = {
        --             importGranularity = "module",
        --             importEnforceGranularity = true
        --         },
        --         cargo = {loadOutDirsFromCheck = true, allFeatures = true},
        --         procMacro = {enable = true},
        --         checkOnSave = {command = "clippy"},
        --         experimental = {procAttrMacros = true},
        --         hoverActions = {references = true},
        --         inlayHints = {
        --             chainingHints = true,
        --             maxLength = 40,
        --             parameterHints = true,
        --             typeHints = true
        --         },
        --         lens = {methodReferences = true, references = true}
        --     }
        -- }
    })
    require('rust-tools-debug').setup()
end

pcall(setup_rust_tools)

-- Lua LSP
local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/Users/" .. USER ..
                         "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/home/" .. USER ..
                         "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

-- lua-dev.nvim
local luadev = require("lua-dev").setup({
    library = {vimruntime = true, types = true, plugins = true},
    lspconfig = {
        capabilities = capabilities,
        on_attach = lsp_on_attach,
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';')
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'}
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                    }
                }
            }
        }
    }
})
nvim_lsp.sumneko_lua.setup(luadev)

-- symbols-outline.nvim
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false, -- experimental
    position = 'right',
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a"
    },
    lsp_blacklist = {}
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        underline = false,
        signs = true,
        update_in_insert = false
    })

-- local on_references = vim.lsp.handlers["textDocument/references"]
-- vim.lsp.handlers["textDocument/references"] =
--     vim.lsp.with(on_references, {
--         -- loclist = true,
--         virtual_text = true
--     })

-- Send diagnostics to quickfix list
do
    local method = "textDocument/publishDiagnostics"
    local default_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, meth, result, client_id, bufnr,
                                        config)
        default_handler(err, meth, result, client_id, bufnr, config)
        local diagnostics = vim.lsp.diagnostic.get_all()
        local qflist = {}
        for buf, diagnostic in pairs(diagnostics) do
            for _, d in ipairs(diagnostic) do
                d.bufnr = buf
                d.lnum = d.range.start.line + 1
                d.col = d.range.start.character + 1
                d.text = d.message
                table.insert(qflist, d)
            end
        end
        vim.lsp.util.set_qflist(qflist)
    end
end
