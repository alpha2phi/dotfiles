local opts = {
  tokyonight_style = "night",
  tokyonight_italic_functions = true,
  tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "symbols_outline", "aerial", "trouble" },
}

for key, value in pairs(opts) do
  vim.api.nvim_set_var(key, value)
end
