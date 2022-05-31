---@diagnostic disable:undefined-global
local on_attach = {}

function on_attach.generic(client, bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)

	require("aerial").on_attach(client, bufnr)

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightMagenta
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightMagenta
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightMagenta
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

function on_attach.ts(client, bufnr)
	local ts_utils = require("nvim-lsp-ts-utils")

	-- defaults
	ts_utils.setup({
		debug = false,
		disable_commands = false,
		enable_import_on_completion = true,

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
		complete_parens = true,
		signature_help_in_parens = true,

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

	ts_utils.setup_client(client)
	on_attach.generic(client, bufnr)
end

return on_attach
