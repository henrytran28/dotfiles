if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdTree'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

Plug 'junegunn/seoul256.vim'

Plug 'valloric/youcompleteme', { 'do': './install.py' }

Plug 'scrooloose/nerdcommenter'

Plug 'bling/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'ntpeters/vim-better-whitespace'

Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-fugitive'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'junegunn/vim-easy-align'

Plug 'mattn/emmet-vim'

call plug#end()

"Colour
set t_Co=256
let g:seoul256_srgb = 1
colo seoul256

" Tabbing and indenting
filetype plugin indent on
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType xml setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType lua setlocal expandtab shiftwidth=4 tabstop=4 sts=4
autocmd FileType typescript setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType typescriptreact setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 sts=2
autocmd FileType javascriptreact setlocal expandtab shiftwidth=2 tabstop=2 sts=2

" Auto-expansion
inoremap {<CR> {<CR>}<ESC>O

" Common settings
set hlsearch
set number
hi Normal ctermbg=none

" Useful shortcuts
let mapleader=","
set pastetoggle=<leader>v
imap jk <Esc>
nnoremap <silent> <leader>h :nohlsearch<CR>
vmap <silent> <leader>s :sort<CR>

map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bd :bp\|bd #<cr>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>rr :YcmCompleter RefactorRename<Space>
nmap <leader>D <plug>(YCMHover)

" Vim Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Better WhiteSpace
highlight ExtraWhitespace ctermbg=114
map <leader>sw :StripWhitespace<CR>

" Nerdcommenter
let NERDSpaceDelims=1

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" VimWiki
let g:vimwiki_list = [{'path': '$HOME/Dropbox/Notes'}]
autocmd FileType vimwiki nmap <leader>h :Vimwiki2HTML<CR>
autocmd FileType vimwiki nmap <leader>ha :VimwikiAll2HTML<CR>
autocmd FileType vimwiki nmap <leader>t :VimwikiTable<CR>

" Golang
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>r <Plug>(go-run)

" Ale
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint']
\}
let g:ale_fix_on_save = 1

" Ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
