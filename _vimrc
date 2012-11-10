set guifont=Consolas:h10

syntax on

set nowrapscan
set nowrap
set tabstop=4
set expandtab
set ruler
set shiftwidth=4

set lines=50 columns=140

set wildmenu

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
set backupdir=C:\\Temp\\vim_files,c:\\Temp

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

" macro to separate function arguments at , and realign automatically
nmap <C-k> /,<Esc>li<CR><Esc>==:noh<CR>

" show tag list for word under cursor
nnoremap <Leader>t :ts <C-R><C-W><CR>

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

vnoremap (      :s/( /(/g<CR>,:s/ )/)/g<CR>
vnoremap )      :s/ )/)/g<CR>
nnoremap (      :s/( /(/g<CR>
nnoremap )      :s/ )/)/g<CR>
nnoremap _      :s/\(if\\|for\\|while\\|switch\)(/\1 (/g<CR>
nnoremap <C-S-P> :s/\([ ]*\)\([*&]\)/\2\1/<CR>

cnoremap Unspace 1,$s/\((for\\|if\\|while\\|switch)\)(/\1 (/g

cmap <Leader>sc s/(\(.\{-}\))\(.*\);/static_cast<\1\>(\2);

cmap <C-Left> b
cmap <C-Right> w

" abbreviations
abbr cosnt  const
abbr fasle  false
abbr trie   true
abbr truie  true

highlight Tab ctermbg=lightgray guibg=grey90
au Syntax c    syn match Tab /\t/
au Syntax cpp  syn match Tab /\t/

au Syntax c    syn keyword cTodo contained TODO FIXME XXX @todo \todo
au Syntax cpp  syn keyword cTodo contained TODO FIXME XXX @todo \todo

" move to upper/lower window
map <C-j> <C-W>j
map <C-k> <C-W>k

" macro to separate function arguments at , and realign automatically
nmap <C-k> /,<Esc>li<CR><Esc>==:noh<CR>

" show tag list for word under cursor
nnoremap <Leader>t :ts <C-R><C-W><CR>

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

" Search functions (see ide_style_search.vim for reference)
nmap <F8> :GWB<CR>
nmap <C-F8> :cn<CR>
nmap <C-F7> :cN<CR>

au BufRead *.hs command! Make :!d:\ghc\ghc-6.4.2\bin\ghci.exe %:t
au BufRead *.py command! Make :!c:\python25\python %:t

if filereadable("$VIM/_vimrc.local")
	source $VIM/_vimrc.local
end
