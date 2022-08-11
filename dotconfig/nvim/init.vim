" dein.vimによるプラグイン管理
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  execute 'set runtimepath+=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#load_toml('~/.config/nvim/dein/plugins.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

let splt = split(glob("~/.config/nvim/config/" . "*.vim"))

for file in splt
    execute 'source' file
endfor

colorscheme tender

let g:lightline = {
    \   'colorscheme': 'tender',
    \   'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \   },
    \   'component_function': {
    \     'gitbranch': 'gitbranch#name'
    \   },
    \ }


" VimFiler
nmap sf :VimFilerBufferDir<Return>
nmap sF :VimFilerExplorer -find<Return>
nmap sb :Unite buffer<Return>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_indentation = 2
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'
