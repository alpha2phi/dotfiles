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

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  cmp.setup {
    formatting = {
      format = require("lspkind").cmp_format {
        with_text = true,
        menu = {
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
        },
      },
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      -- ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-k>"] = cmp.mapping {
        c = function()
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
          else
            vim.api.nvim_feedkeys(t "<Up>", "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
          else
            fallback()
          end
        end,
      },
      ["<C-n>"] = cmp.mapping.select_next_item(),
      -- ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-j>"] = cmp.mapping {
        c = function()
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
          else
            vim.api.nvim_feedkeys(t "<Down>", "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
          else
            fallback()
          end
        end,
      },
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-e>"] = cmp.mapping { i = cmp.mapping.close(), c = cmp.mapping.close() },
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }, { "i" }),
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }, { "i" }),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      -- ["<CR>"] = cmp.mapping {
      --   i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
      --   c = function(fallback)
      --     if cmp.visible() then
      --       cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
      --     else
      --       fallback()
      --     end
      --   end,
      -- },
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
        "c",
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
        "c",
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
        "c",
      }),
    },
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    sources = {
      { name = "buffer", keyword_length = 3 },
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
      { name = "cmp_tabnine" },
    },
    completion = { completeopt = "menu,menuone,noinsert" },
    experimental = { native_menu = false, ghost_text = false },
  }

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp = require "cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  -- TabNine
  local tabnine = require "cmp_tabnine.config"
  tabnine:setup { max_lines = 1000, max_num_results = 20, sort = true }

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  -- lsp_document_symbols
  cmp.setup.cmdline("/", {
    sources = cmp.config.sources({
      { name = "nvim_lsp_document_symbol" },
    }, {
      { name = "buffer" },
    }),
  })

  -- Database completion
  vim.api.nvim_exec(
    [[
        autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
    ]],
    false
  )
end

return M
