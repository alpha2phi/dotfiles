---@diagnostic disable: undefined-global
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local config = {}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

function config.setup()
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
  }

  cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        -- if you have lspkind installed, you can use it like
        -- in the following line:
        vim_item.kind = require "lspkind".symbolic(vim_item.kind, { mode = "symbol" })
        vim_item.menu = source_mapping[entry.source.name]
        if entry.source.name == "cmp_tabnine" then
          local detail = (entry.completion_item.data or {}).detail
          vim_item.kind = ""
          if detail and detail:find('.*%%.*') then
            vim_item.kind = vim_item.kind .. ' ' .. detail
          end

          if (entry.completion_item.data or {}).multiline then
            vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
          end
        end
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        return vim_item
      end,
      -- format = require "lspkind".cmp_format({
      --   mode = "symbol_text",
      --   maxwidth = 50,
      -- }),
      -- function(entry, vim_item)
      --   -- fancy icons and a name of kind
      --   vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
      --   -- set a name for each source
      --   vim_item.menu = ({
      --     copilot = "[AI]",
      --     nvim_lsp = "[LSP]",
      --     treesitter = "[TS]",
      --     vsnip = "[VSnip]",
      --     buffer = "[Buffer]",
      --     look = "[Look]",
      --     path = "[Path]",
      --     spell = "[Spell]",
      --     calc = "[Calc]",
      --     emoji = "[Emoji]",
      --     nvim_lua = "[Lua]",
      --   })[entry.source.name]
      --   return vim_item
      -- end,
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
      ["<C-n>"] = cmp.mapping({
        c = function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            vim.api.nvim_feedkeys(t("<Down>"), "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end,
      }),
      ["<C-p>"] = cmp.mapping({
        c = function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            vim.api.nvim_feedkeys(t("<Up>"), "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end,
      }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-3), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(3), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-Esc>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
      ["<CR>"] = cmp.mapping({
        i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
        c = function(fallback)
          if cmp.visible() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
      }),
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = {
      { name = "cmp_tabnine" },
      -- { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "treesitter" },
      { name = "vsnip" },
      { name = "path" },
      { name = "npm", keyworld_length = 3 },
      { name = "nvim_lua" },
      { name = "nvim_lsp_signature_help" },
      -- { name = "buffer" },
      -- { name = "look" },
      { name = "calc" },
      { name = "spell" },
      { name = "emoji" },
    },
    -- preselect = cmp.PreselectMode.None,
    completion = {
      completeopt = "menu,menuone,noselect",
    },
    experimental = {
      ghost_text = true,
    },
    view = {
      entries = { name = "custom", selection_order = "near_cursor" },
    },
    -- sorting = {
    --   priiority_weight = 2,
    --   comparators = {
    --     -- require("copilot_cmp.comparators").prioritize,
    --     -- require("copilot_cmp.comparators").score,
    --     -- Below is the default comparitor list and order for nvim-cmp
    --     cmp.config.compare.offset,
    --     -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
    --     cmp.config.compare.exact,
    --     cmp.config.compare.score,
    --     cmp.config.compare.recently_used,
    --     cmp.config.compare.locality,
    --     cmp.config.compare.kind,
    --     cmp.config.compare.sort_text,
    --     cmp.config.compare.length,
    --     cmp.config.compare.order,
    --   }
    -- }
  })

  -- cmdline
  cmp.setup.cmdline(":", {
    completion = { autocomplete = {} },
    sources = cmp.config.sources({
      { name = "path" },
      { name = "cmdline" },
    }),
  })
  -- lsp_document_symbols
  cmp.setup.cmdline("/", {
    completion = { autocomplete = {} },
    sources = cmp.config.sources({
      { name = "nvim_lsp_document_symbol" },
    }, {
      { name = "buffer", opts = { keyword_pattern = [=[[^[:blank:]].*]=] } },
    }),
  })
end

return config
