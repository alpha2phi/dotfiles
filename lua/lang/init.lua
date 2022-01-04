---@diagnostic disable: undefined-global
local efmls = require("efmls-configs")
-- local litee_handlers =

efmls.init({
	default_config = true,
})

efmls.setup()

local on_attach = function(client, bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)

	local function bufkeymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		bufkeymap("n", "<leader>l<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		bufkeymap("n", "<leader>l<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
			false
		)
	end
end

local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Code actions
capabilities.textDocument.codeAction = {
	dynamicRegistration = true,
	codeActionLiteralSupport = {
		codeActionKind = {
			valueSet = (function()
				local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
				table.sort(res)
				return res
			end)(),
		},
	},
}

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSPs
local function setup_servers()
	local servers = require("nvim-lsp-installer")
	servers.on_server_ready(function(server)
		if
			(server.name == "tsserver" or server.name == "efm" or server.name == "jsonls") and not server:is_installed()
		then
			server:install()
		end

		if not server:is_installed() or server.name == "efm" then
			return
		end

		-- if server.name == "diagnosticls" then
		-- 	local opts = {
		-- 		capabilities = capabilities,
		-- 		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "json" },
		-- 		init_options = {
		-- 			filetypes = {
		-- 				javascript = "eslint",
		-- 				typescript = "eslint",
		-- 				javascriptreact = "eslint",
		-- 				typescriptreact = "eslint",
		-- 				css = "eslint",
		-- 				json = "eslint",
		-- 			},
		-- 			linters = {
		-- 				eslint = {
		-- 					sourceName = "eslint",
		-- 					command = "eslint_d",
		-- 					rootPatterns = {
		-- 						".eslintrc.js",
		-- 						".eslintrc",
		-- 						"package.json",
		-- 					},
		-- 					debounce = 100,
		-- 					args = {
		-- 						"--cache",
		-- 						"--stdin",
		-- 						"--stdin-filename",
		-- 						"%filepath",
		-- 						"--format",
		-- 						"json",
		-- 					},
		-- 					parseJson = {
		-- 						errorsRoot = "[0].messages",
		-- 						line = "line",
		-- 						column = "column",
		-- 						endLine = "endLine",
		-- 						endColumn = "endColumn",
		-- 						message = "${message} [${ruleId}]",
		-- 						security = "severity",
		-- 					},
		-- 					securities = {
		-- 						[2] = "error",
		-- 						[1] = "warning",
		-- 					},
		-- 				},
		-- 			},
		-- 		},
		-- 	}
		-- 	server:setup(opts)
		-- elseif server.name == "eslint" then
		-- 	local opts = {
		-- 		capabilities = capabilities,
		-- 		on_attach = function(client, bufnr)
		-- 			-- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
		-- 			-- the resolved capabilities of the eslint server ourselves!
		-- 			client.resolved_capabilities.document_formatting = true
		-- 			on_attach(client, bufnr)
		-- 		end,
		-- 		settings = {
		-- 			format = { enable = true }, -- this will enable formatting
		-- 		},
		-- 	}
		-- 	server:setup(opts)
		if server.name == "jsonls" then
			local opts = {
				capabilities = capabilities,
				on_attach = on_attach,
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

			server:setup(opts)
		elseif server.name == "tsserver" then
			local opts = {
				init_options = require("nvim-lsp-ts-utils").init_options,
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					local ts_utils = require("nvim-lsp-ts-utils")

					-- defaults
					ts_utils.setup({
						debug = false,
						disable_commands = false,
						enable_import_on_completion = false,

						-- import all
						import_all_timeout = 5000, -- ms
						-- lower numbers = higher priority
						import_all_priorities = {
							same_file = 1, -- add to existing import statement
							local_files = 2, -- git files or files with relative path markers
							buffer_content = 3, -- loaded buffer content
							buffers = 4, -- loaded buffer names
						},
						import_all_scan_buffers = 100,
						import_all_select_source = false,

						-- formatting
						enable_formatting = true,

						-- parentheses completion
						complete_parens = false,
						signature_help_in_parens = false,

						-- filter diagnostics
						filter_out_diagnostics_by_severity = { "hint" },
						filter_out_diagnostics_by_code = {},

						-- inlay hints
						auto_inlay_hints = true,
						inlay_hints_highlight = "Comment",

						-- update imports on file move
						update_imports_on_move = true,
						require_confirmation_on_move = true,
						watch_dir = nil,
					})

					-- required to fix code action ranges and filter diagnostics
					ts_utils.setup_client(client)

					-- no default maps, so you may want to define some here
					local kmOpts = { silent = true }
					vim.api.nvim_buf_set_keymap(bufnr, "n", "gO", ":TSLspOrganize<CR>", kmOpts)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", ":TSLspRenameFile<CR>", kmOpts)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "gI*", ":TSLspImportAll<CR>", kmOpts)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "gI.", ":TSLspImportCurrent<CR>", kmOpts)

					on_attach(client, bufnr)
				end,
				settings = {
					format = { enable = true }, -- this will enable formatting
				},
			}
			server:setup(opts)
		else
			local opts = {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					format = { enable = true }, -- this will enable formatting
				},
			}
			server:setup(opts)
		end

		vim.cmd([[ do User LspAttachBuffers ]])
	end)
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("nvim-lsp-installer").post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

--Some Diagnostic Icons

vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })

-- Lua LSP
local sumneko_root_path = ""
local sumneko_binary = ""
local user_home = vim.fn.expand("$HOME")

if vim.fn.has("mac") == 1 then
	sumneko_root_path = user_home .. "/.local/git/lua-language-server"
	sumneko_binary = user_home .. "/.local/git/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
	sumneko_root_path = user_home .. "/.local/git/lua-language-server"
	sumneko_binary = user_home .. "/.local/git/lua-language-server/bin/Linux/lua-language-server"
else
	print("Unsupported system for sumneko")
end

-- lua-dev.nvim
local luadev = require("lua-dev").setup({
	library = { vimruntime = true, types = true, plugins = true },
	lspconfig = {
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
		settings = {
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
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	},
})
nvim_lsp.sumneko_lua.setup(luadev)

-- symbols-outline.nvim
-- vim.g.symbols_outline = {
-- 	highlight_hovered_item = true,
-- 	show_guides = true,
-- 	auto_preview = true, -- experimental
-- 	position = "right",
-- 	keymaps = {
-- 		close = "<Esc>",
-- 		goto_location = "<Cr>",
-- 		focus_location = "o",
-- 		hover_symbol = "<C-space>",
-- 		rename_symbol = "r",
-- 		code_actions = "a",
-- 	},
-- 	lsp_blacklist = {},
-- }

-- LSP Enable diagnostics
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	virtual_text = true,
-- 	underline = true,
-- 	signs = true,
-- 	update_in_insert = false,
-- })

-- Send diagnostics to quickfix list
-- do
-- 	local cur_method = "textDocument/publishDiagnostics"
-- 	local default_handler = vim.lsp.handlers[cur_method]
-- 	vim.lsp.handlers[cur_method] = function(err, cur_loc_method, result, client_id, bufnr, config)
-- 		default_handler(err, cur_loc_method, result, client_id, bufnr, config)
-- 		local diagnostics = vim.lsp.diagnostic.get_all()
-- 		local qflist = {}
-- 		for cur_bufnr, diagnostic in pairs(diagnostics) do
-- 			for _, d in ipairs(diagnostic) do
-- 				d.bufnr = cur_bufnr
-- 				d.lnum = d.range.start.line + 1
-- 				d.col = d.range.start.character + 1
-- 				d.text = d.message
-- 				table.insert(qflist, d)
-- 			end
-- 		end
-- 		vim.lsp.util.set_qflist(qflist)
-- 	end
-- end

-- vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
-- vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
-- vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
-- vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
-- vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
-- vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
-- vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
-- vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
