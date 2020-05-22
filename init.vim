call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'SirVer/ultisnips'
Plug '~/GitHub/vim-sling'
"Plug 'Sn00pbom/vim-sling'
call plug#end()

" General
    set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8
    set number relativenumber
    set hidden
    set wrap
    set showbreak=+++
    set showmatch " Highlight matching brace
    set hlsearch
    set smartcase
    set ignorecase
    set incsearch
    set autoindent
    set shiftwidth=4	" Number of auto-indent spaces
    set smartindent	" Enable smart-indent
    set smarttab	" Enable smart-tabs
    set softtabstop=4	" Number of spaces per Tab
    set backspace=indent,eol,start

" Handy Maps
    nmap <leader>gd <Plug>(coc-definition)
    nmap <leader>gr <Plug>(coc-references)
    nnoremap <C-p> :GFiles<CR>
    if has("nvim")
	" Make escape work in the Neovim terminal
	tnoremap <esc> <c-\><c-n>
    endif

" Sling
    " let g:sling#sling_path="gnils.sh"
    let g:sling#edit_on_missing=1
    noremap <F5> :Sling<CR>

" Snappy updating
    set updatetime=300

" Lazy normal mode
    inoremap jk <esc>
    inoremap kj <esc>

" Colors and such
    set termguicolors
    " colorscheme base16-atelier-lakeside
    colorscheme gruvbox
    hi Search gui=underline guifg=yellow guibg=NONE cterm=underline ctermfg=yellow ctermbg=NONE " do sicc yellow underline for searches instead of full highlight

" non-retarded splitting
    set splitbelow splitright

" Gitgutter settings
    set signcolumn=yes

" COC settings
    " Some server may have issues with backup files
    set nobackup
    set nowritebackup

    set cmdheight=2

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

" Airline
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=1

set noshowmode " Needs to be at the bottom to work for some reason