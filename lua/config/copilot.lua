---@diagnostic disable:undefined-global
local G = {}

function G.setup()
	vim.cmd([[
    highlight CopilotSuggestion guifg=#EEEE00 ctermfg=8
    let g:copilot_no_tab_map = v:true
  ]])
	vim.cmd([[ imap <silent><script><expr> <right> copilot#Accept("\<CR>")]])
end

return G
