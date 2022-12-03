---@diagnostic disable:undefined-global
local on_attach = {}


function on_attach.minimal(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

function on_attach.generic(client, bufnr)
  on_attach.minimal(client, bufnr)
  -- if client.server_capabilities.documentSymbolProvider then
  require("nvim-navic").attach(client, bufnr)
  -- end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=yellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=yellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=yellow
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
      false
    )
  end

  if client.server_capabilities.colorProvider then
    -- Attach document colour support
    require("document-color").buf_attach(bufnr)
  end
end

function on_attach.clojure(client, bufnr)
  on_attach.generic(client, bufnr)

  require("lsp-format").on_attach(client)
  -- require("lsp_signature").on_attach({
  --   fix_pos             = true,
  --   always_trigger      = true,
  --   extra_trigger_chars = { "(", "," },
  --   transparency        = 10,
  --   toggle_key          = "<C-k>",
  --   doc_lines           = 21,
  -- }, bufnr)
end

function on_attach.python(client, bufnr)
  on_attach.generic(client, bufnr)

  require("lsp-format").on_attach(client)
  -- require("lsp_signature").on_attach({
  --   fix_pos             = true,
  --   always_trigger      = true,
  --   extra_trigger_chars = { "(", "," },
  --   transparency        = 10,
  --   toggle_key          = "<C-k>",
  --   doc_lines           = 21,
  -- }, bufnr)
end

function on_attach.lua(client, bufnr)
  on_attach.generic(client, bufnr)

  -- require("lsp_signature").on_attach({
  --   fix_pos             = true,
  --   always_trigger      = true,
  --   extra_trigger_chars = { "(", "," },
  --   transparency        = 10,
  --   toggle_key          = "<C-k>",
  --   doc_lines           = 21,
  -- }, bufnr)
end

function on_attach.typescript(client, bufnr)
  on_attach.generic(client, bufnr)

  require("lsp-format").on_attach(client)
  -- require("lsp_signature").on_attach({
  --   fix_pos             = true,
  --   always_trigger      = true,
  --   extra_trigger_chars = { "(", "," },
  --   transparency        = 10,
  --   toggle_key          = "<C-k>",
  --   doc_lines           = 21,
  -- }, bufnr)
end

function on_attach.null(client, bufnr)
  local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          timeout_ms = 2000,
          filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end,
    })
  end
end

return on_attach
