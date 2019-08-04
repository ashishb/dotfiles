set tabstop=2
" Sets the text width in the file to 80 characters.
" Leads to automatic line breaks after 80 characters.
" set textwidth=80
set shiftwidth=2
"This is for python code.
set foldmethod=indent
set foldlevel=20
set expandtab
set hlsearch
set incsearch
" Show line numbers.
set number
" Enable mouse.
set mouse=a
" Use system clipboard.
set clipboard=unnamed
" show context above/below cursorline.
set scrolloff=3
syntax on
" The new regex engine crashes with syntax on, force old engine for now.
" https://www.reddit.com/r/vim/comments/22cxmp/vim_74_crashes_when_syntax_is_turned_on/cglpo5u
set regexpengine=1
" watch for file changes
set autoread
filetype indent plugin on
" Show redline beyond 80 characters
" match ErrorMsg '\%>80v.\+'
"Show matching parentheses
set showmatch
" Use F2 to toggle paste mode.
set pastetoggle=<F2>
" Enable per-directory .vimrc files and disable unsafe commands in them.
set exrc
" Commented since this does not seem to work due to plugins.
" set secure
" NERD Tree mapped to F3.
nmap <silent> <special> <F3> :NERDTreeToggle<RETURN>
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
" Map \\<Enter> to hide highlight.
map <silent> <leader><cr> :noh<cr>
" Auto complete functions.
set cf
" Aut complete vim commands.
set wildmenu
set wildmode=list:longest,full
" Turn off annoying bell.
set visualbell
" https://stackoverflow.com/questions/3534028/mac-terminal-vim-will-only-use-backspace-when-at-the-end-of-a-line
set backspace=indent,eol,start

" For GNU/Linux
set rtp+=/usr/local/lib/python2.7/dist-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim/
" For Mac
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
cnoremap sudow w !sudo tee % >/dev/null
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Use airline (powerline installation is weird and rarely works).
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Python auto-completion plugin.
Bundle 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0
let g:jedi#use_splits_not_buffers = "bottom"
" Git wrapper for vim.
Bundle 'tpope/vim-fugitive'
" Syntax checking.
" Bundle 'scrooloose/syntastic'
" let g:syntastic_java_javac_classpath = '/usr/local/Cellar/android-sdk/22.6.2/platforms/android-19/android.jar'
" For snippets.
" vim-addon-mw-utils and tlib_vim are needed by snipmate.
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
" An awesome collection of snippets.
Bundle "honza/vim-snippets"
" Enable rainbow-colored parentheses.
Bundle "kien/rainbow_parentheses.vim"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" Disable SearchComplete - it is buggy and interferes with ability to arrow
" up/down the search histroy.
" Enable tab based auto-completion in search command.
" Bundle "SearchComplete"
" Shows the yanks with YRshow command.
Bundle "YankRing.vim"
" Allows arbitrary navigation using \\w-followed-by-highlighted-char.
Bundle "Lokaltog/vim-easymotion"
" Not used for now.
" " Enable language checking with LanguageToolCheck command.
" Bundle "LanguageTool"
" let g:languagetool_jar=$HOME . "/.vim/LanguageTool-2.2/languagetool-standalone.jar"
" Bundle for CSS coloring.
Bundle "skammer/vim-css-color"
" Displays CTags in side bar.
Bundle "majutsushi/tagbar"
nmap <F8> :TagbarToggle<CR>
Bundle "altercation/vim-colors-solarized"
" solarized looks good on Mac (not on Linux)
let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Darwin"
  "colorscheme solarized
else
  colorscheme default
endif
set background=dark
" Show indentation clearly.
Bundle 'Yggdroot/indentLine'
Bundle "eventualbuddha/vim-protobuf"
Bundle "rmanalan/jshint.vim"
Bundle "pangloss/vim-javascript"
" Bundle "nathanaelkane/vim-indent-guides"
let g:indentLine_char = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indentLine_color_light = 1
Bundle "airblade/vim-gitgutter"
let g:gitgutter_max_signs=10000
" Fix for gitgutter on solarized theme
" https://github.com/airblade/vim-gitgutter/issues/164
highlight clear SignColumn
highlight GitGutterAdd ctermfg=darkgreen
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
" Commented since none of this seems to work for now.
" " For android development.
" Robo is probably obsolete and broken.
" Bundle "robo"
" Bundle "bpowell/vim-android"
" "Added by android-vim:
" set tags+=/Users/ashishbhatia/.vim/tags
" Bundle 'vim-scripts/javacomplete'
" autocmd Filetype java setlocal omnifunc=javacomplete#Complete
" let g:SuperTabDefaultCompletionType = 'context'
" autocmd Filetype java setlocal omnifunc=javacomplete#CompleteParamsInfo
" setlocal completefunc=javacomplete#CompleteParamsInfo 
Bundle "akhaku/vim-java-unused-imports"
" JSON syntax coloring.
au BufNewFile,BufRead *.json set filetype=json
" Smali syntax coloring
au BufNewFile,BufRead *.smali set filetype=smali
" Disable for now, since it makes the syntax convoluted by hiding various
" elements like double-quotes
" Bundle "elzr/vim-json"
Bundle "tpope/vim-markdown"

" Disable this since it is slow.
" " Groovy syntax highlighting
" Bundle "vim-scripts/groovy.vim"
" " gradle syntax highlighting
" au BufNewFile,BufRead *.gradle set filetype=groovy

" aidl syntax highlighting
au BufNewFile,BufRead *.aidl set filetype=java 
" Highlight trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
" let g:vjde_completion_key='<c-space>' 
" let g:vjde_install_path='/Users/ashishb/src/dotfiles/_vim/bundle/Vim-JDE/'
" Bundle "Vim-JDE"
" Bundle "Valloric/YouCompleteMe"
Bundle "naseer/logcat"
au BufNewFile,BufRead *.logcat set filetype=logcat
Bundle "tpope/vim-git"
au FileType gitcommit set spell
Plugin 'jparise/vim-graphql'

" Kotlin
Plugin 'udalov/kotlin-vim'
au BufNewFile,BufRead *.kt set filetype=kotlin
au BufNewFile,BufRead *.kts set filetype=kotlin

" JAD files are generated by JAD decompiler
au BufNewFile,BufRead *.jad set filetype=java

" Solidity
Plugin 'tomlion/vim-solidity'
au BufNewFile,BufRead *.sol set filetype=solidity
" Typescript
Plugin 'leafgarland/typescript-vim'
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.tsx set filetype=typescript


" Ignore whitespaces in vimdiff
if &diff
    " diff mode
    set diffopt+=iwhite
endif
