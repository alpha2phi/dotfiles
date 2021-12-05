" w call ddc#custom#patch_global('sources', ['around', 'nvim-lsp'])

" call ddc#custom#patch_global('sourceOptions', {
"         \ '_': { 'matchers': ['matcher_head'] },
"         \ 'nvim-lsp': {
"         \   'mark': 'lsp',
"         \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
"         \ })

" " Use Customized labels
" call ddc#custom#patch_global('sourceParams', {
"         \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
"         \ })

" call ddc#custom#patch_filetype(['lua', 'python'], 'sources', ['around', 'nvim-lsp'])


" inoremap <silent><expr> <TAB>
" \ pumvisible() ? '<C-n>' :
" \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
" \ '<TAB>' : ddc#map#manual_complete()

" inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" call ddc#enable()
