syntax on

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" set autoindent
set nowrap
set timeout timeoutlen=500 ttimeoutlen=5
set pastetoggle=<F2>
set nojoinspaces
set lazyredraw

set colorcolumn=80
" set termguicolors
set number
set relativenumber
set cursorline
set cursorcolumn
set undofile

set ignorecase
set smartcase
set gdefault
set showmatch
set list
set foldlevel=99
set scrolloff=5

set wildignore+=*.jpg,*.jpeg,*.png,*.gif
set wildignore+=*.pdf
set wildignore+=*.pyc,*.pyo,*.ipynb
set wildignore+=*.aux,*.log,*.bbl,*.blg,*.cls,*.sty,*.brf,*.lof,*.nlo,*.out,*.toc
set wildignore+=*.swp,*.un~,*.o,*.so
set wildignore+=output,build,dist,*.egg-info,tags,node_modules,tmp,bower_components

set mouse=a  " Enable mouse scrolling

" Use a dedicated python3 venv for neovim (contains pynvim, neovim and black)
let g:python3_host_prog = stdpath('data') .. '/venv/bin/python3'
" let g:python_host_skip_check = 1
" let g:python3_host_skip_check = 1

let mapleader = "\<space>"
let maplocalleader = ","

" Searching
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>, :nohlsearch<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz

" Switch window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nmap <up> :3wincmd ><cr>
nmap <down> :3wincmd <<cr>
map + <C-w>+
map - <C-w>-

" Split hotizontal and vertical
nnoremap <Leader>s <C-w>s<C-w>j
nnoremap <Leader>v <C-w>v<C-w>l

" Scroll window with cursor
nnoremap <C-Down> j<C-e>
nnoremap <C-Up>   k<C-y>

" Tabs
nmap <leader>T :tabnew<CR>
nmap <leader>W :tabclose<CR>
noremap <C-q> :b#<bar>bd#<CR>
noremap <Leader>q :close<CR>

" Fix for unimpaired commands
nmap å [
nmap æ ]

" Paragraph Movement
nmap Å {
nmap Æ }
vmap Å {
vmap Æ }

" Left and Right to traverse buffers
noremap <Left> <ESC>:bp<CR>
noremap <Right> <ESC>:bn<CR>

" Better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Bubble multiple lines, requires unimpaired
vmap <S-Up> [egv
vmap <S-Down> ]egv

" +y Copy/Paste to and from Desktop Environment
noremap <Leader>yy "+y

" Select last edited or pasted text
nnoremap gp `[v`]

" jk to esc
inoremap jk <esc>

" edit .vimrc/init.vim
nmap <Leader>c :e $MYVIMRC<CR>

" Disable Ex mode
nnoremap Q <nop>

" Disable middle mouse click paste
nnoremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>

augroup init
  autocmd!

  " Automatically install missing plugins
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif

  " Highlight yanked text
  autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
augroup END


call plug#begin(stdpath('data') . '/plugged')

" Obligatory tpope plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'

" Other plugins
Plug 'b3nj5m1n/kommentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'tmhedberg/matchit'
Plug 'windwp/nvim-autopairs'
Plug 'sheerun/vim-polyglot'
Plug 'nelstrom/vim-visual-star-search'
Plug 'hoob3rt/lualine.nvim'
Plug 'alvarosevilla95/luatab.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mcchrish/nnn.vim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'bfredl/nvim-miniyank'
Plug 'vimwiki/vimwiki'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mhartington/formatter.nvim'
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'typescript', 'typescriptreact', 'html', 'svelte'] }

" LSP plugins
Plug 'tami5/sql.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua', { 'for': ['lua', 'vim'] }
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Color schemes
" Plug 'projekt0n/github-nvim-theme'
" Plug 'Mofiqul/vscode.nvim'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

" lua << EOF
" require('github-theme').setup({
"   themeStyle = "dark",
"   transparent = true,
" })
" EOF
" let g:vscode_style = "dark"

colorscheme nightfox
