syntax on 
set nu ru et
set ts=2 sts=2 sw=2
set cursorline
set hlsearch
set colorcolumn=80,120
set spell spelllang=en_us
set splitbelow
set relativenumber
set termguicolors

noremap <leader>sc :set spell!<CR>
noremap <leader>ml :! make lint<CR>
noremap <leader>mr :! make run<CR>
noremap <leader>jq :%!jq<CR>
nnoremap <leader>t :split term://zsh<CR>
" returns terminal to normal mode. this is slowwwwwwww
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

let mapleader="\<SPACE>"

" store the plugins in plugged dir
call plug#begin("~/.config/nvim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'honza/vim-snippets'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'ellisonleao/glow.nvim'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neomake/neomake'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'jubnzv/mdeval.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'stevearc/aerial.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'voldikss/vim-floaterm'

" React things
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" treesitter context
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

" Telescope stuffs
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc

Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

call plug#end()

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

" Telescope config
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>km <cmd>Telescope keymaps<cr>
nnoremap z= <cmd>Telescope spell_suggest<cr>
nnoremap <leader>ht <cmd>Telescope help_tags<cr>

nnoremap <leader>dc <cmd>DapContinue<cr>
nnoremap <leader>c <cmd>DapContinue<cr>
nnoremap <leader>db <cmd>DapToggleBreakpoint<cr>
nnoremap <leader>du <cmd>lua require("dapui").toggle()<cr>

" vim-go keybinds
nnoremap <leader>gr <cmd>GoRun<cr>
nnoremap <leader>gt <cmd>GoTest<cr>
nnoremap <leader>gf <cmd>GoTestFunc<cr>

nnoremap <leader>tt <cmd>FloatermToggle<cr>

" prettier config
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.html,*.md PrettierAsync
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.html PrettierAsync

" NerdTree keybinds
nnoremap <leader>nt <cmd>NERDTreeToggle<cr>

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

let NERDTreeShowHidden=1

" COQ autostart
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | COQnow | endif

" Glow config
noremap <leader>p :Glow<CR>

" Git blame shortcut
noremap <leader>gb :Git blame<CR>

" markdown-preview config
"
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

colorscheme tokyonight-night

" Lua
lua <<EOF

local coq = require "coq"

-- Tokyo Night
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- Load the colorscheme
-- vim.cmd[[colorscheme tokyonight]]

-- nvim-lspconfig 
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>dl', '<cmd>Telescope diagnostics<CR>', opts)

-- Telescope
require("telescope").load_extension('harpoon')
require("telescope").load_extension('aerial')

-- Harpoon config
vim.api.nvim_set_keymap('n', '<space>hl', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>hp', '<cmd>lua require("harpoon.ui").nav_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>hn', '<cmd>lua require("harpoon.ui").nav_next()<CR>', opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'gopls', 'eslint', 'html', "flow", "rls", "rust_analyzer"}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
  }
end

-- aerial things
require'lspconfig'.golangci_lint_ls.setup{
  on_attach = require("aerial").on_attach
}

require('Comment').setup()

require('gitsigns').setup{
  on_attach = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>hd', '<cmd>:Gitsigns diffthis<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>hb', '<cmd>:Gitsigns blame_line<CR>', opts)
  end
}

require('aerial').setup({
  on_attach = function(bufnr)
    vim.api.nvim_set_keymap('n', '<space>ao', '<cmd>Telescope aerial<CR>', opts)
  end
})

require('dap-go').setup()
require('telescope').load_extension('dap')
require("dapui").setup()
require("nvim-dap-virtual-text").setup{
  enabled = true,
}

EOF
