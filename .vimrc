set t_Co=256
syntax on
filetype on
filetype plugin indent on

if &diff
    color inkpot
else
    color molokai
    autocmd FileType svn color svn
    autocmd FileType automake color automake
    autocmd FileType config color automake
    autocmd FileType hgcommit color hgcommit
    autocmd FileType c,cpp,slang set cindent
    autocmd FileType c,cpp,slang color wombat256
    autocmd FileType perl set smartindent
    autocmd FileType python color tir_black
    autocmd FileType perl color wombat256
    autocmd FileType css set smartindent
    autocmd FileType make set noexpandtab shiftwidth=4
    autocmd FileType ant color xml
    autocmd FileType xml color xml
    autocmd FileType xsd color xml
    autocmd FileType vimwiki color harlequin
    autocmd FileType java color starbucks
    autocmd FileType sh color calmar256
    autocmd FileType sh silent ! xtermcontrol --cursor="\#0087d7"
    autocmd BufEnter * setlocal cursorline
    autocmd BufLeave * setlocal nocursorline
    " hg commit messages
    au BufRead,BufNewFile hg-editor-*.txt setf hgcommit 
endif

set nofoldenable
set expandtab
set tabstop=4
set shiftwidth=4
set numberwidth=5
set nu

noremap <silent> <m-left> :bp<CR>
noremap <silent> <m-right> :bn<CR>
noremap <silent> <C-H> <C-W><Left>
noremap <silent> <C-J> <C-W><Down>
noremap <silent> <C-K> <C-W><Up>
noremap <silent> <C-L> <C-W><Right>
inoremap <C-E> <C-P>
set directory=/tmp
set nowrap
set laststatus=2
set nocompatible

"version 6.0
"if &cp | set nocp | endif
"let s:cpo_save=&cpo
"set cpo&vim
"nmap gx <Plug>NetrwBrowseX
"nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
"let &cpo=s:cpo_save
"let @a='2yyjp'
"unlet s:cpo_save
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set encoding=utf-8
set paste
"set helplang=en
"set history=50
"set nomodeline
"set printoptions=paper:letter
"set ruler
"set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
"set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"set shell=/bin/bash\ -l
"set hlsearch
"set scrolloff=1000
"vim: set ft=vim :
"let @d='.,$d'

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

nnoremap <C-E> :Hexmode<CR>

source $HOME/.vim/gtags.vim
call pathogen#infect()
