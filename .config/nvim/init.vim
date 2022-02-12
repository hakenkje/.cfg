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

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" Use a dedicated python3 venv for neovim (contains pynvim, neovim and black)
let g:python3_host_prog = expand('~/.nvim-venv/bin/python3')
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
" noremap <Leader>w :clo<CR>
" noremap <Leader>q :bd<CR>
noremap <C-q> :bd<CR>
noremap <Leader>q :close<CR>
" map <S-r> <C-w>r

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


call plug#begin('~/.vim-plugs')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'sindrets/diffview.nvim'

Plug 'b3nj5m1n/kommentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'simrat39/symbols-outline.nvim'
Plug 'tmhedberg/matchit'
Plug 'windwp/nvim-autopairs'
Plug 'nelstrom/vim-visual-star-search'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'alvarosevilla95/luatab.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'bfredl/nvim-miniyank'
Plug 'sjl/gundo.vim'
Plug 'vimwiki/vimwiki'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'mcchrish/nnn.vim'

" File type specific
Plug 'mattn/emmet-vim', {
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'html', 'svelte'] }
Plug 'mhartington/formatter.nvim'

" LSP related
Plug 'tami5/sql.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mfussenegger/nvim-jdtls'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Color schemes
" Plug 'folke/tokyonight.nvim'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'monsonjeremy/onedark.nvim'
Plug 'Mofiqul/vscode.nvim'
" Plug 'shaunsingh/nord.nvim'
Plug 'EdenEast/nightfox.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'


call plug#end()

" colorscheme hkj256

" let g:tokyonight_style = "dark"
" let g:tokyonight_transparent = 1
" colorscheme tokyonight

" lua << EOF
" require('github-theme').setup({
"   themeStyle = "dark",
"   transparent = true,
" })
" EOF

" let g:onedark_transparent = 1
" colorscheme onedark

" let g:vscode_style = "dark"
" colorscheme vscode

let g:nord_contrast = v:true
let g:nord_disable_background = v:true
" colorscheme nord
colorscheme nightfox
" hi Normal guibg=NONE ctermbg=NONE
