" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader=","
" let g:mapleader=","

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" ----------------------------------------
" Vundle
" ----------------------------------------
set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------
" Bundle 'tpope/vim-sensible'
" Navigation
Bundle 'kien/ctrlp.vim'
" UI Additions
" Bundle 'mutewinter/vim-indent-guides'
" Bundle 'Lokaltog/powerline'
" Bundle 'scrooloose/nerdtree'
" Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'twerth/ir_black'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'tomasr/molokai'
" Bundle 'noahfrederick/Hemisu'
" Bundle 'jpo/vim-railscasts-theme'
" Bundle 'jgdavey/vim-railscasts'
" Bundle 'croaker/mustang-vim'
" Bundle 'cschlueter/vim-clouds'
Bundle 'johnantoni/grb256'
" Bundle 'tpope/vim-vividchalk'
" Bundle 'vim-scripts/Mustang2'
" Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'skammer/vim-css-color'
" Commands
"Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-sleuth'
" Automatic Helpers
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
" Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
" Bundle 'HTML-AutoCloseTag'
" Bundle 'Townk/vim-autoclose'
" Bundle 'sickill/vim-pasta'
" Language Additions
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
" Bundle 'itspriddle/vim-jquery'
Bundle 'othree/javascript-libraries-syntax.vim'
"   Other Languages
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'spf13/PIV'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'sunaku/vim-ruby-minitest'
Bundle 'matchit.zip'
Bundle 'corntrace/vjde'
Bundle 'mattn/zencoding-vim'
" Bundle 'godlygeek/tabular'

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  " Custom Menlo font for Powerline
  " From: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
  "set guifont=Menlo\ for\ Powerline:h14
  " set guifont=Source\ Code\ Pro:h14
  set anti enc=utf-8 gfn=Source\ Code\ Pro:h14,Menlo:h14,Monaco:h14

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif

  " Use option (alt) as meta key.
  set macmeta
endif

" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" ---------------
" Color
" ---------------
if &t_Co >= 256 || has("gui_running")
  colorscheme grb256
else
  colorscheme ir_black
endif
set background=dark

" ---------------
" UI
" ---------------
set nonumber       " Line numbers on
set nowrap         " Line wrapping off
set cmdheight=2    " Make the command area two lines high
set nolist         " Display unprintable characters
set showbreak=↪
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently
endif
set cursorline
set showmode
set copyindent

" ---------------
" Behaviors
" ---------------
syntax enable
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set lazyredraw         " Don't update the display while executing macros
set pastetoggle=<F2>

" ---------------
" Text Format
" ---------------
set tabstop=2
set shiftwidth=2 " Tabs under smart indent
set cindent
set expandtab
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set display+=lastline
set encoding=utf-8

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

set autoread
set fileformats+=mac

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Trailing whitespace
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=4 " How many tenths of a second to blink
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight VCS conflict markers

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" ----------------------------------------
" Bindings
" ----------------------------------------

" Make line completion easier
" imap <C-l> <C-x><C-l>

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ---------------
" Neocachecompl
" ---------------
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup=1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_auto_completion_start_length = 3
" default # of completions is 100, that's crazy
let g:neocomplcache_max_list = 10

" This makes sure we use neocomplcache completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out
" let g:neocomplcache_force_overwrite_completefunc = 1

" Plugin key-mappings.
" imap <C-k>     <Plug>(neocomplcache_snippets_expand)
" smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Shift-Tab to cycle completions
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" ---------------
" NERDTree
" ---------------
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <F3> :NERDTreeToggle<CR>

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" ---------------
" ctrlp.vim
" ---------------
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:CommandTMaxHeight = 10

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" ----------------------------------------
" Functions
" ----------------------------------------
" Use CTRL-S for saving, also in Insert mode
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" ---------------
" Fix Trailing White Space
" ---------------
autocmd BufWritePre * :%s/\s\+$//e

" config javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery,underscore,angularjs'

" config for supertab + neocomplcache
" imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
" smap  <tab>  <right><plug>(neocomplcache_snippets_jump)
" inoremap <expr><c-e>     neocomplcache#complete_common_string()


" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
" set statusline=%<\ %F\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

set statusline=
set statusline+=%<%F\                                "File+path
set statusline+=%y\                                  "FileType
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%m%r%w
set statusline+=%{fugitive#statusline()}
set statusline+=%=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=col:%03c\                            "Colnr
set statusline+=%P\ \                      "Modified? Readonly? Top/bot.
