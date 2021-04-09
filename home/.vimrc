" Use ref: http://vimdoc.sourceforge.net/htmldoc/options.html#option-summary

" Tell VIM to be more VIM-like, instead of strict VI-compatibility
" Used to Fix Arrow Key Behavior
" Actually unnecessary when a .vimrc is even PRESENT per ':h nocompatible', but here as a reminder
set nocompatible

" Show line numbers
set number

" Allow mouse selection and positioning!
set mouse&
set mouse=a

" Modify indent behavior
set expandtab
set autoindent                         " Copy indent from current line when starting a new line
set smarttab
set tabstop=4

" Set terminal title to the file being edited
set title

" Improve search
set hlsearch                           " Highlight search results
set incsearch                          " Search as you type, not just when you hit enter

" Enable powerline and always show a statusline
" TODO: Bullet proof this a bit
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
