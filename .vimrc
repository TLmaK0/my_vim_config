set nocompatible
filetype off
set number
set ts=2
set et
set encoding=utf-8
let g:vim_markdown_folding_disabled=1
set autochdir
au BufRead,BufNewFile *.pp set filetype=ruby
au BufReadPost *.hbs set syntax=html
set shiftwidth=2

highlight htmlLink ctermbg=black
highlight htmlLink ctermfg=red

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'derekwyatt/vim-scala'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'
Bundle 'noprompt/vim-yardoc'
Bundle 'ajh17/Spacegray.vim'
call vundle#end()
filetype plugin indent on

command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>
syntax on
if has('unix')
  set t_Co=256
end
colorscheme spacegray

" custom ruby colors
hi link yardGenericTag rubyComment
hi link yardParamName rubyComment
hi link yardType rubySymbol
