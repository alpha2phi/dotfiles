---@diagnostic disable:undefined-global
local on_attach = require("lang/attach")
local capabilities = require("lang/capabilities")
local setup = {}
local root_pattern = require("lspconfig.util").root_pattern

local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server/bin"
local sumneko_binary = sumneko_root_path .. "/lua-language-server"

function setup.diagnosticls(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach.generic,
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"css",
			"json",
		},
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
	}

	server:setup(opts)
end

function setup.eslint(server)
	local opts = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			client.server_capabilities.document_formatting = true
			on_attach.generic(client, bufnr)
		end,
		settings = {
			format = { enable = true }, -- this will enable formatting
		},
	}

	server:setup(opts)
end

function setup.jsonls(server)
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

	server:setup(opts)
end

function setup.tsserver(server)
	local opts = {
		init_options = require("nvim-lsp-ts-utils").init_options,
		capabilities = capabilities,
		on_attach = on_attach.ts,
		settings = {
			format = {
				enable = true,
			},
		},
	}
	server:setup(opts)
end

function setup.sumneko_lua(server)
	local opts = require("lua-dev").setup({
		library = { vimruntime = true, types = true, plugins = true },
		lspconfig = {
			capabilities = capabilities,
			on_attach = on_attach.generic,
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

	server:setup(opts)
end

function setup.css(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach.generic,
		settings = {
			cmd = { "vscode-css-language-server", "--stdio" },
			filetypes = { "css", "scss", "less" },
			root_dir = root_pattern("package.json", ".git") or bufdir,
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

	server:setup(opts)
end

function setup.cssmodules(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach.generic,
		settings = {
			cmd = { "cssmodules-language-server" },
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			root_dir = root_pattern("package.json", ".git") or bufdir,
		},
	}

	server.setup(opts)
end

function setup.efm(_)
	local efmls = require("efmls-configs")
	local stylelint = require("efmls-configs.linters.stylelint")
	local eslint = require("efmls-configs.linters.eslint")

	efmls.init({
		default_config = true,
	})

	efmls.setup({
		css = {
			linter = stylelint,
		},
		javascript = {
			linter = eslint,
		},
		javascriptreact = {
			linter = eslint,
		},
		typescript = {
			linter = eslint,
		},
		typescriptreact = {
			linter = eslint,
		},
	})
end

function setup.generic(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach.generic,
		settings = {
			format = { enable = true }, -- this will enable formatting
		},
	}

	server:setup(opts)
end

return setup
