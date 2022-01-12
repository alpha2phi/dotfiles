---@diagnostic disable:undefined-global
vim.cmd([[
  call wilder#setup({'modes': [':', '/', '?']})
  call wilder#set_option('pipeline', [
          \   wilder#branch(
          \     wilder#cmdline_pipeline(),
          \     wilder#search_pipeline(),
          \   ),
          \ ])
  call wilder#set_option('renderer', wilder#popupmenu_renderer({
          \ 'empty_message': wilder#popupmenu_empty_message_with_spinner(),
          \ 'highlighter': wilder#basic_highlighter(),
          \ 'highlights': {
          \   'border': 'Normal',
          \ },
          \ 'border': 'rounded',
          \ 'max_height': 21,
          \ 'pumblend': 21,
          \ 'left': [
          \   ' ',
          \   wilder#popupmenu_devicons(),
          \   wilder#popupmenu_buffer_flags({
          \     'flags': ' a + ',
          \     'icons': {'+': '', 'a': '', 'h': ''},
          \   }),
          \ ],
          \ 'right': [
          \   ' ', wilder#popupmenu_scrollbar(),
          \ ],
          \ }))
]])
