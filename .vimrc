let mapleader = "\<Space>"
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                       " required

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" set the runtime path to include Vundle and initialize

set updatetime=200
let g:NERDTreeWinPos = "right"
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'
Plugin 'jreybert/vimagit'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'ap/vim-css-color'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'preservim/nerdtree'
Plugin 'mattn/webapi-vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
Plugin 'morhetz/gruvbox'
Plugin 'drewtempelmeyer/palenight.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'KabbAmine/vCoolor.vim'
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"thx brainplot https://github.com/brainplot/nvim/blob/master/init.vim#L154,L203
function! s:clean_up_whitespaces()
    let cursorpos = getcurpos()
    silent! %s/\_s*\%$//
    silent! %s/\s\+$//
    call setpos('.', cursorpos)
endfunction
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
filetype plugin on

"vim formatting
syntax on
set number
let java_highlight_functions = 1
set path=.,,**
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
set autoindent
let g:ycm_clangd_binary_path = "/usr/bin/clangd-9"
set mouse=a
syntax on
set number relativenumber
set nu rnu

"remaps
nnoremap <Leader>jcomp :! javac %<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>^ww
nnoremap <Leader>w <C-w>w
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :YcmCompleter<Space>GoTo<CR>
nnoremap <Leader>d <C-o>
nnoremap <Leader>r :YcmCompleter<Space>FixIt<CR>
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>cn :YcmCompleter<Space>RefactorRename<Space>
nnoremap <Leader>t gt
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <Leader><Tab> :bnext<CR>
nnoremap <Leader>rw :call s:clean_up_whitespaces()<CR>
set termguicolors
let g:gruvbox_italic = 1
set background=dark
colorscheme gruvbox 
let g:lightline = { 'colorscheme': 'palenight' }
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_number_column = 'bg2'
"let g:gruvbox_improved_strings = 1
"let g:gruvbox_invert_tabline = 0 
set laststatus=2
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198
">
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
  "  https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
  "  >
  "  "Based on Vim patch 7.4.1770 (`guicolors` option) <
  "  https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
  "  >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
    endif
let g:airline_theme = "gruvbox"
"let g:airline_statusline_ontop=1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_statusline_ontop=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ':)'
let g:airline_powerline_fonts = 1
nmap <F8> :TagbarToggle<CR>
function! s:tagbar_integration()
endfunction
