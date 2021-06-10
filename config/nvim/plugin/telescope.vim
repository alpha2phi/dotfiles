" Find files using Telescope command-line sugar.
" nnoremap <silent> <leader>ff :DashboardFindFile<CR>
nnoremap <silent> ; :Telescope git_files<CR>
nnoremap <silent> <leader>fG :Telescope live_grep<cr>
nnoremap <silent> <leader>fb :Telescope buffers<cr>
nnoremap <silent> <leader>fk :Telescope help_tags<cr>
" nnoremap <silent> <leader>ff :Telescope file_browser<cr>
nnoremap <silent> <leader>fcs :Telescope colorscheme<cr>
nnoremap <silent> <leader>fqf :Telescope quickfix<cr>
nnoremap <silent> <leader>fr :Telescope registers<cr>
nnoremap <silent> <leader>fz :Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <leader>fsb :Telescope lsp_document_symbols<cr>
nnoremap <silent> <leader>fsp :Telescope lsp_workspace_symbols<cr>
nnoremap <silent> <leader>fj* :Telescope lsp_references<cr>
nnoremap <silent> <leader>fa :Telescope lsp_code_actions<cr>
nnoremap <silent> <leader>fdb :Telescope lsp_document_diagnostics<cr>
nnoremap <silent> <leader>fdp :Telescope lsp_workspace_diagnostics<cr>
nnoremap <silent> <leader>fji :Telescope lsp_implementations<cr>
nnoremap <silent> <leader>fjd :Telescope lsp_definitions<cr>
nnoremap <silent> <leader>fgcp :Telescope git_commits<cr>
nnoremap <silent> <leader>fgcb :Telescope git_bcommits<cr>
nnoremap <silent> <leader>fgb :Telescope git_branches<cr>
nnoremap <silent> <leader>fgs :Telescope git_status<cr>
nnoremap <silent> <leader>fgt :Telescope git_stash<cr>
nnoremap <silent> <leader>ftt :Telescope treesitter<cr>
nnoremap <silent> <leader>ftc :Telescope tags<cr>
nnoremap <silent> <leader>f?? :Cheatsheet<cr>
nnoremap <silent> <leader>f?e :CheatsheetEdit<cr>
nnoremap <silent> <leader>fghi :Telescope gh issues<cr>
nnoremap <silent> <leader>fghpr :Telescope gh pull_request<cr>
nnoremap <silent> <leader>fn :Telescope node_modules list<cr>
" nnoremap <silent> <leader>fh :DashboardFindHistory<CR>
" nnoremap <silent> <leader>fc :DashboardChangeColorscheme<CR>
" nnoremap <silent> <leader>fw :DashboardFindWord<CR>
" nnoremap <silent> <leader>fm :DashboardJumpMark<CR>
" nnoremap <silent> <leader>fn :DashboardNewFile<CR>
nnoremap <silent> <leader>fp :Telescope project<CR>
nnoremap <silent> <leader>ff :Telescope frecency<CR>
nnoremap <silent> <leader>fy :Telescope symbols<CR>
nnoremap <silent> <leader>fS :SearchSession
nnoremap <silent> <leader>fmp :Telescope vim_bookmarks all<CR>
nnoremap <silent> <leader>fmb :Telescope vim_bookmarks current_file<CR>
nnoremap <silent> <leader>f?s :Telescope ultisnips ultisnips<CR>

nnoremap <silent> <leader>fW :lua require('telescope').extensions.arecibo.websearch()<CR>
nnoremap <silent> <leader>f. :lua require('config.telescope').search_dotfiles()<CR>
nnoremap <silent> <leader>fP :lua require('config.telescope').switch_projects()<CR>

nmap <leader>S> :<C-u>SaveSession<CR>
nmap <leader>S< :<C-u>RestoreSession<CR>

