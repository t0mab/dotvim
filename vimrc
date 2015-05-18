"Vim configuration file

"load pathogen
execute pathogen#infect()

"Nerdtree on CTRL+N
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"no vi compatibility
set nocompatible

" load indent plugin
if has("autocmd")
 filetype plugin on
 filetype plugin indent on
endif

" syntax options
syntax on
set hlsearch
set incsearch
set ignorecase
set showmatch
set noswapfile
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set backspace=indent,eol,start
set history=100
set ruler
set showcmd
set number
set nospell
colorscheme delek

"new tab on CTRL+T
map <C-t> :tabnew<CR>

"Completion javascript
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"Completion html
au FileType html set omnifunc=htmlcomplete#CompleteTags
"Completion css
au FileType css set omnifunc=csscomplete#CompleteCSS
"Completion python with jedi-vim
au FileType python set omnifunc=pythoncomplete#Complete

" Longueur maximale des lignes
" Pour Python
autocmd Filetype python set textwidth=79
autocmd Filetype python set cc=+1

"Completion on ctrl+space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Remove all blank on all end line
"autocmd BufWrite *.py silent! %s/[\r \t]\+$//

" lauch pyton script with F5
map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>

" Django completion
function! SetAutoDjangoCompletion()
    let l:tmpPath = split($PWD, '/')
    let l:djangoVar = tmpPath[len(tmpPath)-1].'.settings'
    let $DJANGO_SETTINGS_MODULE=djangoVar
    echo 'Activation de la complétion Django avec : '.djangoVar
        return 1
endfunction
map <F9> :call SetAutoDjangoCompletion()<CR>


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

" template for new python file
autocmd BufNewFile *.py,*.pyw 0read ~/.vim/templates/python.txt

" gui font
if has('gui_running')
    set guifont=Monospace\ 12
    colorscheme desert
endif

"airline
let g:airline_powerline_fonts = 1
set t_Co=256
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

"jedi
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
" sudo write
ca w!! w !sudo tee >/dev/null "%"

" case-insensitive search
set ignorecase smartcase

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
filetype plugin on      " use the file type plugins

" Toggle line numbers and fold column for easy copying
nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>

" Save all temporary files in a central directory. Very useful.
set backup
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

" Proper indentation for HTML
autocmd BufNewFile,BufRead *.coffee set tabstop=2
autocmd BufNewFile,BufRead *.coffee set softtabstop=2
autocmd BufNewFile,BufRead *.coffee set shiftwidth=2
autocmd BufNewFile,BufRead *.coffee set expandtab

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
