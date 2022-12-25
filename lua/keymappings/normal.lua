--diagnostic disable: undefined-global
local M = {
  { ">>", ">>", "shift-indent right", "<cmd>normal! <lt><lt><CR>" },
  { "<<", "<<", "shift-indent left", "<cmd>normal! >><CR>" },
  { "<C-h>", '<Cmd>call WinMove("h")<CR>', "left win", '<Cmd>call WinMove("l")<CR>' },
  { "<C-l>", '<Cmd>call WinMove("l")<CR>', "right win", '<Cmd>call WinMove("h")<CR>' },
  { "<C-k>", '<Cmd>call WinMove("k")<CR>', "up win", '<Cmd>call WinMove("j")<CR>' },
  { "<C-j>", '<Cmd>call WinMove("j")<CR>', "down win", '<Cmd>call WinMove("k")<CR>' },
  { "<Esc><Esc>", "<Cmd>nohl<CR>", "remove highlights" },
  { "<De>", {
    { "<Del>", '<Cmd>lua require("notify").dismiss()<cr>', "notifications" },
  }, "+dismiss" },
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
          { "*", "<cmd>silent cprevious<CR>", "qf list prev", "<Cmd>silent cnext<CR>" },
          { ".", "<cmd>silent lprevious<CR>", "loc list prev", "<Cmd>silent lnext<CR>" },
        },
        "list (qf|loc) => prev item",
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
        "+marks|bookmarks",
      },
      { "q", "<cmd>silent cprevious<CR>", "quickfix => prev next", "<Cmd>silent cnext<CR>" },
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
          { "*", "<cmd>silent cnext<CR>", "qf list next", "<cmd>silent cprevious<CR>" },
          { ".", "<cmd>silent lnext<CR>", "loc list next", "<Cmd>silent lprevious<CR>" },
        },
        "list (qf|loc) => next item",
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
        "+marks|bookmarks",
      },
      { "q", "<cmd>silent cnext<CR>", "quickfix => next item", "<cmd>silent cprevious<CR>" },
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
          { "r", ":IncRename", "symbol refactor/rename" },
          { "R", "<cmd>TypescriptRenameFile<CR>", "typescript file refactor/rename" },
        },
        "+lsp [symbol] <task>",
      },
      { "a", "<cmd>CodeActionMenu<CR>", "lsp code action menu" },
      { "d", "<cmd>split<CR><C-w>T<cmd>vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>",
        "definition in new tab(curFile & definitionFile)" },
      { "D", "<Cmd>lua vim.lsp.buf.definition()<CR>", "definition in place" },
      { "j", "<cmd>lua require'portal'.jump_forward()<CR>", "next cursor hold/pos/edit",
        "<cmd>lua require'portal'.jump_backward()<CR>" },
      { "k", "<CMD>lua require('portal').jump_backward()<CR>", "prev cursor hold/pos/edit",
        "<CMD>lua require('portal').jump_forward()<CR>" },
      { "n",
        "<CMD>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0) - 7, true, 250, 'sine')<CR>",
        "scroll down: almost full page", "gN" },
      { "N",
        "<CMD>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0) + 7, true, 250, 'sine')<CR>",
        "scroll up: almost full page", "gn" },
      { "o", "<plug>(GrepperOperator)", "grep && pop qf" },
      { "r", "<cmd>split<CR><C-w>T<cmd>vsplit<CR><cmd>Telescope lsp_references<CR>",
        "reference in new tab(curFile & referenceFile)" },
      { "R", "<cmd>Telescope lsp_references<CR>", "reference in place" },
      { "s",
        "<cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 250, 'sine')<CR>",
        "scroll down: regular", "<cmd>normal! gS<CR>" },
      { "S",
        "<cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 250, 'sine')<CR>",
        "scroll up: regular", "<cmd>normal! gs<CR>" },
    },
    options = { desc = "quickly move ..." }
  },
  { "K", vim.lsp.buf.hover, "lsp help/doc" },
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
    { "6", "<cmd>set foldlevel=6<CR>", "level 6" },
    { "7", "<cmd>set foldlevel=7<CR>", "level 7" },
    { "8", "<cmd>set foldlevel=8<CR>", "level 8" },
    { "9", "<cmd>set foldlevel=9<CR>", "level 9" },
    { "l", "<cmd>loadview<CR>", "load prev saved folds" },
    -- { "M", "<cmd>lua require('ufo').closeAllFolds()<CR>", "close all" },
    -- { "p", "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>", "peek" },
    -- { "R", "<cmd>lua require('ufo').openAllFolds()<CR>", "open all" },
  }, "+folds-ops" },
  {
    "<leader>",
    {
      { "<esc>", "<Cmd>set relativenumber!<CR>", "toggle rel linenrs" },
      { "<CR>", "<Cmd>ZenMode<CR>", "toggle zen-mode" },
      { "%", {
        { "l", ":luafile %<CR>", "source current lua-file" },
        { "i", ":luafile ~/.config/nvim/init.lua<CR>", "source initial lua-file" },
      } },
      {
        "<",
        {
          {
            "s",
            {
              { "*", "<Cmd>RestoreSession<CR>", "restore session" },
              {
                ".",
                '<Cmd>lua vim.api.nvim_command("RestoreSession " .. vim.fn.stdpath("data") .. "/sessions/" .. my.git.get_branch():gsub("/","__"))<CR>',
                "restore git-branch session"
              },
            },
            "+session related"
          },
        },
        "+read stuff in"
      },
      {
        ">",
        {
          {
            "s",
            {
              { "*", "<Cmd>SaveSession<CR>", "save session" },
              {
                ".",
                '<Cmd>lua vim.api.nvim_command("SaveSession " .. vim.fn.stdpath("data") .. "/sessions/" .. my.git.get_branch():gsub("/","__"))<CR>',
                "save git-branch session"
              },
            },
            "+session related",
          },
        },
        "+write stuff out",
      },
      {
        "b",
        {
          { "q", ":bp|bd #<CR>", "quit current buffer" },
          { "p", "<cmd>BufferLinePick<CR>", "pick buffer in tabline" },
          {
            "d",
            {
              { "*", "<cmd>lua require('close_buffers').delete({type = 'nameless'})<CR>", "delete nameless buffers" },
              { ".", "<cmd>lua require('close_buffers').delete({type = 'this'})<CR>", "delete current buffer" },
            },
            "+delete buffers"
          },
          {
            "w",
            {
              { "*", ":wa!<CR>", "force-write all buffers" },
              { ".", ":w!<CR>", "force-write current buffer" },
            },
            "+write buffers"
          },
        },
        "+buffer related",
      },
      { "D", {
        { "c", "<Cmd>lua require('neogen').generate({ type = 'class' })<CR>", "generate class doc" },
        { "$", "<Cmd>lua require('neogen').generate({ type = 'type' })<CR>", "generate type doc" },
        { "f", "<Cmd>lua require('neogen').generate({ type = 'func' })<CR>", "generate func doc" },
        { "*", "<Cmd>lua require('neogen').generate({ type = 'file' })<CR>", "generate file doc" },
      }, "+generate doc" },
      {
        "e",
        {
          { "<C-c>", "<Plug>(ultest-stop-file)" },
          { "*", "<Plug>(ultest-run-file)" },
          { ".", "<Plug>(ultest-run-nearest)" },
          { "h", "<Plug>(ultest-run-last)" },
        },
        "+testing related"
      },
      {
        "f",
        {
          { "?", "<Cmd>Cheatsheet<CR>", "nvim cheatsheet" },
          { ":", "<Cmd>Telescope commands<CR>", "nvim commands" },
          { ";", "<Cmd>Telescope git_files<CR>", "open git files" },
          { "/", "<Cmd>TodoTelescope<CR>", "todos" },
          {
            "$",
            {
              { ".",
                {
                  { "$", "<Cmd>Telescope lsp_document_symbols<CR>", "document symbols" },
                  { "d", "<Cmd>Telescope lsp_document_diagnostics<CR>", "document diagnostics" },
                }
              },
              { "*",
                {
                  { "*", "<Cmd>Telescope lsp_workspace_symbols<CR>", "workspace symbols" },
                  { "d", "<Cmd>Telescope lsp_workspace_diagnostics<CR>", "workspace diagnostics" },
                }
              },
              { "a", "<Cmd>Telescope lsp_code_actions<CR>", "code actions" },
              { "d", "<Cmd>Telescope lsp_definitions<CR>", "definitions" },
              { "i", "<Cmd>Telescope lsp_implementations<CR>", "implementations" },
              { "r", "<Cmd>Telescope lsp_references<CR>", "references" },
            },
          },
          { "'", "<Cmd>Telescope marks<CR>", "marks" },
          { "b", "<Cmd>Telescope buffers<CR>", "buffer files" },
          { "c", "<Cmd>Telescope colorscheme<CR>", "colorschemes" },
          { "f", "<Cmd>Telescope find_files<CR>", "open files" },
          {
            "g",
            {
              { ".c", "<Cmd>Telescope git_bcommits<CR>", "buffer commits" },
              { "*c", "<Cmd>Telescope git_commits<CR>", "commits" },
              { "b", "<Cmd>Telescope git_branches<CR>", "branches" },
              { "?", "<Cmd>Telescope git_status<CR>", "status" },
              { "s", "<Cmd>Telescope git_stash<CR>", "stash" },
              {
                "@",
                {
                  { "i", "<Cmd>Telescope gh issues<CR>", "issues" },
                  { "p", "<Cmd>Telescope gh pull_requests<CR>", "PRs" },
                },
                "+github"
              },
            },
            "+git"
          },
          { "G", "<Cmd>Telescope live_grep<CR>", "grep" },
          { "h", "<Cmd>Telescope frecency<CR>", "frecency" },
          { "i", "<Cmd>Telescope media_files<CR>", "media files" },
          { "j", "<Cmd>Telescope jumplist<CR>", "jumplist" },
          { "k", "<Cmd>Telescope help_tags<CR>", "help tags" },
          { "n", "<Cmd>Telescope node_modules list<CR>", "node modules" },
          { "p", ":lua require'telescope'.extensions.project.project{}<CR>", "switch project" },
          { "r", "<Cmd>Telescope lsp_references<CR>", "lsp references" },
          {
            "R",
            {
              { "<", ":lua require'nvim-redux'.list_actions_in_switch_reducer()<CR>", "redux reducer actions" },
              { ">", ":lua require'nvim-redux'.list_dispatch_calls()<CR>", "redux dispatches" },
            },
          },
          { "s", "<Cmd>SearchSession<CR>", "sessions" },
          { "w", "<Cmd>Telescope grep_string<CR>", "grep string" },
          { "y", "<Cmd>Telescope neoclip<CR>", "clipboard" },
          { "z", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "buffer fuzzyfinder" },
        },
      },
      {
        "g",
        {
          { "@", "<Cmd>GBrowse<CR>", "GBrowse" },
          { "<Del>", "<Cmd>Gitsigns toggle_deleted<CR>", "toggle deleted" },
          { "\"", "<Cmd>Telescope git_stash<CR>", "stash" },
          { "?", "<Cmd>Telescope git_status<CR>", "status" },
          { "!", {
            { "a", "<Cmd>Gwrite<CR>", "Gwrite" },
            { "c", "<Cmd>Git commit<CR>", "commit" },
            { "C", "<Cmd>Git commit --amend<CR>", "amend commit" },
            { "d!", "<Cmd>GDelete<CR>", "delete" },
            { "f", "<Cmd>Git fetch<CR>", "fetch" },
            { "p", "<Cmd>Git pull<CR>", "pull" },
            { "P", "<Cmd>Git push<CR>", "push" },
          }, "+native commands" },
          { "b", "<Cmd>Telescope git_branches<CR>", "branches" },
          { "c", {
            { ".", "<Cmd>Telescope git_bcommits<CR>", "branch commits" },
            { "*", "<Cmd>Telescope git_commits<CR>", "commits" },
          }, "+commits" },
          { "d", {
            { "*", "<cmd>DiffviewOpen<CR>", "DiffView" },
            { ".", "<cmd>DiffviewFileHistory %<CR>", "buffer DiffView" },
            { "R", "<cmd>DiffviewRefresh<CR>", "refresh DiffView" },
            { "f", "<cmd>DiffviewFocusFiles<CR>", "focus files in DiffView" },
            { "t", "<cmd>DiffviewToggleFiles<CR>", "toggle files in DiffView" },
          }, "+DiffView" },
          { "D", "<cmd>DiffviewClose<CR>", "close DiffView" },
          { "g", "<Cmd>Neogit<CR>", "Neogit" },
          { "h", {
            { "s", "<cmd>Gitsigns stage_hunk<CR>", "stage" },
            { "S", "<cmd>Gitsigns undo_stage_hunk<CR>", "undo stage hunk" },
            { "p", "<cmd>Gitsigns preview_hunk<CR>", "preview" },
          }, "+hunks" },
          { "s", {
            { ".", "<cmd>Gitsigns stage_hunk<CR>", "hunk" },
            { "*", "<cmd>Gitsigns stage_buffer<CR>", "buffer" },
          }, "+stage" },
          { "S", {
            { ".", "<cmd>Gitsigns undo_stage_hunk<CR>", "undo stage hunk" },
            { "*", "<cmd>Gitsigns reset_buffer_index 0<CR>", "reset buffer index" },
          }, "+unstage" },
          {
            "y", {
              {
                ".",
                '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
                "range url"
              },
              {
                "*",
                '<cmd>lua require"gitlinker".get_repo_url()<cr>',
                "repo url"
              }
            },
            "+url"
          },
        },
      },
      {
        "j",
        {
          { "/", "<Cmd>HopPattern<CR>", "pattern" },
          { "1", "<Cmd>HopChar1<CR>", "1 char" },
          { "2", "<Cmd>HopChar2<CR>", "2 chars" },
          { "j", "<Cmd>lua require('hop-extensions').hint_references()<CR>", "references" },
          { "l", "<Cmd>HopLine<CR>", "line" },
          { "t", "<Cmd>lua require('hop-extensions').hint_scopes()<CR>", "scopes" },
          { "w", "<Cmd>HopWord<CR>", "word" },
        },
        "+jump"
      },
      {
        "k",
        {
          -- { "*", "<Cmd>call Dasht(dasht#cursor_search_terms(), '!')<CR>" },
          { "*", "<Cmd>Dash<CR>", "dash" },
          -- { ".", "<Cmd>call Dasht(dasht#cursor_search_terms())<CR>" },
          { ".", "<Cmd>DashWord<CR>", "<cword> dash" },
        },
        "+dash docs"
      },
      { "l", {
        { ">", "<Cmd>lua require'trouble'.next({skip_groups = true, jump = true})<CR>", "trouble next item" },
        { "<", "<Cmd>lua require'trouble'.previous({skip_groups = true, jump = true})<CR>", "trouble prev item" },
        { "<CR>", "<Cmd>Trouble<CR>", "trouble open" },
        { "$", {
          { "$", "<Cmd>Trouble telescope<CR>", "trouble telescope" },
          { "d", "<Cmd>Trouble lsp_definitions<CR>", "trouble defs" },
          { "r", "<Cmd>Trouble lsp_references<CR>", "trouble refs" },
        } },
        {
          ".", {
            { "<CR>", "<Cmd>Trouble loclist<CR>", "loclist open" },
            { "a", {
              { ".",
                "<Cmd>lua require('gitsigns.actions').setqflist(0, { open = false, use_location_list = true })<CR><Cmd>Trouble loclist<CR>",
                "trouble actions local" },
              { "$",
                "<Cmd>lua require('gitsigns.actions').setqflist('attached', { open = false, use_location_list = true })<CR><cmd>Trouble loclist<CR>",
                "trouble actions attached" },
              { "*",
                "<Cmd>lua require('gitsigns.actions').setqflist('all', { open = false, use_location_list = true })<CR><cmd>Trouble loclist<CR>",
                "trouble actions workspace" },
            }, "+git alterations" },
            { "d", "<Cmd>Trouble document_diagnostics<CR>", "trouble doc diag" },
          }, "+LocList"
        },
        {
          "*", {
            { "<CR>", "<Cmd>Trouble quickfix<CR>", "trouble quickfix" },
            { "a", {
              { ".",
                "<Cmd>lua require('gitsigns.actions').setqflist(0, { open = false, use_location_list = false })<CR><Cmd>Trouble quickfix<CR>",
                "trouble actions local" },
              { "$",
                "<Cmd>lua require('gitsigns.actions').setqflist('attached', { open = false, use_location_list = false })<CR><cmd>Trouble quickfix<CR>",
                "trouble actions attached" },
              { "*",
                "<Cmd>lua require('gitsigns.actions').setqflist('all', { open = false, use_location_list = false })<CR><cmd>Trouble quickfix<CR>",
                "trouble actions workspace" },
            }, "+git alterations" },
            { "d", "<Cmd>Trouble workspace_diagnostics<CR>", "trouble proj diag" },
          }, "+QuickFix"
        },
        { "q", "<Cmd>TroubleClose<CR>", "trouble close" },
      }, "+Trouble" },
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
        "+bookmarks 0-9"
      },
      {
        "q",
        {
          { "q", "<cmd>FloatermKill<CR>:wqa!<CR>", "killTerm & saveAll! & quit!" },
        }, "+quit"
      },
      {
        "s",
        {
          { ".", "<cmd>ISwapWith<CR>", "swap this with" },
          { "*", "<cmd>ISwap<CR>", "swap" },
        }, "+iSwap"
      },
      {
        "t",
        {
          {
            "b",
            {
              { "m", "<Cmd>BResizeZoom<CR>", "maximize" },
              -- { "o", "<Cmd>lua require('aerial').focus()<CR>" },
            },
            "+buffer"
          },
          { "c", "<Cmd>lua my.fn.toggle_bg_mode()<CR>", "bg lightness" },
          { "C", "<Cmd>TSContextToggle<CR>", "virtual context" },
          -- { "D", ":lua require('dapui').toggle()" },
          { "e", "<Plug>(ultest-summary-toggle)", "ultest summary" },
          {
            "f",
            {
              { ".", "<Cmd>RangerCurrentFile<CR>", "cwd as buffer" },
              { "*", "<Cmd>Ranger<CR>", "cwd as project" },
            },
            "+file browser"
          },
          { "F", "<Cmd>Twilight<CR>", "focus scope" },
          {
            "l",
            {
              { "*", "<Cmd>QFToggle!<CR>", "quickfix" },
              { ".", "<Cmd>LLToggle!<CR>", "loclist" },
            },
            "+list"
          },
          { "m", "<Plug>(Marks-toggle)", "mark" },
          { "o", "<Cmd>SymbolsOutline<CR>", "outline" },
          { "t", "<Cmd>FloatermToggle<CR>", "terminal" },
          { "T", "<Cmd>FloatermNew<CR>", "add new terminal" },
          { "u", "<cmd>lua require('undotree').open()<CR><cmd>normal  w=<CR>", "undo tree" },
          { "R", "<Cmd>ProjectRoot<CR>", "CWD" },
          { "Z", "<Cmd>ZenMode<CR>", "zen mode" },
        },
        "+toggle"
      },
      {
        "w",
        {
          { "*", "<cmd>wincmd =<cr><cmd>QfResizeWindows<CR>", "fit layout" },
          { "e", "<Plug>(ultest-summary-jump)", "ultest summary window" },
          { "n", "<Cmd>tabnew<CR>", "new tab" },
          { "q", "<Cmd>tabclose<CR>", "close tab" },
        },
        "+window/layout"
      },
      {
        "x",
        {
          { "<CR>", {
            { "?", ":AsyncTaskProfile ", "toggle npm/yarn" },
            { "<CR>", "<Cmd>AsyncTask node -task=start<CR>", "npmR start" },
            { ";", "<Cmd>AsyncTask node -task=dev<CR>", "npmR dev" },
            { "%", "<Cmd>AsyncTask node -task=test<CR>", "npmR test" },
            { "$", ":AsyncTask node -task=", "npmR ?" },
            { "s", ":AsyncTask npmS -package=", "npmS ?" },
            { "d", ":AsyncTask npmD -package=", "npmD ?" },
          }, "+npm/yarn run" },
          { ".", "<Cmd>SnipRun<CR>", "run snippet" },
          { "d", "<Cmd>SnipClose<CR>", "close snippet" },
        },
        "+REPL"
      },
    },
  }
}

return M
