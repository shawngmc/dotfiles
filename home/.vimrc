" Use ref: http://vimdoc.sourceforge.net/htmldoc/options.html#option-summary

" Tell VIM to be more VIM-like, instead of strict VI-compatibility
" Used to Fix Arrow Key Behavior
" Actually unnecessary when a .vimrc is even PRESENT per ':h nocompatible', but here as a reminder
set nocompatible

" Allow mouse selection and positioning!
set mouse&
set mouse=a

" Modify indent behavior
set expandtab                          " Expand an entered Tab to spaces
set autoindent                         " Copy indent from current line when starting a new line
set smarttab
set tabstop=2                          " Indent is 2 spaces
set smartindent                        " C-style indenting, but looser - for example, indent after {

" Improve search
set hlsearch                           " Highlight search results
set incsearch                          " Search as you type, not just when you hit enter

" Enable powerline and always show a statusline
" TODO: Bullet proof this a bit
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2

" Miscellaneous
filetype plugin on                     " Auto-detect un-labeled filetypes
set title                              " Set terminal title to the file being edited
set number                             " Show line numbers
set belloff=all                        " Disable the error bell!
