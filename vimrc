set nocompatible

" Vundle
" set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim 
" Load plugin
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'vimwiki/vimwiki'
  Plugin 'chriskempson/base16-vim'
  Plugin 'mhartington/oceanic-next'
  Plugin 'scrooloose/nerdtree'
call vundle#end()

" Airline
" Airline configuration
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = ''
  let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'error' ]
    \ ]
  let g:airline_theme = 'oceanicnext'
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1

" guifont
  set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 7.5
  set guifont+=PowerlineSymbols\ 7
  set guioptions=agimrLtT

" Powerline
" Enable powerline in airline
  let g:airline_powerline_fonts = 1
  let g:Powerline_symbols = 'fancy'

" Enable powerline
  "set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
  "set t_Co=256
  "set term=xterm-256color
  if(has("termguicolors"))
      set termguicolors
  endif
  colorscheme OceanicNext

  set termencoding=utf-8
  set encoding=utf-8
  set laststatus=2

 " NERDTree configuration
  nmap <silent> <F2> :NERDTreeToggle <CR>

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

" VimCompleteMe
 let b:vcm_tab_complete = 'dict'

" General settinngs
  filetype on
  filetype plugin on
  filetype plugin indent on
  syntax on
  set relativenumber

" Enable italic
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"

" Highlight and case insesitive search
  set hlsearch			
  set ignorecase	

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
  set history=50		" keep 50 lines of command line history
  set ruler			" show the cursor position all the time

" Fortran
  let fortran_free_source=1
  let fortran_have_tabs=1

" Persistent vim folder
  augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
  augroup END

  " Cursor
  set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkon0
  let &guicursor = &guicursor . ",a:blinkon0"
  set cursorline
  highlight Cursorline cterm=NONE
