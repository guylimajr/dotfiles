"----------------------------------------------------------
"
" Initial setup
"
"----------------------------------------------------------
set nocompatible
let mapleader = " "
set hidden

"----------------------------------------------------------
"
" Use vundle for plugins
"
"
"----------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'Shougo/vimproc.vim'
	" Movement
	Plugin 'Lokaltog/vim-easymotion'
	" Look 'n feel
	Plugin 'bling/vim-airline'
	Plugin 'altercation/vim-colors-solarized'
	" Autocomplete
	Plugin 'SirVer/ultisnips'
	Plugin 'kien/ctrlp.vim'
	Plugin 'Valloric/YouCompleteMe'
	" General Coding
	Plugin 'tpope/vim-commentary'
	Plugin 'scrooloose/syntastic'
	" Javascript
	Plugin 'pangloss/vim-javascript'
	Plugin 'marijnh/tern_for_vim'
	" Typescript
	Plugin 'leafgarland/typescript-vim'
	" Plugin 'Quramy/tsuquyomi'
call vundle#end()
filetype plugin indent on

"----------------------------------------------------------
"
" Appearance
"
"----------------------------------------------------------
syntax enable
set background=light
colorscheme solarized

"Disable audio bell
set visualbell

"Search
set smartcase
set incsearch

"See where you're at
set number "show line numbers
set cursorline "highlight the line with the cursor
set colorcolumn=80 "highlight the 80th column
set statusline=%M\ %-t\ (%n) "modified - trailing filename - buffer #
set laststatus=2 "Always show status

"Tabs are 4 spaces, not expanded
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent

if has("gui_running")
	"Use light solarized and make it slightly bigger
	set background=light
	colorscheme solarized
	set guifont=Monaco:h12
	set linespace=2

	"Turn off GUI features
	set guioptions-=m "remove menu bar
	set guioptions-=T "remove toolbar
	set guioptions-=r "remove right-hand scroll bar
	set guioptions-=L "remove left-hand scroll bar
endif

set splitright
set splitbelow

nnoremap ; :
nnoremap ;; :
nnoremap ;w :w<Cr>
nnoremap ;q :q<Cr>
nnoremap ;bd :bd<Cr>

" Leader + delete: sends to black hole buffer
nnoremap <Leader>d "_d
nnoremap <Leader>D "_D
nnoremap <Leader>x "_x
nnoremap <Leader>X "_X

vnoremap <Leader>d "_d
vnoremap <Leader>D "_D
vnoremap <Leader>x "_x
vnoremap <Leader>X "_X

" Leader + put: puts from yank buffer
nnoremap <Leader>p "0p
nnoremap <Leader>P "0P
vnoremap <Leader>p "_d"0P
vnoremap <Leader>P "_d"0P

"----------------------------------------------------------
"
" Don't use escape
"
"----------------------------------------------------------
vnoremap v <Esc>
vnoremap V <Esc>

"----------------------------------------------------------
"
" Don't use arrows
"
"----------------------------------------------------------
inoremap <Left> <nop>
onoremap <Left> <nop>
cnoremap <Left> <nop>
vnoremap <Left> <nop>
nnoremap <Left> <nop>

inoremap <Right> <nop>
onoremap <Right> <nop>
cnoremap <Right> <nop>
vnoremap <Right> <nop>
nnoremap <Right> <nop>

inoremap <Up> <nop>
onoremap <Up> <nop>
cnoremap <Up> <nop>
vnoremap <Up> <nop>
nnoremap <Up> <nop>

inoremap <Down> <nop>
onoremap <Down> <nop>
cnoremap <Down> <nop>
vnoremap <Down> <nop>
nnoremap <Down> <nop>

"----------------------------------------------------------
"
" Editing Commands
"
"----------------------------------------------------------
vnoremap > >gv
vnoremap < <gv
nnoremap <cr> o<Esc>

"----------------------------------------------------------
"
" Command mode commands
"
"----------------------------------------------------------
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"----------------------------------------------------------
"
" Commands for editing js, html, and css
"
"----------------------------------------------------------
augroup web-dev-files
	autocmd!

	autocmd FileType javascript setlocal omnifunc=tern#Complete
	autocmd BufRead,BufNewFile *.ts set filetype=typescript

	autocmd Filetype typescript,javascript,html,css set tabstop=2
	autocmd Filetype typescript,javascript,html,css set softtabstop=2
	autocmd Filetype typescript,javascript,html,css set shiftwidth=2
	autocmd Filetype typescript,javascript,html,css set expandtab


	" Testing
	autocmd Filetype typescript,javascript iabbrev reqexp var expect = require('chai').expect;
	autocmd Filetype typescript,javascript iabbrev desc describe

	" Top of files
	autocmd Filetype typescript,javascript iabbrev usestrict 'use strict';
	autocmd Filetype typescript,javascript iabbrev req require
	autocmd Filetype typescript,javascript iabbrev fun function
	autocmd Filetype typescript,javascript iabbrev ret return
	autocmd Filetype typescript,javascript iabbrev clog console.log
	autocmd Filetype typescript,javascript iabbrev prot prototype

	autocmd Filetype typescript,javascript iabbrev ael addEventListener
	autocmd Filetype typescript,javascript iabbrev rel removeEventListener
	autocmd Filetype typescript,javascript iabbrev papply prototype.apply
	autocmd Filetype typescript,javascript iabbrev pcall prototype.call
	autocmd Filetype typescript,javascript iabbrev sett setTimeout
	autocmd Filetype typescript,javascript iabbrev seti setInterval
	autocmd Filetype typescript,javascript iabbrev ocreate Object.create
	autocmd Filetype typescript,javascript iabbrev selfthis var self = this;
	autocmd Filetype typescript,javascript iabbrev bindthis bind(this)

	" Dom
	autocmd Filetype typescript,javascript iabbrev doc document
	autocmd Filetype typescript,javascript iabbrev gebi getElementById
	autocmd Filetype typescript,javascript iabbrev gebc getElementsByClassName
	autocmd Filetype typescript,javascript iabbrev gebt getElementsByTagName
	autocmd Filetype typescript,javascript iabbrev ce createElement
	autocmd Filetype typescript,javascript iabbrev cdf createDocumentFragment
	autocmd Filetype typescript,javascript iabbrev ac appendChild

augroup end


"----------------------------------------------------------
"
" Commands for editing js, html, and css
"
"----------------------------------------------------------
let g:syntastic_javascript_checkers = ['jshint'] "Use JSHint for javascript
" let g:syntastic_typescript_checkers = ['tslint'] "Use JSHint for javascript
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_stl_format = '[%e errors - %w warnings]'
"Don't show list when errors. Hide list when no errors
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1
"Check on open.
let g:syntastic_check_on_open = 1
"Don't check on close
let g:syntastic_check_on_wq = 0
"Aggregate errors from all checkers
let g:syntastic_aggregate_errors = 1
"Make the location list 5 rows tall
let g:syntastic_loc_list_height = 5
"Show location list
nnoremap <leader>c :Errors<cr>
nnoremap <leader>C :lclose<cr>
"Go to next error
nnoremap <leader>. :lnext<cr>
nnoremap <leader>> :lnext<cr>
"Go to previous error
nnoremap <leader>, :lprevious<cr>
nnoremap <leader>< :lprevious<cr>

let g:EasyMotion_do_mapping=0
map <leader><leader> <Plug>(easymotion-s2)
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)
map <leader>n <Plug>(easymotion-n)
map <leader>N <Plug>(easymotion-N)
nmap <Leader>; <Plug>(easymotion-next)
nmap <Leader>, <Plug>(easymotion-prev)

map <leader>w <Plug>(easymotion-w)
map <leader>e <Plug>(easymotion-e)
map <leader>b <Plug>(easymotion-b)

map <leader>j <Plug>(easymotion-sol-j)
map <leader>k <Plug>(easymotion-sol-k)

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second Special

let g:EasyMotion_startofline=0
let g:EasyMotion_smartcase=1
let g:EasyMotion_use_upper=1
let g:EasyMotion_enter_jump_first = 1

if !exists("g:ycm_semantic_triggers")
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-;>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
