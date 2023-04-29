"== VIM PLUG =="
call plug#begin('~/.vim/plugged')

"===== code - linting, autocomplete and prettier
	Plug 'sbdchd/neoformat'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-surround'
	Plug 'elkowar/yuck.vim'
	Plug 'Exafunction/codeium.vim'
	Plug 'rust-lang/rust.vim'
	
"===== git
	Plug 'lewis6991/gitsigns.nvim'
"===== files
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'preservim/nerdcommenter'
"===== tsx
	Plug 'windwp/nvim-autopairs'
	Plug 'ianks/vim-tsx'
	Plug 'leafgarland/typescript-vim'
"===== theme
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'nvim-tree/nvim-web-devicons'
"===== nvim
	Plug 'startup-nvim/startup.nvim'
	Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
	Plug 'nvim-lualine/lualine.nvim'

call plug#end()

filetype plugin on
colorscheme PaperColor
set termguicolors

set background=dark
set number relativenumber
set laststatus=2
set updatetime=300
set signcolumn=yes

" backupfiles issues
set nobackup
set nowritebackup

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" nvim-tree
nnoremap <leader>e <cmd>NvimTreeToggle<cr>

" neoformat
let g:neoformat_try_node_exe = 1
autocmd BufWritePre (*.js|*.ts*) Neoformat


lua << EOF
local function hello()
  return [[hello world]]
end
	require('lualine').setup {
		sections = { lualine_a = { 'FugitiveHead'}, lualine_b = { 'g:coc_status', 'bo:filetype' }}
	}
	require('nvim-autopairs').setup {}
	require('gitsigns').setup()
	require('nvim-tree').setup()
	require('startup').setup()
	require('bufferline').setup {}
EOF
