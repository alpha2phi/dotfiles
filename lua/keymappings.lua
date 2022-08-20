---@diagnostic disable:undefined-global
local nest = require("nest")
-- local calltree = require("litee.calltree")
-- @TODO: add vim-repeat to all movement commands, plus remap , or ; everytime to opposite movement


nest.applyKeymaps({
  { "<Del>", '<cmd>lua require("notify").dismiss()<cr>' },
  { "<Esc><Esc>", "<cmd>nohl<CR>" },
  { "<CR><CR>", "<Cmd>BResizeZoom<CR>" },
  { "<A-h>", [[<cmd>lua require("tmux").resize_left()<cr>]] },
  { "<A-l>", [[<cmd>lua require("tmux").resize_right()<cr>]] },
  { "<A-j>", [[<cmd>lua require("tmux").resize_down()<cr>]] },
  { "<A-k>", [[<cmd>lua require("tmux").resize_top()<cr>]] },
  { "<C-p>", '<cmd>normal! "0p<CR>' },
  { "<C-P>", '<cmd>normal! "0P<CR>' },
  {
    "[",
    {
      { "b", "<Cmd>BufferLineCyclePrev<CR>" },
      { "B", "<Cmd>bprevious<CR>" },
      { "d", "<cmd>lua vim.diagnostic.goto_prev()<CR>" },
      { "e", "<Plug>(ultest-prev-fail)" },
      {
        "l",
        {
          { "*", "<cmd>lua require'qf'.above('c')<CR>" },
          { ".", "<cmd>lua require'qf'.above('l')<CR>" },
        },
      },
      {
        "m",
        {
          { "$", "<Plug>(Marks-prev)" },
          { "0", "<Plug>(Marks-prev-bookmark0)" },
          { "1", "<Plug>(Marks-prev-bookmark1)" },
          { "2", "<Plug>(Marks-prev-bookmark2)" },
          { "3", "<Plug>(Marks-prev-bookmark3)" },
          { "4", "<Plug>(Marks-prev-bookmark4)" },
          { "5", "<Plug>(Marks-prev-bookmark5)" },
          { "6", "<Plug>(Marks-prev-bookmark6)" },
          { "7", "<Plug>(Marks-prev-bookmark7)" },
          { "8", "<Plug>(Marks-prev-bookmark8)" },
          { "9", "<Plug>(Marks-prev-bookmark9)" },
        },
      },
      { "t", "<Cmd>FloatermPrev<CR>" },
      { "w", "<Cmd>tabprevious<CR>" },
    },
  },
  {
    "]",
    {
      { "b", "<Cmd>BufferLineCycleNext<CR>" },
      { "B", "<Cmd>bnext<CR>" },
      { "d", "<cmd>lua vim.diagnostic.goto_next()<CR>" },
      { "e", "<Plug>(ultest-next-fail)" },
      {
        "l",
        {
          { "*", "<cmd>lua require'qf'.below('c')<CR>" },
          { ".", "<cmd>lua require'qf'.below('l')<CR>" },
        },
      },
      {
        "m",
        {
          { "$", "<Plug>(Marks-next)" },
          { "0", "<Plug>(Marks-next-bookmark0)" },
          { "1", "<Plug>(Marks-next-bookmark1)" },
          { "2", "<Plug>(Marks-next-bookmark2)" },
          { "3", "<Plug>(Marks-next-bookmark3)" },
          { "4", "<Plug>(Marks-next-bookmark4)" },
          { "5", "<Plug>(Marks-next-bookmark5)" },
          { "6", "<Plug>(Marks-next-bookmark6)" },
          { "7", "<Plug>(Marks-next-bookmark7)" },
          { "8", "<Plug>(Marks-next-bookmark8)" },
          { "9", "<Plug>(Marks-next-bookmark9)" },
        },
      },
      { "t", "<Cmd>FloatermNext<CR>" },
      { "w", "<Cmd>tabnext<CR>" },
    },
  },
  { "*", "*<cmd>lua require('hlslens').start()<CR>zz" },
  { "#", "#<cmd>lua require('hlslens').start()<CR>zz" },
  {
    "g",
    {
      { "*", "g*<cmd>lua require('hlslens').start()<CR>zz" },
      { "#", "g#<cmd>lua require('hlslens').start()<CR>zz" },
      {
        "$",
        {
          { "$", "<Cmd>Telescope lsp_implementations<CR>" },
          { "*", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>" },
          { ".", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>" },
          { "f", "<cmd>TypescriptFixAll<CR>" },
          { "i", "<cmd>TypescriptAddMissingImports<CR>" },
          { "I", "<cmd>TypescriptOrganizeImports<CR>" },
          { "r", "<cmd>lua require('inc_rename').rename({ default = vim.fn.expand('<cword>') })<cr>" },
          { "R", "<cmd>TypescriptRenameFile<CR>" },
        },
      },
      { "a", "<cmd>CodeActionMenu<CR>" },
      { "d", "<cmd>split<CR><C-w>T<cmd>vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>" },
      { "D", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
      { "j", "<C-I>" },
      { "k", "<C-O>" },
      { "n",
        "<cmd>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0) - 7, true, 250, 'sine')<cr><cmd>silent! call repeat#set('gn', v:count)<cr><cmd>lua vim.api.nvim_buf_set_keymap(0, 'n', ',', 'gN', {})<cr>" },
      { "N",
        "<cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0) + 7, true, 250, 'sine')<cr><cmd>silent! call repeat#set('gN', v:count)<cr><cmd>lua vim.api.nvim_buf_set_keymap(0, 'n', ',', 'gn', {})<cr>" },
      { "o", "<plug>(GrepperOperator)" },
      { "r", "<cmd>split<CR><C-w>T<cmd>vsplit<CR><cmd>Telescope lsp_references<CR>" },
      { "R", "<cmd>Telescope lsp_references<CR>" },
      { "s",
        [[<cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 250, 'sine')<cr><cmd>silent! call repeat#set('gs', v:count)<cr><cmd>lua vim.api.nvim_buf_set_keymap(0, 'n', ',', "gS", {})<cr>]] },
      { "S",
        [[<cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 250, 'sine')<cr><cmd>silent! call repeat#set('gS', v:count)<cr><cmd>lua vim.api.nvim_buf_set_keymap(0, 'n', ',', 'gs', {})<cr>]] },
    },
  },
  { "K", "<Cmd>lua vim.lsp.buf.hover()<CR>" },
  { "n", "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>" },
  { "N", "<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>" },
  -- { "T", calltree.hover_calltree },
  { "z", {
    { "0", "<cmd>set foldlevel=0<CR>" },
    { "1", "<cmd>set foldlevel=1<CR>" },
    { "2", "<cmd>set foldlevel=2<CR>" },
    { "3", "<cmd>set foldlevel=3<CR>" },
    { "4", "<cmd>set foldlevel=4<CR>" },
    { "5", "<cmd>set foldlevel=5<CR>" },
    { "l", "<cmd>loadview<CR>" },
    { "M", "<cmd>lua require('ufo').closeAllFolds()<CR>" },
    { "p", "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>" },
    { "R", "<cmd>lua require('ufo').openAllFolds()<CR>" },
  } },
  {
    "<leader>",
    {
      { "<esc>", "<Cmd>set relativenumber!<CR>" },
      { "<CR>", "<Cmd>ZenMode<CR>" },
      { "H", '<Cmd>call WinMove("h")<CR>' },
      { "L", '<Cmd>call WinMove("l")<CR>' },
      { "K", '<Cmd>call WinMove("k")<CR>' },
      { "J", '<Cmd>call WinMove("j")<CR>' },
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
                ':lua vim.api.nvim_command("RestoreSession " .. vim.fn.stdpath("data") .. "/sessions/" .. require("utils").Git.get_branch():gsub("/","__"))<CR>',
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
                ':lua vim.api.nvim_command("SaveSession " .. vim.fn.stdpath("data") .. "/sessions/" .. require("utils").Git.get_branch():gsub("/","__"))<CR>',
              },
            },
          },
        },
      },
      {
        "b",
        {
          { "q", ":bp|bd #<CR>" },
          { "p", "<Cmd>BufferLinePick<CR>" },
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
            { "d", "<Cmd>GDelete<CR>" },
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
            "y",
            {
              ".",
              '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
            },
            {
              "*",
              '<cmd>lua require"gitlinker".get_repo_url()<cr>',
            },
          },
        },
      },
      { "G", "<Cmd>Neogit<CR>" },
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
          { "c", "<Cmd>lua toggle_bg_mode()<CR>" },
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
              { "*", ":call ToggleDiagFix()<CR>" },
              { ".", ":call ToggleDiagLoc()<CR>" },
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
  },
})

nest.applyKeymaps({
  {
    mode = "i",
    {
      { "<f20>", "<C-o>" },
      { "<C-Del>", '<cmd>lua require("notify").dismiss()<cr>' },
      { "<C-l>", "<cmd>lua require('neogen').jump_next()<CR>" },
      { "<C-h>", "<cmd>lua require('neogen').jump_prev()<CR>" },
    },
  },
})

nest.applyKeymaps({
  {
    mode = "t",
    {
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
    },
  },
})

nest.applyKeymaps({
  {
    mode = "v",
    {
      { "<lt>", "<gv" },
      { "<gt>", ">gv" },
      { "J", ":m '>+1<CR>gv=gv" },
      { "K", ":m '<-2<CR>gv=gv" },
      {
        "g",
        {
          { "l", {
            { "a", ":<C-U>Lspsaga range_code_action<CR>" },
          } },
          { "x", ":'<,'>SnipRun" },
        },
      },
      { "m", ":lua require('tsht').nodes()<CR>" },
    },
  },
})

nest.applyKeymaps({
  {
    mode = "o",
    {
      { "is.", "<Plug>(textobj-sandwich-query-i)" },
      { "is*", "<Plug>(textobj-sandwich-auto-i)" },
      { "is$", "<Plug>(textobj-sandwich-literal-query-i)" },
      { "as.", "<Plug>(textobj-sandwich-query-a)" },
      { "as*", "<Plug>(textobj-sandwich-auto-a)" },
      { "as$", "<Plug>(textobj-sandwich-literal-query-a)" },
      { "m", ":<C-U>lua require('tsht').nodes()<CR>" },
    },
  },
})

nest.applyKeymaps({
  {
    mode = "x",
    {
      { "is.", "<Plug>(textobj-sandwich-query-i)" },
      { "is*", "<Plug>(textobj-sandwich-auto-i)" },
      { "is$", "<Plug>(textobj-sandwich-literal-query-i)" },
      { "as.", "<Plug>(textobj-sandwich-query-a)" },
      { "as*", "<Plug>(textobj-sandwich-auto-a)" },
      { "as$", "<Plug>(textobj-sandwich-literal-query-a)" },
    },
  },
})
