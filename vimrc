"Vim ttconfiguration file

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tpope/vim-commentary'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer',
        \ 'unix'    : './install.sh --clang-completer',
        \ 'windows' : './install.sh --clang-completer',
        \ 'cygwin'  : './install.sh --clang-completer'
        \ }
     \ }
NeoBundle 'gregsexton/gitv'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'elzr/vim-json'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'keith/tmux.vim'
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'othree/html5.vim.git'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'tpope/vim-vinegar.git'
NeoBundle 'garbas/vim-snipmate.git'
NeoBundle 'honza/vim-snippets.git'
NeoBundle 'MarcWeber/vim-addon-mw-utils.git'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'tomtom/tlib_vim.git'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'PotatoesMaster/i3-vim-syntax.git'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Colorizer'
NeoBundle 'ScrollColors'
NeoBundle 'KabbAmine/zeavim.vim'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'alfredodeza/pytest.vim'
" Colorschemes
NeoBundle 'morhetz/gruvbox'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'NLKNguyen/papercolor-theme'
NeoBundle 'chriskempson/base16-vim'
" Misc
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 't0mab/pydiploy-vim'
NeoBundle 'klen/python-mode'
NeoBundle 'fisadev/vim-isort'
NeoBundle 'xolox/vim-notes'
NeoBundle 'xolox/vim-misc'
" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Encoding UTF8
set encoding=utf-8

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Don’t show the intro message when starting Vim
set shortmess=atI

set dictionary=/usr/share/dict/words

" Show partially typed commands at the bottom
set showcmd

" Buffers
let mapleader = ','
nnoremap <Leader><Leader> :bnext<CR>
nnoremap ;; :bprevious<CR>

" Backspace
set backspace=indent,eol,start

" Auto indent
set autoindent

" tab management
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set scrolloff=999

" Enhance command-line completion
set wildmenu

" Settings for ctrlp
let g:ctrlp_max_height = 30

" Ignore some files
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.swc,*.bak,_build/,.coverage/

" Indicates a fast terminal connection
set ttyfast

" Autodetect FileType
filetype on
filetype plugin indent on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" Highlight matching brackets
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

syntax on
set t_Co=256
let g:airline_powerline_fonts=1
let g:loaded_autocomplete=1
color wombat256mod

" New tab on CTRL+T
map <C-t> :tabnew<CR>

" Js autocomplete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" Html autocomplete
au FileType html set omnifunc=htmlcomplete#CompleteTags
" Css autocomplete
au FileType css set omnifunc=csscomplete#CompleteCSS
" Python autocomplete
au FileType python set omnifunc=pythoncomplete#Complete

" Python code line max size
autocmd Filetype python set textwidth=79
autocmd Filetype python set cc=+1

" Completion on ctrl+space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Remove all blank on all end line
"autocmd BufWrite *.py silent! %s/[\r \t]\+$//

"  F5 -> launch python script
map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>

" Django autocomplete
function! SetAutoDjangoCompletion()
    let l:tmpPath = split($PWD, '/')
    let l:djangoVar = tmpPath[len(tmpPath)-1].'.settings'
    let $DJANGO_SETTINGS_MODULE=djangoVar
    echo 'Activate Django autocomplete with : '.djangoVar
        return 1
endfunction
map <F9> :call SetAutoDjangoCompletion()<CR>

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

" Virtual env library completion
py << EOF
import os.path
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Template for new python file
autocmd BufNewFile *.py,*.pyw 0read ~/.vim/templates/python.txt

" Python unit test
nmap <silent><Leader>ptf <Esc>:Pytest file<CR>
nmap <silent><Leader>ptc <Esc>:Pytest class<CR>
nmap <silent><Leader>ptm <Esc>:Pytest method<CR>

" Fugitive bar
set laststatus=2

" Function to show msg in inverse mode
function! s:DisplayStatus(msg)
    echohl Todo
    echo a:msg
    echohl None
endfunction

" mouse management env var
let s:mouseActivation = 1

" Toggle mouse management
function! ToggleMouseActivation()
    if (s:mouseActivation)
        let s:mouseActivation = 0
        set mouse=c
        set paste
        set bs=2
        call s:DisplayStatus('mouse [off]')
    else
        let s:mouseActivation = 1
        set mouse=a
        set nopaste
        set bs=2
        call s:DisplayStatus('mouse [on]')
    endif
endfunction

" Activate mouse on startup
set mouse=a
set nopaste
set bs=2


" Clean files:
"   - swap tab to space
"   - remove ^M
function! CleanCode()
    %retab
    %s///g
    call s:DisplayStatus('CleanCode done !')
endfunction


" gui font
if has('gui_running')
    set guifont=Monospace\ 12
    colorscheme delek
endif

" Colorscheme settings
"if has("unix")
"  let s:uname = system("uname")
"  if s:uname == "Darwin\n"
"    " Settings for iTerm2 on OS X
"    set background=dark
"    let base16colorspace=256
"    colorscheme base16-ocean
"  else
"    " Settings for Terminator on Linux
"    let g:molokai_original=1
"    let g:rehash256=1
"    colorscheme molokai
"    "Transparent background
"    hi Normal guibg=NONE ctermbg=NONE
"  endif
"endif

"airline
let g:airline_powerline_fonts = 1
set t_Co=256
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Enhance search
map * <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '/' . expand('<cWORD>') . '/'<CR>
map ù <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '?' . expand('<cWORD>') . '?'<CR>

" sudo write
ca w!! w !sudo tee >/dev/null "%"

" case-insensitive search
set ignorecase smartcase

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Persistent Undo, Vim remembers everything even after the file is closed.
set undofile
set undolevels=500
set undoreload=500

" INDENTING
" autoindent = same as previous line
" smartindent = tries to understand C
" cindent = smarter
"Set F2 to disable autoindenting if pasting into terminal in X (aka don't mess with my indents)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" set visual bell
set vb

" visible white space
set listchars=tab:>-,trail:.,eol:$

"set ai                  " auto indenting
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
set hlsearch            " highlight the last searched term
set matchpairs+=<:>     "Allow % to bounce between angles too

" Toggle line numbers and fold column for easy copying
nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>

" Save all temporary files in a central directory. Very useful.
set backup
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
set undodir=~/.vim-tmp/undo

" Fix filetype for Django template files
autocmd BufNewFile,BufRead *.html set filetype=htmldjango.html

" Fix filetype for CoffeeScript files
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Proper indentation for HTML
autocmd BufNewFile,BufRead *.coffee set tabstop=2
autocmd BufNewFile,BufRead *.coffee set softtabstop=2
autocmd BufNewFile,BufRead *.coffee set shiftwidth=2
autocmd BufNewFile,BufRead *.coffee set expandtab

" Automatically run CoffeeCompile watch vertical on CoffeeScript files
"autocmd BufNewFile,BufRead *.coffee :CoffeeCompile watch vertical

" Proper indentation for HTML
autocmd BufNewFile,BufRead *.html set tabstop=2
autocmd BufNewFile,BufRead *.html set softtabstop=2
autocmd BufNewFile,BufRead *.html set shiftwidth=2
autocmd BufNewFile,BufRead *.html set expandtab

" Proper indentation for Shell scripts
autocmd FileType sh set tabstop=4
autocmd FileType sh set softtabstop=4
autocmd FileType sh set shiftwidth=4
autocmd FileType sh set expandtab

" Proper indentation for Python
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set expandtab

" Mutt
au BufRead ~/.config/mutt/tmp/mutt-* set tw=72


" Needs to set term when running tmux
if exists('$TMUX')
  set term=screen-256color
endif

" On iterm fix update cursor
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Auto move to end of text pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" enter = end of file
nnoremap <CR> G

" backspace = beginning of file
nnoremap <BS> gg

" bad keystroke 
map q: :q

" fast tty
set ttyfast

" vim-airline
let g:airline_theme='wombat'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
set rtp+=~/.vim/airline
set completeopt-=preview
set laststatus=2
set noshowmode
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts=1

" Forces *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Wrap text only in markdown files
autocmd BufNewFile,BufRead *.md setlocal wrap
autocmd FileType markdown setlocal wrap
set linebreak " Do not amputate words

" Underline current line
nnoremap <Leader>u :Underline<CR>

" Copy/paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>yy "+yy
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Toggle/untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
noremap <space> /
noremap <c-space> ?

" Pipe buffer content in system clipboard
noremap <leader>c :w !pbcopy<CR>

function! s:Underline(chars)
  let chars = empty(a:chars) ? '-' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" spellchecker
highlight SpellBad term=underline cterm=underline ctermbg=Black
set spelllang=fr
autocmd FileType mail set spell

"Template Vars
let g:username = 'T0ma'
let g:email = 'baguet@unistra.fr'
let g:licence = 'Beerware'

"Git commit msg
autocmd Filetype gitcommit setlocal spell textwidth=72

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/vim-yaml/after/syntax/yaml.vim

"Clean code with F3
map <F3> <Esc>:call CleanCode()<CR>

" Easymotion config

map <Leader> <Plug>(easymotion-prefix)
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" Keep cursor column when JK motion
let g:EasyMotion_startofline = 0 

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
" Remember info about open buffers on close
set viminfo^=%

" Use python isort for module import sorting 
" let g:vim_isort_map = '<C-i>'

" Notes plugin path
let g:notes_directories = ['~/Dropbox/Notes']

" Pymode
let g:pymode_trim_whitespaces = 1
let g:pymode_folding = 0 

