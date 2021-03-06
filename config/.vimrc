unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

silent! if plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
    \  if isdirectory(expand('<amatch>'))
    \|  call plug#load('nerdtree')
    \|  execute 'autocmd! nerd_loader'
    \| endif
augroup END
Plug 'junegunn/seoul256.vim'
Plug 'fatih/vim-go', { 'tag': 'v1.22', 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'honza/dockerfile.vim'
Plug 'tpope/vim-endwise'
Plug 'cespare/vim-toml'
Plug 'hashivim/vim-terraform'
Plug 'uarun/vim-protobuf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
call plug#end()
endif

let mapleader = ' '
let maplocalleader = ' '

augroup vimrc
  autocmd!
augroup END

set nu
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set visualbell
set backspace=indent,eol,start
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set list
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set nowritebackup
set nobackup
set noswapfile
set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set complete-=i
set cursorline
hi clear CursorLine
silent! set cryptmethod=blowfish2
set ambiwidth=double
set formatoptions=1
set pastetoggle=<C-j>
set modelines=2
set synmaxcol=1000
colo seoul256
set nostartofline
if exists('&fixeol')
  set nofixeol
endif
set noimd
set imi=1
set ims=-1

nnoremap ,s :source %<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

autocmd InsertLeave * set nopaste
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_list_type = "quickfix"

let g:rustfmt_autosave = 1

let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:plugs_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source':  sort(keys(g:plugs)),
  \ 'sink':    function('s:plugs_sink')}))

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ }

