set ts=2
set shiftwidth=2
"This is for python code.
set foldmethod=indent
set foldlevel=20
set noet
set hlsearch
set incsearch
set nu
syntax on
filetype indent plugin on
match ErrorMsg '\%>80v.\+'
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
"set colorcolumn=81
set background=dark
"Show matching parentheses
set showmatch
" Use F2 to toggle paste mode.
set pastetoggle=<F2>
" NERD Tree mapped to F3.
nmap <silent> <special> <F3> :NERDTreeToggle<RETURN>
" Auto complete functions.
set cf
" Aut complete vim commands.
set wildmenu
set wildmode=list:longest,full
" Turn off annoying bell.
set visualbell
" Set the status line.
" set statusline=%f         " Path to the file
" set statusline+=%=        " Switch to the right side
" set statusline+=%l        " Current line
" set statusline+=/         " Separator
" set statusline+=%L        " Total lines

" For GNU/Linux
set rtp+=/usr/local/lib/python2.7/dist-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim/
" For Mac
set rtp+=/Library//Python/2.7/site-packages/powerline/bindings/vim
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
