local M = {
  { "is.", "<Plug>(textobj-sandwich-query-i)", "sandwich query" },
  { "is*", "<Plug>(textobj-sandwich-auto-i)", "auto sandwich i" },
  { "is$", "<Plug>(textobj-sandwich-literal-query-i)", "literal sandwich i" },
  { "as.", "<Plug>(textobj-sandwich-query-a)", "auto sandwich query" },
  { "as*", "<Plug>(textobj-sandwich-auto-a)", "auto sandwich a" },
  { "as$", "<Plug>(textobj-sandwich-literal-query-a)", "literal sandwich a" },
  { "m", ":<C-U>lua require('tsht').nodes()<CR>", "TS hop" },
}

return M
