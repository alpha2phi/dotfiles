local config = {}

function config.setup()
	vim.cmd([[
    let g:minimap_width = 21
    let g:minimap_auto_start = 1
    let g:minimap_auto_start_win_enter = 1
    let g:minimap_git_colors = 1
  ]])
end

-- " vim.cmd("autocmd ColorScheme * highlight minimapCursor ctermbg=59 ctermfg=228 guibg=Cyan guifg=Yellow")
-- " vim.cmd("autocmd ColorScheme * highlight minimapRange ctermbg=242 ctermfg=228 guibg=Magenta guifg=Yellow")
return config
