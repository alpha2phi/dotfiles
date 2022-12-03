---@diagnostic disable: undefined-global
local config = {}

function config.setup()
  local trouble = require("trouble.providers.telescope")
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    -- find_command = {
    -- 	"rg",
    -- 	"--no-heading",
    -- 	"--with-filename",
    -- 	"--line-number",
    -- 	"--column",
    -- 	"--smart-case",
    -- },
    -- use_less = true,
    -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    pickers = {
      spell_suggest = {
        theme = "cursor",
      },
      lsp_code_actions = {
        theme = "cursor",
      },
      lsp_range_code_actions = {
        theme = "cursor",
      },
      buffers = {
        theme = "dropdown",
      },
      oldfiles = {
        theme = "dropdown",
      },
      git_branches = {
        theme = "dropdown",
      },
      find_files = {
        theme = "dropdown",
        hidden = true,
      },
      git_commits = {
        mappings = {
          i = {
            ["<CR>"] = function(prompt_bufnr)
              actions.close(prompt_bufnr)
              local value = actions.get_selected_entry(prompt_bufnr).value
              vim.cmd("DiffviewOpen " .. value .. "~1.." .. value)
            end,
          },
        },
      },
    },
    extensions = {
      -- arecibo = {
      --     ["selected_engine"] = 'google',
      --     ["url_open_command"] = 'open',
      --     ["show_http_headers"] = false,
      --     ["show_domain_icons"] = false
      -- },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      },
      arecibo = {
        ["selected_engine"] = "google",
        ["url_open_command"] = "open",
        ["show_http_headers"] = false,
        ["show_domain_icons"] = false,
      },
      frecency = {
        db_root = vim.fn.stdpath("data") .. "/databases/",
        show_scores = false,
        show_unindexed = true,
        ignore_patterns = { "*.git/*", "*/tmp/*" },
        disable_devicons = false,
        workspaces = {
          ["conf"] = vim.fn.expand("$HOME") .. "/.config",
          ["data"] = vim.fn.expand("$HOME") .. "/.local/share",
          ["project"] = vim.fn.expand("$HOME") .. "./.local/git",
          ["wiki"] = vim.fn.expand("$HOME") .. "/wiki",
          ["orb"] = vim.fn.expand("$HOME") .. "/.local/git/orbital",
        },
      },
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
        find_cmd = "rg",
      },
      -- fzf = {
      --   fuzzy = true,
      --   override_generic_sorter = true,
      --   override_file_sorter = true,
      --   case_mode = "smart_case",
      -- },
      project = {
        base_dirs = {
          { path = "~/.config/nvim" },
          { path = "~/.local/git", max_depth = 3 },
        },
        hidden_files = true,
      },
      dash = {
        -- configure path to Dash.app if installed somewhere other than /Applications/Dash.app
        dash_app_path = '/Applications/Dash.app',
        -- search engine to fall back to when Dash has no results, must be one of: 'ddg', 'duckduckgo', 'startpage', 'google'
        search_engine = 'google',
        -- debounce while typing, in milliseconds
        debounce = 300,
        -- map filetype strings to the keywords you've configured for docsets in Dash
        -- setting to false will disable filtering by filetype for that filetype
        -- filetypes not included in this table will not filter the query by filetype
        -- check src/lua_bindings/dash_config_binding.rs to see all defaults
        -- the values you pass for file_type_keywords are merged with the defaults
        -- to disable filtering for all filetypes,
        -- set file_type_keywords = false
        file_type_keywords = {
          dashboard = false,
          NvimTree = false,
          TelescopePrompt = true,
          terminal = true,
          packer = true,
          fzf = false,
          -- a table of strings will search on multiple keywords
          lua = { "lua", "Neovim" },
          clojure = { 'clojure', 'clj', 'javascript', 'html', 'svg', 'css' },
          javascript = { 'javascript', 'html', 'svg', 'nodejs', 'css', 'sass', 'react' },
          typescript = { 'typescript', 'javascript', 'nodejs', 'html', 'svg', 'nodejs', 'css', 'sass' },
          typescriptreact = { 'typescript', 'javascript', 'html', 'svg', 'nodejs', 'css', 'sass', 'react' },
          javascriptreact = { 'javascript', 'html', 'svg', 'nodejs', 'css', 'sass', 'react' },
          -- you can also do a string, for example,
          -- sh = 'bash'
        },
      }
    },
    defaults = {
      mappings = {
        i = {
          ["<c-q>"] = actions.smart_send_to_qflist,
          ["<c-l>"] = trouble.open_with_trouble,
        },
        n = {
          ["<c-q>"] = actions.smart_send_to_qflist,
          ["<c-l>"] = trouble.open_with_trouble,
        },
      },
      history = {
        path = vim.fn.stdpath("data") .. "/databases/telescope_history.sqlite3",
        limit = 100,
      },
    },
  })

  -- telescope.load_extension("fzf")
  telescope.load_extension("gh")
  telescope.load_extension("node_modules")
  telescope.load_extension("session-lens")
  -- telescope.load_extension("vim_bookmarks")
  telescope.load_extension("project")
  telescope.load_extension("neoclip")
  telescope.load_extension("smart_history")
  -- telescope.load_extension("aerial")
  -- require('telescope').load_extension('snippets')
  telescope.load_extension("arecibo")
  telescope.load_extension("media_files")
  telescope.load_extension("frecency")
  telescope.load_extension("ui-select")
end

return config
