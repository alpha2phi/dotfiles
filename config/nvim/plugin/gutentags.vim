set tags=./tags,tags;$HOME

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = 'tags'
let g:gutentags_file_list_command = 'rg --files'

let g:gutentags_modules = ['ctags']

let g:gutentags_cache_dir = expand('~/.local/tags')
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
