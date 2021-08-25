USER = vim.fn.expand("$USER")

-- Language specific key mappings
require("lang.keymappings")

local on_attach = function(client, bufnr)
	require("lsp_signature").on_attach(client)

	local function buf_set_keymap(...)
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
		buf_set_keymap("n", "<leader>l<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<leader>l<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
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
local capabilities = vim.lsp.protocol.make_client_capabilities()

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
	require("lspinstall").setup()
	local servers = require("lspinstall").installed_servers()
	for _, server in pairs(servers) do
		if server == "diagnosticls" then
			nvim_lsp[server].setup({
				capabilities = capabilities,
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "json" },
				init_options = {
					filetypes = {
						javascript = "eslint",
						typescript = "eslint",
						javascriptreact = "eslint",
						typescriptreact = "eslint",
						css = "eslint",
						json = "eslint",
					},
					linters = {
						eslint = {
							sourceName = "eslint",
							command = "eslint_d",
							rootPatterns = {
								".eslintrc.js",
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
			})
		else
			nvim_lsp[server].setup({ capabilities = capabilities, on_attach = on_attach })
		end
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

--Some Diagnostic Icons

vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })

-- Lua LSP
USER = vim.fn.expand("$USER")

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
	sumneko_root_path = "/Users/" .. USER .. "/.local/git/lua-language-server"
	sumneko_binary = "/Users/" .. USER .. "/.local/git/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
	sumneko_root_path = "/home/" .. USER .. "/.local/git/lua-language-server"
	sumneko_binary = "/home/" .. USER .. "/.local/git/lua-language-server/bin/Linux/lua-language-server"
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
vim.g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = true, -- experimental
	position = "right",
	keymaps = {
		close = "<Esc>",
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
}

-- LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	underline = true,
	signs = true,
	update_in_insert = false,
})

-- Send diagnostics to quickfix list
do
	local method = "textDocument/publishDiagnostics"
	local default_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
		default_handler(err, method, result, client_id, bufnr, config)
		local diagnostics = vim.lsp.diagnostic.get_all()
		local qflist = {}
		for bufnr, diagnostic in pairs(diagnostics) do
			for _, d in ipairs(diagnostic) do
				d.bufnr = bufnr
				d.lnum = d.range.start.line + 1
				d.col = d.range.start.character + 1
				d.text = d.message
				table.insert(qflist, d)
			end
		end
		vim.lsp.util.set_qflist(qflist)
	end
end
