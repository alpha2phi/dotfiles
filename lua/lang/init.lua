---@diagnostic disable: undefined-global
local servers = require("nvim-lsp-installer")
local setup_server = require("lang/setup")

servers.settings({
	pip = {
		install_args = {
			"--sync",
		},
	},
})

servers.on_server_ready(function(server)
	if
		(
			server.name == "tsserver"
			or server.name == "efm"
			or server.name == "jsonls"
			or server.name == "sumneko_lua"
			or server.name == "cssls"
			or server.name == "html"
			or server.name == "tailwindcss"
			or server.name == "vimls"
			or server.name == "zls"
		) and not server:is_installed()
	then
		server:install()
	end

	if not server:is_installed() then
		return
	end

	if server.name == "jsonls" then
		setup_server.jsonls(server)
	elseif server.name == "efm" then
		setup_server.efm(server)
	elseif server.name == "cssls" then
		setup_server.css(server)
	elseif server.name == "cssmodules" then
		setup_server.cssmodules(server)
	elseif server.name == "tsserver" then
		setup_server.tsserver(server)
	elseif server.name == "sumneko_lua" then
		setup_server.sumneko_lua(server)
	else
		setup_server.generic(server)
	end

	vim.cmd([[do User LspAttachBuffers]])
end)

--Some Diagnostic Icons
vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })

-- LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	underline = true,
	signs = true,
	update_in_insert = false,
})

-- Litee Calltree Setup
-- vim.lsp.handlers["callHierarchy/incomingCalls"] = vim.lsp.with(
-- 	require("litee.calltree.handlers").ch_lsp_handler("from"),
-- 	{}
-- )
-- vim.lsp.handlers["callHierarchy/outgoingCalls"] = vim.lsp.with(
-- 	require("litee.calltree.handlers").ch_lsp_handler("to"),
-- 	{}
-- )
