---@diagnostic disable:undefined-global
local G = {}

function G.setup()
	vim.cmd([[
    highlight CopilotSuggestion guifg=#EEEE00 ctermfg=8
    " imap <silent><expr> <C-CR> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:false
  ]])
end

return G
