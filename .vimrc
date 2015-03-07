"Don't be old
set nocompatible

"Space is my leader
let mapleader = " "

"Filetype detection, plugins, and indentation are on
filetype on
filetype plugin on
filetype indent on

"Let buffers be hidden
set hidden

"Smart searching
set smartcase

"----------------------------------------------------------
"Vundle keeps packages together
"----------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'gmarik/Vundle.vim'

	"Look 'n feel
	Plugin 'altercation/vim-colors-solarized'

	"Autocomplete
	Plugin 'kien/ctrlp.vim'
	Plugin 'SirVer/ultisnips'

	"Coding
	Plugin 'tpope/vim-commentary'
	Plugin 'scrooloose/syntastic'


call vundle#end()  

"----------------------------------------------------------
"Let's set up how the UI should look
"----------------------------------------------------------
syntax on

set number
set visualbell

"Tabs are 4 spaces, not expanded
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set linespace=2
set background=light
colorscheme solarized

" if has("gui_running")
" 	"Use dark solarized and make it slightly bigger
" 	set background=dark
" 	colorscheme solarized
" 	set guifont=Monaco:h13

" 	"Turn off GUI features
" 	set guioptions-=m  "remove menu bar
" 	set guioptions-=T  "remove toolbar
" 	set guioptions-=r  "remove right-hand scroll bar
" 	set guioptions-=L  "remove left-hand scroll bar
" endif

"Show the 80th column
set colorcolumn=80
"Status line is Modified, Trailing Filename, Buffer Number
set statusline=%M\ %-t\ (%n)
"Always show status
set laststatus=2

augroup web-dev-files
	autocmd Filetype javascript,html,css set tabstop=2
	autocmd Filetype javascript,html,css set softtabstop=2
	autocmd Filetype javascript,html,css set shiftwidth=2
	autocmd Filetype javascript,html,css set expandtab

	autocmd Filetype javascript iabbrev fu function
	autocmd Filetype javascript iabbrev function fu

	autocmd Filetype javascript iabbrev ret return
	autocmd Filetype javascript iabbrev return ret

	autocmd Filetype javascript iabbrev prot prototype
	autocmd Filetype javascript iabbrev prototype prot
augroup end

"----------------------------------------------------------
"Programming Abbreviations
"----------------------------------------------------------
augroup coding_abbreviations
	autocmd Filetype cs iabbrev pub public
	autocmd Filetype cs iabbrev public pub

	autocmd Filetype cs iabbrev pri private
	autocmd Filetype cs iabbrev private pri

	autocmd Filetype cs iabbrev pro protected
	autocmd Filetype cs iabbrev protected pro

	autocmd Filetype cs iabbrev ovr override
	autocmd Filetype cs iabbrev override ovr

	autocmd Filetype cs iabbrev abst abstract
	autocmd Filetype cs iabbrev abstract abst

	autocmd Filetype cs iabbrev intf interface
	autocmd Filetype cs iabbrev private intf

	autocmd Filetype cs iabbrev ret return
	autocmd Filetype cs iabbrev return ret

	autocmd Filetype cs iabbrev MB MonoBehaviour
	autocmd Filetype cs iabbrev MonoBehaviour MB

	autocmd FileType cs iabbrev GO GameObject
	autocmd FileType cs iabbrev GameObject GO

	autocmd FileType cs iabbrev gO gameObject
	autocmd FileType cs iabbrev gameObject gO

	autocmd FileType cs iabbrev go gameObject
	autocmd FileType cs iabbrev gameObject gO

	autocmd FileType cs iabbrev Tran Transform
	autocmd FileType cs iabbrev Transform Trans

	autocmd filetype cs iabbrev tran transform
	autocmd filetype cs iabbrev transform trans

	autocmd FileType cs iabbrev Box BoxCollider2D
	autocmd FileType cs iabbrev BoxCollider2D box

augroup end

let g:syntastic_javascript_checkers = ['jshint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
