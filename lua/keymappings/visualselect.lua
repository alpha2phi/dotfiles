local M = {
  { "<lt>", "<gv" },
  { "<gt>", ">gv" },
  { "J", ":m '>+1<CR>gv=gv<CR>" },
  { "K", ":m '<-2<CR>gv=gv<CR>" },
  {
    "g",
    {
      { "x", ":'<,'>SnipRun<CR>", "run snippet" },
    },
  },
  { "m", ":lua require('tsht').nodes()<CR>", "TS hop" },
}

return M
