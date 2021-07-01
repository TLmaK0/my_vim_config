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

let g:vim_markdown_folding_disabled=1
let g:netrw_keepdir=0

set autochdir
au BufRead,BufNewFile *.pp set filetype=ruby
au BufReadPost *.hbs set syntax=html
au BufNewFile,BufRead *.slm set filetype=slim
set shiftwidth=2

highlight htmlLink ctermbg=black
highlight htmlLink ctermfg=red

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'derekwyatt/vim-scala'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'dense-analysis/ale'
Bundle 'noprompt/vim-yardoc'
Bundle 'ajh17/Spacegray.vim'
Bundle 'git@github.com:slim-template/vim-slim.git'
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

" ale javascript/typescript
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'] }
let g:ale_lint_delay = 500
