---@diagnostic disable:undefined-global
--p
--p
-- local calltree = require("litee.calltree")
-- @TODO: add vim-repeat to all movement commands, plus remap , or ; everytime to opposite movement
Apply_keymaps = function(mode, keymaps, lhs)
  lhs = lhs or ""

  for k, v in ipairs(keymaps) do
    if not (type(v) == "table") and k > 2 then
      return
    elseif type(v) == "table" then
      if #keymaps > 2 and type(keymaps[1]) == "string" and type(keymaps[2]) == "table" and type(keymaps[3]) == "string" then
        vim.keymap.set(mode, lhs, "<Nop>", { silent = true, remap = true, noremap = false, desc = keymaps[3] })
      end
      Apply_keymaps(mode, v, lhs)
    elseif type(v) == "string" and k == 1 then
      lhs = lhs .. v
    elseif k == 2 and (type(v) == "string" or type(v) == "function") then
      my.io.map(mode, lhs, v, { desc = (#keymaps > 2) and keymaps[3] or lhs }, (#keymaps > 3) and keymaps[4] or nil)
    else
      vim.notify_once("Error in keymapping:" .. mode .. ":<" .. lhs .. ">, <= lhs is a function, should be a string!")
    end
  end
end

Apply_keymaps('n', {
  { "<C-h>", '<Cmd>call WinMove("h")<CR>', "left win", "<C-l>" },
  { "<C-l>", '<Cmd>call WinMove("l")<CR>', "right win", "<C-h>" },
  { "<C-k>", '<Cmd>call WinMove("k")<CR>', "up win", "<C-j>" },
  { "<C-j>", '<Cmd>call WinMove("j")<CR>', "down win", "<C-k>" },
  { "<Del>", '<cmd>lua require("notify").dismiss()<cr>', "dismiss notifications" },
  { "<CR><Esc>", "<cmd>nohl<CR>", "dismiss hl" },
  { "<CR><CR>", "<Cmd>BResizeZoom<CR>", "toggle max win" },
  -- { "<A-h>", [[<cmd>lua require("tmux").resize_left()<cr>]] },
  -- { "<A-l>", [[<cmd>lua require("tmux").resize_right()<cr>]] },
  -- { "<A-j>", [[<cmd>lua require("tmux").resize_down()<cr>]] },
  -- { "<A-k>", [[<cmd>lua require("tmux").resize_top()<cr>]] },
  { "<CR>p", '<cmd>normal! "0p<CR>', "last y-yanked" },
  { "<CR>P", '<cmd>normal! "0P<CR>', "last y-yanked" },
  {
    "[",
    {
      { "b", "<Cmd>BufferLineCyclePrev<CR>", "buf to left" },
      { "B", "<Cmd>bprevious<CR>", "prev buf" },
      { "d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "diag" },
      { "e", "<Plug>(ultest-prev-fail)", "failed test" },
      { "h", "<cmd>Gitsigns prev_hunk<CR>", "hunk" },
      {
        "l",
        {
          { "<CR>", "<cmd>QPrev!<CR>", "smart list => item" },
          { "*", "<cmd>QFPrev!<CR>", "qf list" },
          { ".", "<cmd>LLPrev!<CR>", "loc list" },
        },
        options = { desc = "list (qf|loc) => item" }
      },
      {
        "m",
        {
          { "$", "<Plug>(Marks-prev)", "mark" },
          { "0", "<Plug>(Marks-prev-bookmark0)", "bookmark group 0" },
          { "1", "<Plug>(Marks-prev-bookmark1)", "bookmark group 1" },
          { "2", "<Plug>(Marks-prev-bookmark2)", "bookmark group 2" },
          { "3", "<Plug>(Marks-prev-bookmark3)", "bookmark group 3" },
          { "4", "<Plug>(Marks-prev-bookmark4)", "bookmark group 4" },
          { "5", "<Plug>(Marks-prev-bookmark5)", "bookmark group 5" },
          { "6", "<Plug>(Marks-prev-bookmark6)", "bookmark group 6" },
          { "7", "<Plug>(Marks-prev-bookmark7)", "bookmark group 7" },
          { "8", "<Plug>(Marks-prev-bookmark8)", "bookmark group 8" },
          { "9", "<Plug>(Marks-prev-bookmark9)", "bookmark group 9" },
        },
        options = { desc = "marks|bookmarks" }
      },
      { "q", "<cmd>QPrev!<CR>", "smar list => item" },
      { "t", "<Cmd>FloatermPrev<CR>", "float-term" },
      { "w", "<Cmd>tabprevious<CR>", "tab/winLayout" },
    },
  },
  {
    "]",
    {
      { "b", "<Cmd>BufferLineCycleNext<CR>", "buf to right" },
      { "B", "<Cmd>bnext<CR>", "next buf" },
      { "d", "<cmd>lua vim.diagnostic.goto_next()<CR>", "diag" },
      { "e", "<Plug>(ultest-next-fail)", "failed test" },
      { "h", "<cmd>Gitsigns next_hunk<CR>", "hunk" },
      {
        "l",
        {
          { "<CR>", "<cmd>QNext!<CR>", "smart list => item" },
          { "*", "<cmd>QFNext!<CR>", "qf list" },
          { ".", "<cmd>LLNext!<CR>", "loc list" },
        },
      },
      {
        "m",
        {
          { "$", "<Plug>(Marks-next)", "mark" },
          { "0", "<Plug>(Marks-next-bookmark0)", "bookmark group 0" },
          { "1", "<Plug>(Marks-next-bookmark1)", "bookmark group 1" },
          { "2", "<Plug>(Marks-next-bookmark2)", "bookmark group 2" },
          { "3", "<Plug>(Marks-next-bookmark3)", "bookmark group 3" },
          { "4", "<Plug>(Marks-next-bookmark4)", "bookmark group 4" },
          { "5", "<Plug>(Marks-next-bookmark5)", "bookmark group 5" },
          { "6", "<Plug>(Marks-next-bookmark6)", "bookmark group 6" },
          { "7", "<Plug>(Marks-next-bookmark7)", "bookmark group 7" },
          { "8", "<Plug>(Marks-next-bookmark8)", "bookmark group 8" },
          { "9", "<Plug>(Marks-next-bookmark9)", "bookmark group 9" },
        },
        options = { desc = "marks|bookmarks" }
      },
      { "q", "<cmd>QNext!<CR>", "smart list => item" },
      { "t", "<Cmd>FloatermNext<CR>", "float-term" },
      { "w", "<Cmd>tabnext<CR>", "tab/winLayout" },
    },
  },
  { "*", "*<cmd>lua require('hlslens').start()<CR>zz", "next occurrence with hl" },
  { "#", "#<cmd>lua require('hlslens').start()<CR>zz", "prev occurrence with hl" },
  {
    "g",
    {
      { "*", "g*<cmd>lua require('hlslens').start()<CR>zz", "next occurrence with hl" },
      { "#", "g#<cmd>lua require('hlslens').start()<CR>zz", "prev occurrence with hl" },
      {
        "$",
        {
          { "$", "<Cmd>Telescope lsp_implementations<CR>", "symbol implementations" },
          { "*", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "symbol in workspace" },
          { ".", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", "symbol in buf" },
          { "f", "<cmd>TypescriptFixAll<CR>", "typescript fixall/refactoring" },
          { "i", "<cmd>TypescriptAddMissingImports<CR>", "typescript add imports" },
          { "I", "<cmd>TypescriptOrganizeImports<CR>", "typescript organize imports" },
          { "r", "<cmd>lua require('inc_rename').rename({ default = vim.fn.expand('<cword>') })<cr>",
            "symbol refactor/rename" },
          { "R", "<cmd>TypescriptRenameFile<CR>", "typescript file refactor/rename" },
        },
        options = { desc = "lsp [symbol] <task>" }
      },
      { "a", "<cmd>CodeActionMenu<CR>", "lsp code action menu" },
      { "d", "<cmd>split<CR><C-w>T<cmd>vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>",
        "definition in new tab(curFile & definitionFile)" },
      { "D", "<Cmd>lua vim.lsp.buf.definition()<CR>", "definition in place" },
      { "j", "<C-i>", "next cursor hold/pos/edit", "<C-o>" },
      { "k", "<C-o>", "prev cursor hold/pos/edit", "<C-i>" },
      { "n",
        function() require('neoscroll').scroll(vim.api.nvim_win_get_height(0) - 7, true, 250, 'sine') end,
        "scroll down: almost full page", "gN" },
      { "N",
        function() require('neoscroll').scroll(-vim.api.nvim_win_get_height(0) + 7, true, 250, 'sine') end,
        "scroll up: almost full page", "gn" },
      { "o", "<plug>(GrepperOperator)", "grep && pop qf" },
      { "r", "<cmd>split<CR><C-w>T<cmd>vsplit<CR><cmd>Telescope lsp_references<CR>",
        "reference in new tab(curFile & referenceFile)" },
      { "R", "<cmd>Telescope lsp_references<CR>", "reference in place" },
      { "s",
        function() require('neoscroll').scroll(vim.wo.scroll, true, 250, 'sine') end,
        "scroll down: regular", "gS" },
      { "S",
        function() require('neoscroll').scroll(-vim.wo.scroll, true, 250, 'sine') end,
        "scroll up: regular", "gs" },
    },
    options = { desc = "quickly move ..." }
  },
  { "K", function() vim.lsp.buf.hover() end, "lsp help/doc" },
  { "n", "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>",
    "continue prev word-search forwards" },
  { "N", "<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>",
    "continue prev word-search backwards" },
  -- { "T", calltree.hover_calltree },
  { "z", {
    { "0", "<cmd>set foldlevel=0<CR>", "level 0" },
    { "1", "<cmd>set foldlevel=1<CR>", "level 1" },
    { "2", "<cmd>set foldlevel=2<CR>", "level 2" },
    { "3", "<cmd>set foldlevel=3<CR>", "level 3" },
    { "4", "<cmd>set foldlevel=4<CR>", "level 4" },
    { "5", "<cmd>set foldlevel=5<CR>", "level 5" },
    { "l", "<cmd>loadview<CR>", "load prev saved folds" },
    { "M", "<cmd>lua require('ufo').closeAllFolds()<CR>", "close all" },
    { "p", "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>", "peek" },
    { "R", "<cmd>lua require('ufo').openAllFolds()<CR>", "open all" },
  }, options = { desc = "folds-ops" } },
  {
    "<leader>",
    {
      { "<esc>", "<Cmd>set relativenum(er!<CR>", "toggle rel linenrs" },
      { "<CR>", "<Cmd>ZenMode<CR>", "toggle zen-mode" },
      { "%", {
        { "l", ":luafile %<CR>" },
        { "i", ":luafile ~/.config/nvim/init.lua<CR>" },
      } },
      {
        "<",
        {
          {
            "s",
            {
              { "*", "<Cmd>RestoreSession<CR>" },
              {
                ".",
                '<Cmd>lua vim.api.nvim_command("RestoreSession " .. vim.fn.stdpath("data") .. "/sessions/" .. my.git.get_)ranch():gsub("/","__"))<CR>',
              },
            },
          },
        },
      },
      {
        ">",
        {
          {
            "s",
            {
              { "*", "<Cmd>SaveSession<CR>" },
              {
                ".",
                '<Cmd>lua vim.api.nvim_command("SaveSession " .. vim.fn.stdpath("data") .. "/sessions/" .. my.git.get_branch():gsub("/","__"))<CR>',
              },
            },
          },
        },
      },
      {
        "b",
        {
          { "q", ":bp|bd #<CR>" },
          { "p", "BufferLinePick" },
          {
            "d",
            {
              { "*", "lua require('close_buffers').delete({type = 'nameless'})<CR>" },
              { ".", "lua require('close_buffers').delete({type = 'this'})<CR>" },
            },
          },
          {
            "w",
            {
              { "*", ":wa!<CR>" },
              { ".", ":w!<CR>" },
            },
          },
        },
      },
      { "D", {
        { "c", "<Cmd>lua require('neogen').generate({ type = 'class' })<CR>" },
        { "$", "<Cmd>lua require('neogen').generate({ type = 'type' })<CR>" },
        { "f", "<Cmd>lua require('neogen').generate({ type = 'func' })<CR>" },
        { "*", "<Cmd>lua require('neogen').generate({ type = 'file' })<CR>" },
      } },
      {
        "e",
        {
          { "<C-c>", "<Plug>(ultest-stop-file)" },
          { "*", "<Plug>(ultest-run-file)" },
          { ".", "<Plug>(ultest-run-nearest)" },
          { "h", "<Plug>(ultest-run-last)" },
        },
      },
      {
        "f",
        {
          { "?", "<Cmd>Cheatsheet<CR>" },
          { ":", "<Cmd>Telescope commands<CR>" },
          { ";", "<Cmd>Telescope git_files<CR>" },
          { "/", "<Cmd>TodoTelescope<CR>" },
          { "$", "<Cmd>Telescope lsp_document_symbols<CR>" },
          { "'", "<Cmd>Telescope marks<CR>" },
          { "b", "<Cmd>Telescope buffers<CR>" },
          { "c", "<Cmd>Telescope colorscheme<CR>" },
          { "e", "<Cmd>Telescope file_browser<CR>" },
          { "f", "<Cmd>Telescope find_files<CR>" },
          { "g", "<Cmd>Telescope live_grep<CR>" },
          { "h", "<Cmd>Telescope frecency<CR>" },
          { "i", "<Cmd>Telescope media_files<CR>" },
          { "j", "<Cmd>Telescope jumplist<CR>" },
          { "k", "<Cmd>Telescope help_tags<CR>" },
          { "m*", "<Cmd>Telescope vim_bookmarks all<CR>" },
          { "m.", "<Cmd>Telescope vim_bookmarks current_file<CR>" },
          { "M", "<Cmd>Telescope marks<CR>" },
          { "n", "<Cmd>Telescope node_modules list<CR>" },
          { "p", ":lua require'telescope'.extensions.project.project{}<CR>" },
          { "r", "<Cmd>Telescope lsp_references<CR>" },
          {
            "R",
            {
              { "<", ":lua require'nvim-redux'.list_actions_in_switch_reducer()<CR>" },
              { ">", ":lua require'nvim-redux'.list_dispatch_calls()<CR>" },
            },
          },
          { "s", "<Cmd>SearchSession<CR>" },
          { "w", "<Cmd>Telescope grep_string<CR>" },
          { "y", "<Cmd>Telescope neoclip<CR>" },
          { "z", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
          {
            "<leader>",
            {
              {
                "l",
                {
                  { "$.", "<Cmd>Telescope lsp_document_symbols<CR>" },
                  { "$*", "<Cmd>Telescope lsp_workspace_symbols<CR>" },
                  { "a", "<Cmd>Telescope lsp_code_actions<CR>" },
                  { "d.", "<Cmd>Telescope lsp_document_diagnostics<CR>" },
                  { "d*", "<Cmd>Telescope lsp_workspace_diagnostics<CR>" },
                  { "D", "<Cmd>Telescope lsp_definitions<CR>" },
                  { "i", "<Cmd>Telescope lsp_implementations<CR>" },
                  { "r", "<Cmd>Telescope lsp_references<CR>" },
                },
              },
              {
                "g",
                {
                  { "c.", "<Cmd>Telescope git_bcommits<CR>" },
                  { "c*", "<Cmd>Telescope git_commits<CR>" },
                  { "b", "<Cmd>Telescope git_branches<CR>" },
                  { "?", "<Cmd>Telescope git_status<CR>" },
                  { "s", "<Cmd>Telescope git_stash<CR>" },
                  {
                    "@",
                    {
                      { "i", "<Cmd>Telescope gh issues<CR>" },
                      { "p", "<Cmd>Telescope gh pull_requests<CR>" },
                    },
                  },
                },
              },
            },
          },
        },
      },
      {
        "g",
        {
          { "@", "<Cmd>GBrowse<CR>" },
          { "<Del>", "<Cmd>Gitsigns toggle_deleted<CR>" },
          { "\"", "<Cmd>Telescope git_stash<CR>" },
          { "?", "<Cmd>Telescope git_status<CR>" },
          { "!", {
            { "a", "<Cmd>Gwrite<CR>" },
            { "c", "<Cmd>Git commit<CR>" },
            { "C", "<Cmd>Git commit --amend<CR>" },
            { "d!", "<Cmd>GDelete<CR>" },
            { "f", "<Cmd>Git fetch<CR>" },
            { "p", "<Cmd>Git pull<CR>" },
            { "P", "<Cmd>Git push<CR>" },
          } },
          { "b", "<Cmd>Telescope git_branches<CR>" },
          { "c", {
            { ".", "<Cmd>Telescope git_bcommits<CR>" },
            { "*", "<Cmd>Telescope git_commits<CR>" },
          } },
          { "d", {
            { "*", "<cmd>DiffviewOpen<CR>" },
            { ".", "<cmd>DiffviewFileHistory %<CR>" },
            { "R", "<cmd>DiffviewRefresh<CR>" },
            { "f", "<cmd>DiffviewFocusFiles<CR>" },
            { "t", "<cmd>DiffviewToggleFiles<CR>" },
          } },
          { "D", "<cmd>DiffviewClose<CR>" },
          { "g", "<Cmd>Neogit<CR>" },
          { "h", {
            { "s", "<cmd>Gitsigns stage_hunk<CR>" },
            { "S", "<cmd>Gitsigns undo_stage_hunk<CR>" },
            { "p", "<cmd>Gitsigns preview_hunk<CR>" },
          } },
          { "s", {
            { ".", "<cmd>Gitsigns stage_hunk<CR>" },
            { "*", "<cmd>Gitsigns stage_buffer<CR>" },
          } },
          { "S", {
            { ".", "<cmd>Gitsigns undo_stage_hunk<CR>" },
            { "*", "<cmd>Gitsigns reset_buffer_index 0<CR>" },
          } },
          {
            "y", {
              {
                ".",
                '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>'
              },
              {
                "*",
                '<cmd>lua require"gitlinker".get_repo_url()<cr>'
              }
            }
          },
        },
      },
      {
        "j",
        {
          { "/", "<Cmd>HopPattern<CR>" },
          { "1", "<Cmd>HopChar1<CR>" },
          { "2", "<Cmd>HopChar2<CR>" },
          { "j", "<Cmd>lua require('hop-extensions').hint_references()<CR>" },
          { "l", "<Cmd>HopLine<CR>" },
          { "t", "<Cmd>lua require('hop-extensions').hint_scopes()<CR>" },
          { "w", "<Cmd>HopWord<CR>" },
        },
      },
      {
        "k",
        {
          -- { "*", "<Cmd>call Dasht(dasht#cursor_search_terms(), '!')<CR>" },
          { "*", "<Cmd>Dash<CR>" },
          -- { ".", "<Cmd>call Dasht(dasht#cursor_search_terms())<CR>" },
          { ".", "<Cmd>DashWord<CR>" },
        },
      },
      { "l", {
        {
          ".", {
            { "<CR>", "<Cmd>LLOpen!<CR>" },
            { "d", "<Cmd>lua require('diaglist').populate_llist()<CR><cmd>LLOpen!<CR>" },
            { "g", {
              { ".",
                "<Cmd>lua require('gitsigns.actions').setqflist(0, { open = false, use_location_list = true })<CR><cmd>LLOpen!<CR>" },
              { "$",
                "<Cmd>lua require('gitsigns.actions').setqflist('attached', { open = false, use_location_list = true })<CR><cmd>LLOpen!<CR>" },
              { "*",
                "<Cmd>lua require('gitsigns.actions').setqflist('all', { open = false, use_location_list = true })<CR><cmd>LLOpen!<CR>" },
            } },
          }
        },
        {
          "*", {
            { "<CR>", "<Cmd>QFOpen!<CR>" },
            { "d", "<Cmd>lua require('diaglist').populate_qflist()<CR><cmd>QFOpen!<CR>" },
            { "g", {
              { ".",
                "<Cmd>lua require('gitsigns.actions').setqflist(0, { open = false, use_location_list = false })<CR><cmd>QFOpen!<CR>" },
              { "$",
                "<Cmd>lua require('gitsigns.actions').setqflist('attached', { open = false, use_location_list = false})<CR><cmd>QFOpen!<CR>" },
              { "*",
                "<Cmd>lua require('gitsigns.actions').setqflist('all', { open = false, use_location_list = false })<CR><cmd>QFOpen!<CR>" },
            } },
          }
        },
      } },
      {
        "m",
        {
          { "0", "<Plug>(Marks-set-bookmark0)" },
          { "1", "<Plug>(Marks-set-bookmark1)" },
          { "2", "<Plug>(Marks-set-bookmark2)" },
          { "3", "<Plug>(Marks-set-bookmark3)" },
          { "4", "<Plug>(Marks-set-bookmark4)" },
          { "5", "<Plug>(Marks-set-bookmark5)" },
          { "6", "<Plug>(Marks-set-bookmark6)" },
          { "7", "<Plug>(Marks-set-bookmark7)" },
          { "8", "<Plug>(Marks-set-bookmark8)" },
          { "9", "<Plug>(Marks-set-bookmark9)" },
        },
      },
      {
        "q",
        {
          { "q", "<cmd>FloatermKill<CR>:wqa!<CR>" },
        },
      },
      {
        "s",
        {
          { ".", "<cmd>ISwapWith<CR>" },
          { "*", "<cmd>ISwap<CR>" },
        },
      },
      {
        "t",
        {
          {
            "b",
            {
              { "m", "<Cmd>BResizeZoom<CR>" },
              -- { "o", "<Cmd>lua require('aerial').focus()<CR>" },
            },
          },
          { "c", "<Cmd>lua my.fn.toggle_bg_mode()<CR>" },
          { "C", "<Cmd>TSContextToggle<CR>" },
          -- { "D", ":lua require('dapui').toggle()" },
          { "e", "<Plug>(ultest-summary-toggle)" },
          {
            "f",
            {
              { ".", "<Cmd>RangerCurrentFile<CR>" },
              { "*", "<Cmd>Ranger<CR>" },
            },
          },
          { "F", "<Cmd>Twilight<CR>" },
          {
            "l",
            {
              { "*", "<Cmd>QFToggle!<CR>" },
              { ".", "<Cmd>LLToggle!<CR>" },
            },
          },
          { "m", "<Plug>(Marks-toggle)" },
          { "o", "<Cmd>SymbolsOutline<CR>" },
          { "t", "<Cmd>FloatermToggle<CR>" },
          { "u", "<cmd>lua require('undotree').open()<CR><cmd>normal  w=<CR>" },
          { "R", "<Cmd>ProjectRoot<CR>" },
          { "Z", "<Cmd>ZenMode<CR>" },
          {
            "<leader>",
            {
              { "t", {
                { "n", "<Cmd>FloatermNew<CR>" },
              } },
            },
          },
        },
      },
      {
        "x",
        {
          { ".", "<Cmd>SnipRun<CR>" },
          { ";", "<Cmd>SnipClose<CR>" },
        },
      },
      {
        "w",
        {
          { "*", "<cmd>wincmd =<cr><cmd>QfResizeWindows<CR>" },
          { "e", "<Plug>(ultest-summary-jump)" },
          { "n", "<Cmd>tabnew<CR>" },
          { "q", "<Cmd>tabclose<CR>" },
        },
      },
    },
  }
})

Apply_keymaps('i', {
  { "<f20>", "<C-o>" },
  { "<C-Del>", '<cmd>lua require("notify").dismiss()<cr>' },
  { "<C-l>", "<cmd>lua require('neogen').jump_next()<CR>" },
  { "<C-h>", "<cmd>lua require('neogen').jump_prev()<CR>" },
})

Apply_keymaps('t', {
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
          {
            "<leader>",
            {
              { "t", {
                { "n", "<C-\\><C-n>:FloatermNew<CR>" },
              } },
            },
          },
        },
      },
    },
  },
})

Apply_keymaps("v", {
  { "<lt>", "<gv" },
  { "<gt>", ">gv" },
  { "J", ":m '>+1<CR>gv=gv<CR>" },
  { "K", ":m '<-2<CR>gv=gv<CR>" },
  {
    "g",
    {
      { "l", {
        { "a", ":<C-U>Lspsaga range_code_action<CR>" },
      } },
      { "x", ":'<,'>SnipRun<CR>" },
    },
  },
  { "m", ":lua require('tsht').nodes()<CR>" },
})

Apply_keymaps("o", {
  { "is.", "<Plug>(textobj-sandwich-query-i)" },
  { "is*", "<Plug>(textobj-sandwich-auto-i)" },
  { "is$", "<Plug>(textobj-sandwich-literal-query-i)" },
  { "as.", "<Plug>(textobj-sandwich-query-a)" },
  { "as*", "<Plug>(textobj-sandwich-auto-a)" },
  { "as$", "<Plug>(textobj-sandwich-literal-query-a)" },
  { "m", ":<C-U>lua require('tsht').nodes()<CR>" },
})

Apply_keymaps("x", {
  { "is.", "<Plug>(textobj-sandwich-query-i)" },
  { "is*", "<Plug>(textobj-sandwich-auto-i)" },
  { "is$", "<Plug>(textobj-sandwich-literal-query-i)" },
  { "as.", "<Plug>(textobj-sandwich-query-a)" },
  { "as*", "<Plug>(textobj-sandwich-auto-a)" },
  { "as$", "<Plug>(textobj-sandwich-literal-query-a)" },
})
