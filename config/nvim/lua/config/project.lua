require'telescope'.load_extension('project')

vim.api.nvim_set_keymap(
	'n',
	'<leader>pp',
	":lua require'telescope'.extensions.project.project{ change_dir = true }<CR>",
	{noremap = true, silent = true}
)
