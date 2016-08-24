python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup


set nocompatible              " be iMproved, required
" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtimeir	
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'
Plugin 'wsdjeg/vim-cheat'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/limelight.vim'
Plugin 'mileszs/ack.vim'

Plugin 'junegunn/vim-pseudocl'
Plugin 'junegunn/vim-fnr'
Plugin 'mhinz/vim-startify'
Plugin 'mhartington/oceanic-next'
Plugin 'scrooloose/nerdtree'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'tomtom/tcomment_vim'

"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set laststatus=2
filetype plugin indent on
set wildmenu
set relativenumber
"let g:airline_theme='badwolf'
syntax on
set showcmd
"set hlsearch
set ignorecase
set smartcase
set t_Co=256
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action
set ruler
set showtabline=2
let g:pymcd_powerline="py3"
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
map <F5> :setlocal spell! spelllang=en_us<CR>
"set spell spelllang=en_us
set foldcolumn=2
set foldmethod=marker
set foldlevelstart=0

colorscheme desert 

"Alt binds
imap jj <Esc>
nnoremap ; :
map <C-\> :NERDTreeToggle<CR>
"" Return to curser location
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
            " center buffer around cursor when opening files
autocmd BufRead * normal zz

" Mike-Hartington
 " Theme
syntax enable
"set t_Co=256
"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'
"set background=dark

"Devicons Refresh
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

""Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"vim:filetype=i3

map <F2> :mksession! ~/Documents/svim/vim_session <cr> " Quick write session with F2
map <F3> :source ~/Documents/svim/vim_session <cr>     " And load session with F3

"" Startify
" redir => test
  " silent echo 'screenfetch'
" redir END

" let g:startify_custom_header =
    " \ map(split(test), 'repeat(" ", 10) . v:val')

function! s:filter_header(lines) abort
        let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
        let centered_lines = map(copy(a:lines),
            \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
        return centered_lines
    endfunction
let g:startify_custom_header = s:filter_header(['$vim', '', ''])

