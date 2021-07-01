set nocompatible
filetype off
set number
set ts=2
set et
set encoding=utf-8
set incsearch

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

set omnifunc=syntaxcomplete#Complete

let g:vim_markdown_folding_disabled=1
let g:netrw_keepdir=0

set autochdir
au BufRead,BufNewFile *.pp set filetype=ruby
au BufReadPost *.hbs set syntax=html
au BufNewFile,BufRead *.slm set filetype=slim
set shiftwidth=2

highlight htmlLink ctermbg=black
highlight htmlLink ctermfg=red

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'editorconfig/editorconfig-vim'
Plug 'leafgarland/typescript-vim'
Plug 'noprompt/vim-yardoc'
Plug 'ajh17/Spacegray.vim'
Plug 'slim-template/vim-slim'
call plug#end()

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

