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
