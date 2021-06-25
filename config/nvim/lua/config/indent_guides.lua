require("Dusk-til-Dawn").timeMan(
  function()
  require('indent_guides').setup({
      even_colors = {fg = "#d3d3e7", bg = "#d3d3e7"},
      odd_colors = {fg = "#e7e7fc", bg = "#e7e7fc"},
      indent_guide_size = 4
  })
  require('indent_guides').indent_guides_enable()
  end,
  function()
  require('indent_guides').setup({
      even_colors = {fg = "#444155", bg = "#444155"},
      odd_colors = {fg = "#3b314d", bg = "#3b314d"},
      indent_guide_size = 4
  })
  require('indent_guides').indent_guides_enable()
  end
)

