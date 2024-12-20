set nocompatible
filetype off
set number
set ts=2
set et
set encoding=utf-8
set incsearch

if isdirectory($HOME . '/.vim/.backup') == 0
  :silent !mkdir -p ~/.vim/.backup >/dev/null 2>&1
endif

if isdirectory($HOME . '/.vim/.swap') == 0
  :silent !mkdir -p ~/.vim/.swap >/dev/null 2>&1
endif

if isdirectory($HOME . '/.vim/.undo') == 0
  :silent !mkdir -p ~/.vim/.undo >/dev/null 2>&1
endif

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//
set undodir=~/.vim/.undo//

" Fix problems with file watchers looking for updates, like Watchman
" https://github.com/facebook/metro/issues/1211#issuecomment-1930208508
set backupcopy=yes

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
Plug 'vim-scripts/Spacegray.vim'
Plug 'slim-template/vim-slim'
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.81'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
call plug#end()

filetype plugin indent on

command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>
syntax on
if has('unix')
  set t_Co=256
end

autocmd BufEnter * colorscheme spacegray                                                                                                                                                                           
autocmd BufEnter *.graphql colorscheme jellybeans
let g:airline_theme='wombat'

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <silent> qf <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

nmap <Leader>j <Plug>(coc-diagnostic-next-error)
nmap <Leader>k <Plug>(coc-diagnostic-prev-error)

let g:coc_user_config = {
  \   "coc.preferences.jumpCommand": "tab drop",
  \ }

