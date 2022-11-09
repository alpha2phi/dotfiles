local M = {
  {
    "[",
    {
      { "t", "<C-\\><C-n>:FloatermPrev<CR>" },
    },
  },
  {
    "]",
    {
      { "t", "<C-\\><C-n>:FloatermNext<CR>" },
    },
  },
  {
    "<leader>",
    {
      {
        "t",
        {
          { "t", "<C-\\><C-n>:FloatermToggle<CR>" },
          { "T", "<C-\\><C-n>:FloatermNew<CR>" },
        },
      },
    },
  },
}

return M
