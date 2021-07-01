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
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'editorconfig/editorconfig-vim'
Plug 'leafgarland/typescript-vim'
Plug 'noprompt/vim-yardoc'
Plug 'ajh17/Spacegray.vim'
Plug 'slim-template/vim-slim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" coc
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:coc_user_config = {
  \   "coc.preferences.jumpCommand": "tab drop"
  \ }

