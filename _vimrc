set guifont=Consolas:h10

syntax on

set nowrapscan
set nowrap
set tabstop=4
set expandtab
set ruler
set shiftwidth=4

set lines=50 columns=160

colorscheme nuvola

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" sets leader to ','
let mapleader=","

set cino=(0
set cinkeys=0{,0},:,0#,!<Tab>,!^F
set backspace=indent,eol,start

" number of screen lines to keep above and below the cursor.
set scrolloff=10

" use confirm instead of aborting an action
set confirm

" current directory is always matching the content of the active window
set autochdir

" put swap files in /tmp
set swapfile
set dir=C:\\Temp

set backup
set backupdir=C:\\Temp\\vim_files

" read per-file custom settings
set modeline

" Start searching when you type the first character of the search string. As you
" type in more characters, the search is refined.
set incsearch

" Hilight searched words
set hlsearch

" Disable search highlight by hitting <CR>
nnoremap <CR> :noh<CR>^L

" However sometimes matching case is important. Usually this is with cases involving
" upper-case or mixed-case search strings. This command assumes that a search string
" is case-sensitive if it contains any upper-case characters:
set ignorecase
set smartcase

" ignore F1 key
map <F1> <Nop>

" map Delete key on dd
nmap <Del> dd

" disable Q (ex mode)
map Q <nop>

" disable Toolbar
set guioptions-=T

" copy to clipboard
set guioptions+=a

" mapping for select all, copy
nmap <c-a> ggVG
nmap <c-c> "+y

" yank and paste from the unnamed clipboard (no need to prepend "*)
set clipboard=unnamed

nnoremap N Nzz
nnoremap n nzz

set mouse=a

" toggle between mouse=a and mouse=n
nnoremap <leader>m :call ToggleMouseMode()<CR>
function! ToggleMouseMode()
  if &mouse == "n"
    set mouse=a
  else
    set mouse=n
  endif
endfunction

function! Search(buffers, pattern)
    call setqflist([])
    exe "silent! ".a:buffers." vimgrepadd /".a:pattern."/j %"
    exe "copen 20"
endfunction
command! -nargs=1 GB :call Search("bufdo", <q-args>) 
command! -nargs=1 GF :call Search("", <q-args>) 

au BufRead *.hs command! Make :!d:\ghc\ghc-6.4.2\bin\ghci.exe %:t
au BufRead *.py command! Make :!c:\python25\python %:t
