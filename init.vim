call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'tpope/vim-fugitive'
Plug 'tsaleh/vim-align'
Plug 'ervandew/supertab'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'mileszs/ack.vim'
Plug 'nono/vim-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'heartsentwined/vim-ember-script'
Plug 'heartsentwined/vim-emblem'
Plug 'bling/vim-airline'
Plug 'benekastah/neomake'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'jdonaldson/vaxe'
Plug 'jgdavey/tslime.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'

call plug#end()

set nocompatible

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme wombat

syntax on
filetype indent plugin on

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set wildmode=list:longest "Make cmdline tab completion similar to bash
set hidden

set encoding=utf-8
set nohlsearch

set vb "Visual bell
set wildmenu "Enable ctrl-n and ctrl-p to scroll thru matches
set showcmd " display incomplete commands
set list listchars=tab:>-,trail:.,extends:>,precedes:<

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

set wildignore+=*/tmp/*,*/node_modules/*,*/bower_components/*,*/dist/*
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

let g:airline_powerline_fonts=1

let mapleader=","
nmap <leader>b :BufExplorer<cr>
nmap <leader>t :Files<CR>
let g:ackprg = 'pt --nogroup --nocolor --column'

au Bufread,BufNewFile *.as set filetype=actionscript
au Bufread,BufNewFile *.pp set filetype=puppet
au Bufread,BufNewFile *.hx set filetype=haxe

let g:neomake_open_list = 2
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }
let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'Todo',
            \ }

let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

let test#strategy = 'tslime'
nmap <silent> <Leader>r :TestNearest<CR>
nmap <silent> <Leader>R :TestFile<CR>
nmap <silent> <Leader>a :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>g :TestVisit<CR>
nmap <silent> <leader>d <Plug>DashSearch

function! test#ruby#minitest#executable() abort
  return 'bundle exec ruby'
endfunction

let whitespace_blacklist = ['diff']
autocmd BufWritePre * if index(whitespace_blacklist, &ft) < 0 |:%s/\s\+$//e
