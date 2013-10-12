set tabstop=2
" Sets the text width in the file to 80 characters.
" Leads to automatic line breaks after 80 characters.
set textwidth=80
set shiftwidth=2
"This is for python code.
set foldmethod=indent
set foldlevel=20
set noexpandtab
set hlsearch
set incsearch
set number
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
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" Auto complete functions.
set cf
" Aut complete vim commands.
set wildmenu
set wildmode=list:longest,full
" Turn off annoying bell.
set visualbell

" Install power line by doing sudo easy_install powerline.
" This setup is required only on Linux and not on Mac.
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux"
	python from powerline.vim import setup as powerline_setup; powerline_setup(); del powerline_setup
endif

" For GNU/Linux
set rtp+=/usr/local/lib/python2.7/dist-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim/
" For Mac
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0
let g:jedi#use_splits_not_buffers = "bottom"
" Git wrapper for vim.
Bundle 'tpope/vim-fugitive'
" Syntax checking.
Bundle 'scrooloose/syntastic'
" For snippets.
" vim-addon-mw-utils and tlib_vim are needed by snipmate.
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
" Enable rainbow-colored parentheses.
Bundle "kien/rainbow_parentheses.vim"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" Enable tab based auto-completion in search command.
Bundle "SearchComplete"
" Shows the yanks with YRshow command.
Bundle "YankRing.vim"
" Allows arbitrary navigation using \\w-followed-by-highlighted-char.
Bundle "Lokaltog/vim-easymotion"
" Show indentation clearly.
Bundle 'Yggdroot/indentLine'
" Not used for now.
" " Enable language checking with LanguageToolCheck command.
" Bundle "LanguageTool"
" let g:languagetool_jar=$HOME . "/.vim/LanguageTool-2.2/languagetool-standalone.jar"
" Bundle for CSS coloring.
Bundle "skammer/vim-css-color"
