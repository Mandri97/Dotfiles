set nocompatible

" Vundle
" set the runtime path to include Vundle and initialize
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim " Load plugin
call neobundle#begin(expand('~/.config/nvim/bundle/'))
  NeoBundle 'jiangmiao/auto-pairs'
  NeoBundle 'Shougo/deoplete.nvim'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'vim-scripts/SyntaxComplete'
  NeoBundle 'vimwiki/vimwiki'
  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'christoomey/vim-tmux-navigator'
  NeoBundle 'mhartington/oceanic-next'
  NeoBundle 'junegunn/fzf'
call neobundle#end()

" Airline
" Airline configuration
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = ''
  let g:airline#extensions#tabline#left_setp = ' '
  let g:airline#extensions#tabline#let_alt_set = '|'
  let g:airline#extensions#tabline#formatter = 'default'
  let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'error']
    \ ]
  let g:airline_theme = 'oceanicnext'
  let g:airline_powerline_fonts = 1
  
  set termencoding=utf-8
  set encoding=utf-8
  set laststatus=2
  set t_Co=256
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

 " NERDTree configuration
  nmap <silent> <F2> :NERDTreeToggle <CR>

" Use deoplete
  let g:deoplete#enable_at_startup = 1

" Vim-instant-markdown configuration
  let g:instant_markdown_slow = 1
  let g:vim_markdown_folding_disabled = 0
  let g:instant_markdown_autostart = 0
  let g:vimwiki_ext2syntax = {'.md': 'markdown',
                  \ '.mkd': 'markdown',
                  \ '.wiki': 'media'}
  let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax':'markdown', 'ext':'.md'}]

" Vim-tmux-navigator configuration
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent>  <ctrl-h> :TmuxNavigateLeft<cr>
  nnoremap <silent>  <ctrl-j> :TmuxNavigateDown<cr>
  nnoremap <silent>  <ctrl-k> :TmuxNavigateUp<cr>
  nnoremap <silent>  <ctrl-l> :TmuxNavigateRight<cr>
  nnoremap <silent>  <ctrl-\> :TmuxNavigatePrevious<cr>
  let g:tmux_navigator_save_on_switch = 2

 colorscheme pablo

" Evaluating Python code, this also makes startup faster
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'

  " Disable python 2 support
  let g:loaded_python_provider = 1
  
" CtrlP configuration
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.rar
 let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

 let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
 set runtimepath^=~/.vim/bundle/ctrlp.vim
 let g:ctrlp_match_window_bottom = 0

" General settinngs
  filetype on
  filetype plugin on
  filetype plugin indent on
  syntax enable
  set relativenumber

" Highlight and case insesitive search
  set hlsearch			
  set ignorecase	

  "colorscheme base16-default-dark
  set cursorline
  highlight Cursorline cterm=NONE

  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=ucs-bom,utf-8,latin1
  endif

  set number 
  set noshowmode		" powerline does
  set showcmd

" Unmap the arrow keys
  no  <left>  <Nop>
  no  <down>  <Nop>
  no  <up>    <Nop>
  no  <right> <Nop>
  ino <left>  <Nop>
  ino <right> <Nop>

" File
  set wildignore=*.o,*~,*.pyc 	" Ignore compiled file

" Tabstop
  set autoindent
  set smartindent
  set tabstop=8
  set softtabstop=4
  set shiftwidth=4
  set noexpandtab
 
" Enable italic
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"

" Backup files
  set nobackup
  set nowb
  set noswapfile

" Title
  set title
  set hidden

  set lazyredraw

" Command line
  set wildmenu
  set bs=indent,eol,start	" allow backspacing over everything in insert mode
  set viminfo='20,\"50		" read/write a .viminfo file, don't store more
				" than 50 lines of registers
  set history=100		" keep 50 lines of command line history
  set ruler			" show the cursor position all the time

" Fortran
  let fortran_free_source=1
  let fortran_have_tabs=1

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" Configuration of SyntaxComplete
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
	\ if &omnifunc == "" |
	\	setlocal omnifunc=syntaxcomplete#Complete |
        \  endif
endif
