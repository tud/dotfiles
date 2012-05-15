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

" Navigation
Bundle 'kien/ctrlp.vim'
" UI Additions
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'henrik/vim-indexed-search'
"Bundle 'scrooloose/nerdtree'
"Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'twerth/ir_black'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'tomasr/molokai'
Bundle 'jpo/vim-railscasts-theme'
"Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'skammer/vim-css-color'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
" Automatic Helpers
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
"Bundle 'HTML-AutoCloseTag'
Bundle 'Townk/vim-autoclose'
Bundle 'sickill/vim-pasta'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Raimondi/delimitMate'
" Language Additions
"   Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
"   JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
"   Other Languages
"Bundle 'mutewinter/nginx.vim'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
"Bundle 'hallison/vim-markdown'
Bundle 'spf13/PIV'
Bundle 'othree/html5.vim'
" MatchIt
Bundle 'matchit.zip'

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let g:mapleader=","

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
  set guifont=Menlo\ for\ Powerline:h12

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
set background=dark
colorscheme ir_black

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set nonumber       " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set showcmd        " Display an incomplete command in the lower right corner of the Vim window
set encoding=utf-8
set nolist         " Display unprintable characters f12 - switches
"set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently
endif
set cursorline
set showmode
set showmatch
set copyindent

" ---------------
" Behaviors
" ---------------
syntax enable
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
set pastetoggle=<F2>

" ---------------
" Text Format
" ---------------
set tabstop=2
set shiftwidth=2 " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set backspace=indent,eol,start

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
set incsearch
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

" Better complete options to speed it up
set complete=.,w,b,u,U

" ----------------------------------------
" Bindings
" ----------------------------------------
" Fixes common typos
command W w
command Q q
map <F1> <Esc>
imap <F1> <Esc>

" Removes doc lookup binding because it's easy to fat finger
nmap K k
vmap K k

" Make line completion easier
imap <C-l> <C-x><C-l>

" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" Enable omni completion. (Ctrl-X Ctrl-O)
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 autocmd FileType c set omnifunc=ccomplete#Complete
 autocmd FileType java set omnifunc=javacomplete#Complete
 autocmd FileType php set omnifunc=phpcomplete#CompletePHP
 autocmd FileType css set omnifunc=csscomplete#CompleteCSS

 " use syntax complete if nothing else available
 if has("autocmd") && exists("+omnifunc")
   autocmd Filetype *
               \if &omnifunc == "" |
               \     setlocal omnifunc=syntaxcomplete#Complete |
               \endif
 endif

 set cot-=preview "disable doc preview in omnicomplete

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ---------------
" SuperTab
" ---------------
" Set these up for cross-buffer completion (something Neocachecompl has a hard
" time with)
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" ---------------
" Neocachecompl
" ---------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1 "Select the first entry automatically
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_cursor_hold_i_time=300
let g:neocomplcache_auto_completion_start_length=1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1

" default # of completions is 100, that's crazy
let g:neocomplcache_max_list = 10

" words less than 3 letters long aren't worth completing
let g:neocomplcache_auto_completion_start_length = 3

" This makes sure we use neocomplcache completefunc instead of 
" the one in rails.vim, otherwise this plugin will crap out
let g:neocomplcache_force_overwrite_completefunc = 1

" Tab / Shift-Tab to cycle completions
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Required to make neocomplcache_cursor_hold_i_time work
" See https://github.com/Shougo/neocomplcache/issues/140
let s:update_time_save = &updatetime
autocmd InsertEnter * call s:on_insert_enter()

function! s:on_insert_enter()
  if &updatetime > g:neocomplcache_cursor_hold_i_time
    let s:update_time_save = &updatetime
    let &updatetime = g:neocomplcache_cursor_hold_i_time
  endif
endfunction

autocmd InsertLeave * call s:on_insert_leave()

function! s:on_insert_leave()
  if &updatetime < s:update_time_save
    let &updatetime = s:update_time_save
  endif
endfunction

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
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" ---------------
" Syntastic
" ---------------
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"show the error list automatically
let g:syntastic_auto_loc_list=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"don't care about warnings
let g:syntastic_quiet_warnings=0

" Platform-specific config files
if has('win32') || has('win64')
  let g:syntastic_jsl_conf=$HOME.'/.vim/config/windows/syntastic/jsl.conf'
  let g:syntastic_disabled_filetypes=['sh'] " Disable .sh on Windows
endif

" ---------------
" NERDTree
" ---------------
map <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <leader>nn :NERDTreeMirrorToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" ---------------
" Fugitive
" ---------------
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gx :wincmd h<CR>:q<CR>

" ---------------
" delimitMate
" ---------------
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" ---------------
" ctrlp.vim
" ---------------
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:CommandTMaxHeight = 10

" When CtrlP is invoked, it automatically sets its local working directory according to this variable
" 0 - don’t manage working directory.
" 1 - the parent directory of the current file.
" 2 - the nearest ancestor that contains one of these directories or files: .git/ .hg/ .svn/ .bzr/ _darcs/
let g:ctrlp_working_path_mode = 2

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" ---------------
" Powerline
" ---------------
" Keep ^B from showing on Windows in Powerline
if has('win32') || has('win64')
  let g:Powerline_symbols = 'compatible'
elseif has('gui_macvim')
  let g:Powerline_symbols = 'fancy'
endif
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" ---------------
" EasyMotion
" ---------------
" This remaps easymotion to show us only the left
" hand home row keys as navigation options which 
" may mean more typing to get to a particular spot
" but it'll all be isolated to one area of the keyboard
"call EasyMotion#InitOptions({
"\   'leader_key'      : '<Leader><Leader>'
"\ , 'keys'            : 'fjdkslewio'
"\ , 'do_shade'        : 1
"\ , 'do_mapping'      : 1
"\ , 'grouping'        : 1
"\
"\ , 'hl_group_target' : 'Question'
"\ , 'hl_group_shade'  : 'EasyMotionShade'
"\ })

" Make EasyMotion more yellow, less red
"hi clear EasyMotionTarget
"hi! EasyMotionTarget guifg=yellow

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
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>
