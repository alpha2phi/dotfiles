local M = {}

function M.setup()
    local dap = require("dap")

    -- dap.adapters.rust = {
    --     type = 'executable',
    --     attach = {pidProperty = "pid", pidSelect = "ask"},
    --     command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
    --     env = {LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"},
    --     name = "lldb"
    -- }

    -- dap.configurations.rust = {
    --     {
    --         type = "rust",
    --         name = "Debug",
    --         request = "launch",
    --         program = "/Users/mengwangk/workspace/development/rust-app/target/debug/myapp1"
    --     }
    -- }

    dap.adapters.lldb = {
        type = 'executable',
        attach = {pidProperty = "pid", pidSelect = "ask"},
        command = 'lldb-vscode',
        name = "lldb",
        env = {LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"}
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ',
                                    vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},

            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            runInTerminal = false
        }
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

return M

