-- nvim-dap
require('telescope').load_extension('dap')
vim.fn.sign_define('DapBreakpoint',
                   {text = '🟥', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',
                   {text = '⭐️', texthl = '', linehl = '', numhl = ''})

-- nvim-dap-virtual-text. Show virtual text for current frame
vim.g.dap_virtual_text = true

-- nvim-dap-ui
require("dapui").setup()

-- vim-ultest
require("ultest").setup({
    builders = {
        ['python#unittest'] = function(cmd)
            -- The command can start with python command directly or an env manager
            local non_modules = {'python', 'pipenv', 'poetry'}
            -- Index of the python module to run the test.
            local module
            if vim.tbl_contains(non_modules, cmd[1]) then
                module = cmd[3]
            else
                module = cmd[1]
            end
            -- Remaining elements are arguments to the module
            local args = vim.list_slice(cmd, module_index + 1)
            return {
                dap = {
                    type = 'python',
                    request = 'launch',
                    module = module,
                    args = args
                }
            }
        end,
        ["go#gotest"] = function(cmd)
            local args = {}
            for i = 3, #cmd - 1, 1 do
                local arg = cmd[i]
                if vim.startswith(arg, "-") then
                    -- Delve requires test flags be prefix with 'test.'
                    arg = "-test." .. string.sub(arg, 2)
                end
                args[#args + 1] = arg
            end
            return {
                dap = {
                    type = "go",
                    request = "launch",
                    mode = "test",
                    program = "${workspaceFolder}",
                    dlvToolPath = vim.fn.exepath("dlv"),
                    args = args
                },
                parse_result = function(lines)
                    return lines[#lines] == "FAIL" and 1 or 0
                end
            }
        end
    }
})

-- languages
require('dbg.python')
require('dbg.rust')
require('dbg.go')
require('dbg.typescript')

local utils = require('utils')

-- key mappings
utils.map('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>')
utils.map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
utils.map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
utils.map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
utils.map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')

utils.map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
utils.map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
utils.map('v', '<leader>dhv',
          '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

utils.map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
utils.map('n', '<leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

utils.map('n', '<leader>dsbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
utils.map('n', '<leader>dsbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
utils.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
utils.map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')

-- telescope-dap
utils.map('n', '<leader>dcc',
          '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
utils.map('n', '<leader>dco',
          '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
utils.map('n', '<leader>dlb',
          '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
utils.map('n', '<leader>dv',
          '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
utils.map('n', '<leader>df',
          '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

-- nvim-dap-ui
utils.map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')
