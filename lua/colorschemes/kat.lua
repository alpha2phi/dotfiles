local opts = {
  kat_nvim_commentStyle = "italic",
  kat_nvim_integrations = { "lsp", "treesitter", "ts_rainbow", "cmp" }, --, "bufferline" }
  kat_nvim_stupidFeatures = true,
}

for key, value in pairs(opts) do
  vim.api.nvim_set_var(key, value)
end
