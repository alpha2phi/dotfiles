local M = {}

function M.nvim_dap_setup()
  -- DAPInstall
  local dap_install = require "dap-install"
  dap_install.setup {
    installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
  }

  -- telescope-dap
  require("telescope").load_extension "dap"

  -- nvim-dap-virtual-text. Show virtual text for current frame
  -- vim.g.dap_virtual_text = true -- deprecated

  -- nvim-dap-ui
  require("dapui").setup {}

  -- languages
  require("config.dap.python").setup()
  require("config.dap.rust").setup()
  require("config.dap.go").setup()
  require("config.dap.node").setup()
  require("config.dap.lua").setup()

  -- nvim-dap
  vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

  vim.g.vimspector_enable_mappings = ""
end

function M.vimspector_setup()
  vim.g.vimspector_enable_mappings = "HUMAN"

  vim.g.vimspector_install_gadgets = {
    "debugpy",
    "vscode-go",
    "CodeLLDB",
    "vscode-node-debug2",
    "local-lua-debugger-vscode",
  }
  vim.cmd [[packadd! vimspector]]

  -- fun! GotoWindow(id)
  --     call win_gotoid(a:id)
  --     MaximizerToggle
  -- endfun
  -- nmap <leader>vr :VimspectorReset<CR>
  -- nmap <leader>ve :VimspectorEval
  -- nmap <leader>vw :VimspectorWatch
  -- nmap <leader>vo :VimspectorShowOutput
  -- nmap <leader>vi <Plug>VimspectorBalloonEval
  -- xmap <leader>vi <Plug>VimspectorBalloonEval
  -- let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]

  -- " Integration with telescope.nvim
  -- nmap <leader>vc :lua require('telescope').extensions.vimspector.configurations()<CR>
  -- " Inspection
  -- nnoremap <leader>vtv :MaximizerToggle!<CR>
  -- nnoremap <leader>vgc :call GotoWindow(g:vimspector_session_windows.code)<CR>
  -- nnoremap <leader>vgt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
  -- nnoremap <leader>vgv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
  -- nnoremap <leader>vgw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
  -- nnoremap <leader>vgs :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
  -- nnoremap <leader>vgo :call GotoWindow(g:vimspector_session_windows.output)<CR>
end

function M.setup()
  M.nvim_dap_setup()
  M.vimspector_setup()

  -- key mappings
  local wk = require "config.whichkey"
  wk.register_dap()
end

return M
