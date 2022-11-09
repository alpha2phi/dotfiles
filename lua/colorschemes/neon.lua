local opts = {
  neon_style = "dark",
  neon_italic_keyword = true,
  neon_italic_variable = true,
  neon_italic_functions = true,
  neon_bold = true,
  neon_transparent = false,
}

for key, value in pairs(opts) do
  vim.api.nvim_set_var(key, value)
end
