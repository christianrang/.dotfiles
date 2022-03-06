syntax on
set nu ru et
set ts=2 sts=2 sw=2
set cursorline
set hlsearch
set colorcolumn=80,120
set spell spelllang=en_us

" store the plugins in plugged dir
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Color themes
Plug 'Mofiqul/dracula.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" UltiSnips: Trigger configuration
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Tokyo Night colorscheme config
let g:tokyonight_style = "night"
colorscheme tokyonight 

