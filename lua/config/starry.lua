local config = {}

function config.setup()
	vim.g.starry_italic_comments = true
	vim.g.starry_italic_string = false
	vim.g.starry_italic_keywords = true
	vim.g.starry_italic_functions = true
	vim.g.starry_italic_variables = true
	vim.g.starry_contrast = true
	vim.g.starry_borders = false
	vim.g.starry_disable_background = false
	vim.g.starry_style_fix = true
	vim.g.starry_style = "earlysummer"
	vim.g.starry_darker_contrast = true
	vim.g.starry_deep_black = false
	vim.g.starry_set_hl = false
	vim.g.starry_daylight_switch = true
end

return config
