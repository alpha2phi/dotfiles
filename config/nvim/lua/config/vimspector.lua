local M = {}

function M.setup()
    -- vim.g.vimspector_enable_mappings = 'HUMAN'
end

return M

-- fun! GotoWindow(id)
--     call win_gotoid(a:id)
--     MaximizerToggle
-- endfun
-- nmap <leader>vl :call vimspector#Launch()<CR>
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
