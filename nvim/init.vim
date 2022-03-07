syntax on 
set nu ru et
set ts=2 sts=2 sw=2
set cursorline
set hlsearch
set colorcolumn=80,120
set spell spelllang=en_us

let mapleader="\<SPACE>"

" store the plugins in plugged dir
call plug#begin("~/.config/nvim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Telescope stuffs
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" Telescope config
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vim-go keybinds
nnoremap <leader>gr <cmd>GoRun<cr>
nnoremap <leader>gt <cmd>GoTest<cr>
nnoremap <leader>gf <cmd>GoTestFunc<cr>

" NerdTree keybinds
nnoremap <leader>nt <cmd>NERDTreeToggle<cr>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" UltiSnips: Trigger configuration
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let NERDTreeShowHidden=1

" Tokyo Night colorscheme config
"let g:tokyonight_style = "night"
"colorscheme tokyonight
"
