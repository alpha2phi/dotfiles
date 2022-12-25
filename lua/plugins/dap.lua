---@diagnostic disable: undefined-global

local M = {}
function M.setup()
  local dap, dapui = require("dap"), require("dapui")
  local firefoxBin = '/opt/homebrew/Caskroom/firefox-developer-edition/latest/Firefox Developer Edition.app/Contents/MacOS/firefox'

  require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = my.fs.dir.data .. "/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
  })

  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { my.fs.dir.data .. "/site/pack/packer/opt/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
  }

  dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { my.fs.dir.data .. '/site/pack/packer/opt/vscode-firefox-debug/dist/adapter.bundle.js' },
  }

  dap.configurations.javascript = {
    name = 'Debug JS with Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = firefoxBin
  }
  dap.configurations.javascriptreact = {
    {
      name = 'Debug JSX with Firefox',
      type = 'firefox',
      request = 'launch',
      reAttach = true,
      url = 'http://localhost:3000',
      webRoot = '${workspaceFolder}',
      firefoxExecutable = firefoxBin
    },
    {
      name = 'Debug JSX with Chrome',
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}"
    }
  }
  dap.configurations.typescript = {
    name = 'Debug TS with Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = firefoxBin
  }
  dap.configurations.typescriptreact = {
    {
      name = 'Debug TSX with Firefox',
      type = 'firefox',
      request = 'launch',
      reAttach = true,
      url = 'http://localhost:3000',
      webRoot = '${workspaceFolder}',
      firefoxExecutable = firefoxBin
    },
    {
      name = 'Debug TSX with Chrome',
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}"
    },
    {
      name = "Debug TSX: launch pwa-node",
      type = "pwa-node",
      request = "launch",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      name = "Debug TSX: attach pwa-node",
      type = "pwa-node",
      request = "attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      name = "Debug TSX: launch pwa-chrome",
      type = "pwa-chrome",
      request = "launch",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      name = "Debug TSX: attach pwa-chrome",
      type = "pwa-chrome",
      request = "attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
      url = "localhost:3000",
    }
  }

  dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
    },
    layouts = {
      {
        elements = {
          'scopes',
          'breakpoints',
          'stacks',
          'watches',
        },
        size = 40,
        position = 'left',
      },
      {
        elements = {
          'repl',
          'console',
        },
        size = 10,
        position = 'bottom',
      },
    },
    floating = {
      max_height = 1, -- These can be integers or a float between 0 and 1.
      max_width = 1, -- Floats will be treated as percentage of your screen.
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 }
  })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

end

return M
