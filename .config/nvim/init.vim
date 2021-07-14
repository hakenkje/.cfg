syntax on

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set timeout timeoutlen=500 ttimeoutlen=500
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
noremap <Leader>w :clo<CR>
noremap <Leader>q :bd<CR>
map <S-r> <C-w>r

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
nmap <Leader>rc :e $MYVIMRC<CR>

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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'

" Plug 'tommcdo/vim-fubitive'
" Plug 'vim-scripts/bufkill.vim'
" Plug 'liuchengxu/vista.vim'
Plug 'tmhedberg/matchit'
Plug 'Raimondi/delimitMate'
Plug 'nelstrom/vim-visual-star-search'

Plug 'sheerun/vim-polyglot'
Plug 'bfredl/nvim-miniyank'
" Plug 'gennaro-tedesco/nvim-peekup'
Plug 'sjl/gundo.vim'
Plug 'vimwiki/vimwiki'
" Plug 'gregsexton/gitv'
" Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'
" Plug 'itchyny/lightline.vim'
Plug 'mcchrish/nnn.vim'

" File type specific
Plug 'mattn/emmet-vim', {
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'html', 'svelte'] }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'scss', 'json', 'yaml', 'html', 'svelte'] }
Plug 'psf/black', { 'branch': 'master', 'for': 'python' }

" LSP related
Plug 'tami5/sql.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/completion-nvim'

" Color schemes
Plug 'folke/tokyonight.nvim'

" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
call plug#end()

" colorscheme hkj256
" let g:tokyonight_style = "night"
let g:tokyonight_transparent = 1
colorscheme tokyonight
