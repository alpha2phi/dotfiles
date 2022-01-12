local config = {}

function config.setup()
	require("nvim-ts-autotag").setup()
	require("nvim-autopairs").setup({})
end

return config
