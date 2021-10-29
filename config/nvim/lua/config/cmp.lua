local M = {}

function M.setup()
  local cmp = require "cmp"

  local has_any_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
      return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

  local press = function(key)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
  end

  cmp.setup {
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
        -- set a name for each source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          ultisnips = "[UltiSnips]",
          nvim_lua = "[Lua]",
          cmp_tabnine = "[TabNine]",
          look = "[Look]",
          path = "[Path]",
          spell = "[Spell]",
          calc = "[Calc]",
          emoji = "[Emoji]",
          treesitter = "[treesitter]",
          neorg = "[Neorg]",
        })[entry.source.name]
        return vim_item
      end,
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<C-Space>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            return press "<C-R>=UltiSnips#ExpandSnippet()<CR>"
          end

          cmp.select_next_item()
        elseif has_any_words_before() then
          press "<Space>"
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
          press "<C-R>=UltiSnips#ExpandSnippet()<CR>"
        elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          press "<ESC>:call UltiSnips#JumpForwards()<CR>"
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif has_any_words_before() then
          press "<Tab>"
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          press "<ESC>:call UltiSnips#JumpBackwards()<CR>"
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    sources = {
      { name = "buffer" },
      { name = "nvim_lsp" },
      { name = "ultisnips" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "emoji" },
      { name = "treesitter" },
      { name = "neorg" },
      { name = "crates" },
      -- { name = "look" },
      -- { name = "calc" },
      -- { name = "spell" },
      -- {name = 'cmp_tabnine'}
    },
    completion = { completeopt = "menu,menuone,noinsert" },
  }

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp = require "cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  -- TabNine
  -- local tabnine = require "cmp_tabnine.config"
  -- tabnine:setup { max_lines = 1000, max_num_results = 20, sort = true }

  -- Database completion
  vim.api.nvim_exec(
    [[
        autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
    ]],
    false
  )
end

return M
