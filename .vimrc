let perl_extended_vars=1
let perl_include_pod=1
syntax on

filetype plugin indent on

if !has('win32') && !has('win64')
  set shell=/bin/bash
endif

" Bootstrap vundle
"if !isdirectory(expand("~/.vim/bundle/vundle"))
    "call mkdir(expand("~/.vim/bundle"), "p")
    "!git clone https://github.com/gmarik/vundle.git ~/.vim/bundle
    "let s:bootstrap=1
"endif

if v:version >= 700
  " configure vundle
  set rtp+=~/.vim/bundle/vundle/
  call vundle#begin()

  if v:version >= 701
    Plugin 'majutsushi/tagbar'
  endif

  if v:version >= 702
    Plugin 'bling/vim-airline'
  endif

  if v:version >= 703 && has("lua")
    Plugin 'Shougo/neocomplete.vim'
  elseif v:version >= 702
    Plugin 'Shougo/neocomplcache'
  endif

  if v:version >= 703 && has('python')
    Plugin 'Gundo'
  endif

  " let Vundle manage Vundle
  " required!
  Plugin 'gmarik/vundle'
  "Plugin 'fholgado/minibufexpl.vim'

  Plugin 'tpope/vim-surround'
  Plugin 'mileszs/ack.vim'
  Plugin 'bogado/file-line'
  "Plugin 'scrooloose/nerdtree'
  Plugin 'danro/rename.vim'
  Plugin 'closetag.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'godlygeek/tabular'

  Plugin 'OmniCppComplete'

  Plugin 'scrooloose/nerdcommenter'
  Plugin 'ntpeters/vim-better-whitespace'

  Plugin 'airblade/vim-gitgutter'

  Plugin 'tmhedberg/matchit'
  "Plugin 'Townk/vim-autoclose'
  "Plugin 'sickill/vim-pasta'
  Plugin 'kien/ctrlp.vim'
  Plugin 'flazz/vim-colorschemes'

  Plugin 'vasconcelloslf/vim-interestingwords'

  " Syntax Highlighting Plugins
  Plugin 'pangloss/vim-javascript'
  Plugin 'groenewege/vim-less'
  Plugin 'octol/vim-cpp-enhanced-highlight'
  Plugin 'Glench/Vim-Jinja2-Syntax'
  Plugin 'puppetlabs/puppet-syntax-vim'
  Plugin 'derekwyatt/vim-scala'
  Plugin 'Flex-4'

  " Perl related plugins
  "Plugin 'vim-perl/vim-perl'
  "Plugin 'perl-support.vim'
  "Plugin 'perlhelp.vim'

  "Plugin 'SirVer/ultisnips'

  call vundle#end()
endif

if exists("s:bootstrap") && s:bootstrap
    unlet s:bootstrap
    PluginInstall
endif

if has('gui_running')
  set lines=80
  set columns=150
  set go-=T

  if has('win32') || has('win64')
    set guifont=Inconsolata_for_Powerline:h9:cANSI,Consolas
  else
    set guifont=Inconsolata\ Medium\ 9,Consolas
  endif

endif

if $TERM =~ "256color" || has('gui_running')
  "colorscheme xoria256
  "colorscheme molokai
  colorscheme Tomorrow-Night
else
  color elflord
endif

" Turn on syntax highlighting for actionscript and mxml
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml

if has('persistent_undo')
  set undodir=~/.vim/undodir
  set undofile
endif

" Backups
"set backupdir=~/.vim/tmp/backup// " backups
"set directory=~/.vim/tmp/swap//   " swap files
"set backup                        " enable backups

" Save when losing focus
" au FocusLost * :wa

" make fullscreen actually fullscreen in macvim
if has("gui_macvim")
   set fuoptions=maxvert,maxhorz
endif

set autochdir

set backspace=2

" Speed up long line processing by disabling syntax highlighting on long lines
set synmaxcol=250

" Display the line and column numbers of the current cursor position
set ruler

set hidden

set visualbell

" automatically show matching brackets. works like it does in bbedit.
set showmatch

" show line numbers
set nu

" Ignore case while searching.
set ignorecase

" Use intelligent case while searching.
" If search string contains an upper case letter, disable ignorecase.
set smartcase

set lazyredraw

" Insert spaces for tabs according to shiftwidth.
set smarttab
" Use indent from current line when starting a new one.
"set autoindent
filetype plugin indent on
" Use smart indenting when starting a new line.
"set smartindent

" Expand tabs to spaces.
set expandtab
" Number of spaces that a tab counts for.
set tabstop=8
" Number of spaces to use for each step of indent.
set shiftwidth=2

set colorcolumn=80

" Disable expand tab when working with Makefiles
autocmd FileType make setlocal noexpandtab

" Close the current buffer without closing the window
command! Bd bp | sp | bn | bd

" Indicates a fast terminal connection.
set ttyfast

set scrolloff=5

set wildignore+=*/tmp/*,*.so,*.swp,*.pyc,*.o,*.a,*.png,*.jpg,*.gif

"autocmd BufEnter *.cc,*.hh,*.c,*.cpp,*.h nested TagbarOpen

if has('win32') || has('win64')
  let g:netrw_cygwin = 0
  let g:netrw_ssh_cmd  = '"C:\Program Files\PuTTY\plink.exe" -i \%HOMEPATH\%/.ssh/etrochim.ppk -T -ssh'
  let g:netrw_scp_cmd  = '"C:\Program Files\PuTTY\pscp.exe" -i \%HOMEPATH\%/.ssh/etrochim.ppk -q -scp'
  let g:netrw_sftp_cmd = '"C:\Program Files\PuTTY\pscp.exe" -i \%HOMEPATH\%/.ssh/etrochim.ppk -q -sftp'
  let g:netrw_list_cmd = '"C:\Program Files\PuTTY\plink.exe" -i \%HOMEPATH\%/.ssh/etrochim.ppk HOSTNAME ls -Fa'
endif

" Mouse usage
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
  " Enable the popup menu.
  set mousem=popup
endif

" Enables wildmenu tab completion.
set wildmenu
" Type of wildmenu.
set wildmode=longest:full,list:full

" Move between splits using Ctrl+hjkl (instead of Ctrl+W, hjkl)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" have <esc> remove search highlighting
" nnoremap <silent> <esc> :noh<return><esc>

" Use H to go to the beginning of a line and L to go to the end of a line
map H ^
map L $

" Use \s to find and replace
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Look for a tags file in the the current directory or in one of the parent
" directories
set tags=./tags;

" C-\ Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" A-] Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"              Function Key Mappings                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"map <F2> :set nosmarttab noexpandtab tabstop=4 shiftwidth=4<CR>
"map <F3> :set smarttab expandtab tabstop=2 shiftwidth=2<CR>
map <F4> :set list!<CR>
map <F5> :NERDTreeToggle<CR>
" Open tagbar subwindow with F6 key
map <F6> :TagbarToggle<cr>

" Switch tabs with Ctrl-LeftArrow and Ctrl-RightArrow
"noremap <C-Left> <Esc>:tabprev<CR>
"noremap <C-Right> <Esc>:tabnext<CR>

function! GuiTabLabel()
    " add the tab number
"    let label = '['.tabpagenr()
    let label = ''

    " modified since the last save?
    let buflist = tabpagebuflist(v:lnum)
    for bufnr in buflist
      if getbufvar(bufnr, '&modified')
        let label .= '*'
        break
      endif
    endfor

    " count number of open windows in the tab
"    let wincount = tabpagewinnr(v:lnum, '$')
"    if wincount > 1
"       let label .= ', '.wincount
"    endif
"    let label .= '] '

    " add the file name without path information
    let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
    let label .= fnamemodify(n, ':t')

    return label
endfunction

set guitablabel=%{GuiTabLabel()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 Plugin Configuration                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable Neocomplcache
"let g:neocomplcache_enable_at_startup = 1

" Enable Neocomplete
let g:neocomplete#enable_at_startup = 1

" MiniBufExpl
let g:miniBufExplUseSingleClick = 1

" NERDTree
let NERDTreeMouseMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeRespectWildIgnore=1

" Ctrl-P
let g:ctrlp_cmd = 'CtrlPMixed'

" GitGutter
let g:gitgutter_sign_column_always = 1

" Ack.vim
" Use ag instead of ack, if available
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Airline
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:airline#extensions#tabline#enabled = 1 " Show the bufferlist
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamemod = ':t' " Just show the filename
let g:airline#extensions#whitespace#enabled = 0
if has('gui_running')
  let g:airline_powerline_fonts=1
endif
set ttimeoutlen=50

" Syntastic
let g:syntastic_javascript_checkers = ["jshint"]

function! s:NerdTreeGo(package)
  let path = system("goFind " . a:package)
  execute "NERDTree " . path
endfunction
command! -nargs=1 Go call s:NerdTreeGo(<f-args>)

function! s:SwitchToHeaderOrSource()
  let file = expand("%:t:r")
  if expand("%:e") == "cc"
    execute "tag " . file . ".hh"
  else
    execute "tag " . file . ".cc"
  endif
endfunction
command! Switch call s:SwitchToHeaderOrSource()
map <F2> :Switch<CR>
