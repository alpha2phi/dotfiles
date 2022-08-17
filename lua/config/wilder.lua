---@diagnostic disable:undefined-global
local M = {}
local wilder = require('wilder')

function M.setup()
  local popupmenu_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
      mode = "popup",
      pre_hook = function(ctx)
        vim.opt_local.winbar = nil
      end,
      border = 'rounded',
      empty_message = wilder.popupmenu_empty_message_with_spinner(),
      highlighter = { wilder.pcre2_highlighter(), wilder.basic_highlighter() },
      left = {
        ' ',
        wilder.popupmenu_devicons(),
        wilder.popupmenu_buffer_flags({
          flags = ' a + ',
          icons = { ['+'] = '', a = '', h = '' }
        })
      },
      right = {
        ' ',
        wilder.popupmenu_scrollbar()
      }
    })
  )
  local palette_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_palette_theme({
      -- 'single', 'double', 'rounded' or 'solid'
      -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
      pre_hook = function(ctx)
        vim.opt_local.winbar = nil
      end,
      border = 'rounded',
      max_height = '75%', -- max height of the palette
      min_height = '75%', -- set to the same as 'max_height' for a fixed height window
      prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
      reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
    })
  )
  local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = { wilder.pcre2_highlighter(), wilder.basic_highlighter() },
    separator = ' · ',
    left = { ' ', wilder.wildmenu_spinner(), ' ' },
    right = { ' ', wilder.wildmenu_index() },
  })

  wilder.setup({ modes = { ':', '/', '?' } })
  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.cmdline_pipeline(),
      wilder.search_pipeline()
    )
  })

  wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = wildmenu_renderer,
    ['/'] = wildmenu_renderer,
    substitute = wildmenu_renderer,
  }))
end

return M
