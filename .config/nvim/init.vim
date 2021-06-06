call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/vim-auto-save'
Plug 'ajmwagar/vim-deus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdcommenter'
Plug 'ianding1/leetcode.vim'

Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install_sync() }, 'for': ['markdown', 'vim-plug']}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

let mapleader = ' '

let g:rainbow_active = 1

let g:coc_node_path = '/usr/local/bin/node'

let g:leetcode_browser = 'chrome'

"" markdown

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 1
let g:mkdp_browserfunc = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']"

set nofoldenable
let g:vim_markdown_conceal = 2

let tv = 0
if tv
    inoremap ¬ ~
    inoremap "" @
    inoremap £ #
    inoremap @ "
endif


set number
syntax on
set encoding=utf-8
set t_Co=256
set autoindent
set shiftwidth=4
set softtabstop=4
set list
"set foldmethod=indent
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif	" save cursor
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase

exec "nohls"

" NERDTree
map tt :NERDTreeToggle<CR>

" ale
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" :map <F5> <ESC>:w<CR><ESC>:!python %<CR>
:noremap <tab> >
:noremap <s-tab> <
:noremap H 5h
:noremap J 5j
:noremap K 5k
:noremap L 5l
:noremap n nzz
:noremap N Nzz
:noremap <leader><CR> :nohls<CR>
:map s <nop>
:noremap S :w<CR>
:noremap <expr>q col(".")==1?"$":"0"
:vnoremap <expr>s col(".")==1?"$h":"0"
:noremap Q :wq<CR>
:noremap sh :set nosplitright<CR>:vsplit<CR>
:noremap sl :set splitright<CR>:vsplit<CR>
:noremap sj :set splitbelow<CR>:split<CR>
:noremap sk :set nosplitbelow<CR>:split<CR>
:noremap <leader>h <C-w>h
:noremap <leader>l <C-w>l
:noremap <leader>j <C-w>j
:noremap <leader>k <C-w>k
:noremap <up> :res -3<CR>
:noremap <down> :res +3<CR>
:noremap <left> :vertical resize+3<CR>
:noremap <right> :vertical resize-3<CR>
:noremap sv <C-w>t<C-w>H
:noremap sh <C-w>t<C-w>K
:noremap tu :tabe<CR>
:map <leader><leader> <F5>
nnoremap <buffer> ? :<C-u>execute "!pydoc3 ".expand("<cword>")<CR>

:noremap m q

autocmd FileType c nnoremap <buffer> <F5> :w<CR><ESC> :!gcc % && ./a.out <CR>
autocmd FileType cpp nnoremap <buffer> <F5> :w<CR><ESC> :!g++ % && ./a.out <CR>
autocmd FileType python nnoremap <buffer> <F5> :w<CR><ESC> :! python % <CR>
autocmd FileType markdown nnoremap <buffer> <F5> :w<CR><ESC> exec "MarkdownPreview"

"map <F5> :call Run()<CR>
"func! Run()
    "exec "w"
    "if &filetype == 'c'
	"exec "!gcc % -o %<"
	"exec "!time ./%<"
    "else if &filetype == 'cpp'
	"exec "!g++ % -o %<"
	"exec "!time ./%<"
    "else if &filetype == 'python'
	"exec "!time python3 %"
    "else if &filetype == 'markdown'
	"exec "MarkdownPreview"
    "endif
"endfunc


let g:coc_disable_startup_warning = 1

" coc.nvim
let g:coc_global_extensions = [
    \ 'coc-json', 
    \ 'coc-tsserver', 
    \ 'coc-vimlsp', 
    \ 'coc-marketplace', 
    \ 'coc-sh', 
    \ 'coc-highlight', 
    \ 'coc-git', 
    \ 'coc-leetcode', 
    \ 'coc-ccls', 
    \ 'coc-syntax' 
    \ ]

set updatetime=100

" tab
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <c-o> coc#refresh()



" win10 wsl paste
set pastetoggle=<f12>

" auto-pairs
let g:AutoPairsMultilineClose = 0

autocmd BufNewFile *.cpp exec ":call SetTitle()"
 
func SetTitle()
    if &filetype == 'cpp'
	call setline(1,"\#include <iostream>")
	call append(line("."), "")
	call append(line(".")+1, "using namespace std;")
	call append(line(".")+2, "")
	call append(line(".")+3, "int main() {")
	call append(line(".")+4, "")
	call append(line(".")+5, "    return 0;")
	call append(line(".")+6, "}")
    endif
endfunc
