set number  	" Show line number
syntax on	" Syntax coloring
set encoding=utf8
set incsearch      " Show search results while typing
set hlsearch       " High-light search results
set ignorecase     " Ignore upper/lower-case
set smartcase      " Only use case sensitive search when Uppercase letters are typed

" Leaving vim
:imap <C-L> <Esc
:imap jj <Esc>
:imap jk <Esc>
:imap kj <Esc>
:imap kk <Esc>

" While in insert mode, jump to (soft) beginning / end of line
inoremap <C-a> <Esc><S-I>
inoremap <C-e> <Esc><S-A>

" EOF
