local M = {}

local opts = { noremap = true, silent = false }

local generic_opts = {
  insert_mode = opts,
  normal_mode = opts,
  visual_mode = opts,
  visual_block_mode = opts,
  command_mode = opts,
  term_mode = { silent = false },
}

local mode_adapters = {
  insert_mode = "i",
  normal_mode = "n",
  term_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",
}

local keymappings = {
  insert_mode = {
    ["jk"] = "<Esc>",
    ["<M-j>"] = "<Esc>:m .+1<CR>==gi",
    ["<M-k>"] = "<Esc>:m .-2<CR>==gi",
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
    ["!"] = "!<c-g>u",
    ["?"] = "?<c-g>u",
  },
  normal_mode = {
    ["s"] = {
      "<Plug>(easymotion-overwin-f)",
      { noremap = false, silent = false },
    },
    ["<C-l>"] = "<Cmd>noh<CR>",
    ["<C-w><C-o>"] = "<Cmd>MaximizerToggle!<CR>",
    ["<M-left>"] = "<C-w>>",
    ["<M-right>"] = "<C-w><",
    ["<M-up>"] = "<C-w>+",
    ["<M-down"] = "<C-w>-",
    ["<M-j>"] = ":m .+1<CR>==",
    ["<M-k>"] = ":m .-2<CR>==",
    ["Y"] = "y$",
    ["<S-h>"] = "<Cmd>bp<Cr>",
    ["<S-l>"] = "<Cmd>bn<Cr>",
    ["n"] = "nzzzv",
    ["N"] = "Nzzzv",
    ["J"] = "mzJ`z",
    ["<expr> j"] = "(v:count > 1 ? \"m'\" . v:count : '') . 'j'",
    ["<expr> k"] = "(v:count > 1 ? \"m'\" . v:count : '') . 'k'",
    -- [";"] = ":"
  },
  visual_mode = {
    ["<"] = "<gv",
    [">"] = ">gv",
    ["J"] = ":m '>+1<CR>gv=gv",
    ["K"] = ":m '<-2<CR>gv=gv",
    -- [";"] = ":"
  },
  term_mode = {
    ["<C-w><C-o>"] = "<C-\\><C-n> :MaximizerToggle!<CR>",
    ["<C-h>"] = "<C-\\><C-n><C-w>h",
    ["<C-j>"] = "<C-\\><C-n><C-w>j",
    ["<C-k>"] = "<C-\\><C-n><C-w>k",
    ["<C-l>"] = "<C-\\><C-n><C-w>l",
    ["jk"] = "<C-\\><C-n>",
  },
  command_mode = {
    ["<C-j>"] = {
      'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
      { expr = true, noremap = true },
    },
    ["<C-k>"] = {
      'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
      { expr = true, noremap = true },
    },
    ["w!!"] = "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!",
    ["%%"] = { "getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'", { expr = true, noremap = true } },
    ["%H"] = { "<C-R>=expand('%:h:p') . std#path#separator()<CR>", { expr = false, noremap = true } },
    ["%T"] = { "<C-R>=expand('%:t')<CR>", { expr = false, noremap = true } },
    ["%P"] = { "<C-R>=expand('%:p')<CR>", { expr = false, noremap = true } },
  },
}

local lsp_keymappings = {

  normal_mode = {
    ["K"] = "<Cmd>lua vim.lsp.buf.hover()<CR>",
    ["gD"] = "<Cmd>lua vim.lsp.buf.declaration()<CR>",
    ["gd"] = "<Cmd>lua vim.lsp.buf.definition()<CR>",
    ["gi"] = "<Cmd>lua vim.lsp.buf.implementation()<CR>",
    ["<C-k>"] = "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
    ["[d"] = "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
    ["]d"] = "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
    ["[e"] = "<Cmd>Lspsaga diagnostic_jump_next<CR>",
    ["]e"] = "<Cmd>Lspsaga diagnostic_jump_prev<CR>",
  },
}

function M.set_keymaps(mode, key, val)
  local opt = generic_opts[mode] and generic_opts[mode] or opts
  if type(val) == "table" then
    opt = val[2]
    val = val[1]
  end
  vim.api.nvim_set_keymap(mode, key, val, opt)
end

function M.map(mode, keymaps)
  mode = mode_adapters[mode] and mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do
    M.set_keymaps(mode, k, v)
  end
end

function M.setup()
  for mode, mapping in pairs(keymappings) do
    M.map(mode, mapping)
  end
end

function M.setup_lsp_mappings()
  for mode, mapping in pairs(lsp_keymappings) do
    M.map(mode, mapping)
  end
end

return M
