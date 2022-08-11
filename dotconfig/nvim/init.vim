" dein.vimによるプラグイン管理
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif

  execute 'set runtimepath+=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = '~/.config/nvim/dein'

    call dein#load_toml(s:toml_dir . '/initial.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif


if has('vim_starting') && dein#check_install()
    call dein#install()
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
