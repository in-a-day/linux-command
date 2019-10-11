source $VIMRUNTIME/vimrc_example.vim

set nocompatible
filetype plugin on

" ==========通用配置==========
" gui启动最大化
" au GUIEnter * simalt ~x
" 默认编码
set encoding=utf-8
set fileencodings=utf-8,chinese,lation-1,gbk,gb18030,gk2312
set fileencoding=chinese
" 默认字体
set guifont=Fira_Code:h11
" 删除vim交换文件
set noundofile
set nobackup
set nowritebackup
set noswapfile
" 行号
set number
" 隐藏缓冲区,参数列表文件修改提示
set hidden
" 保存的Ex命令数量(退出vim仍存在)
set history=1000
" 补全菜单模式
set wildmode=full
" 关闭提示音, 开启可视提示
" set visualbell
" 关闭高亮查找
set nohlsearch
" 查找预览
set incsearch
" 开启鼠标
set mouse=a
" 空格代替tab
set expandtab
set tabstop=4


" ==========插件管理==========

" vim-plug 指定插件位置
call plug#begin('d:/codeprogram/Vim/vimfiles/plugged')
" 文件树
Plug 'scrooloose/nerdtree'
" 符号补全
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
" 注释补全
Plug 'scrooloose/nerdcommenter'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 缩进线
Plug 'Yggdroot/indentLine'
" coc补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 启动界面
Plug 'mhinz/vim-startify'

" 初始化插件系统
call plug#end()


" ==========按键映射==========

nnoremap <silent> <C-l> :set hls!<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" ===========Coc==============

set updatetime=300
set shortmess+=c
set signcolumn=yes

" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"==========nerdtree==========
nnoremap <silent> <A-1> : NERDTree<CR>

"==========indentLine==========

" let g:indentLine_char = '¦'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" 默认使用vim的conceal
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2


"==========airline==========
" 设置顶部buffer状态栏
" let g:airline#extensions#tabline#enabled = 1


" =====================================================================
runtime macros/matchit.vim
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set diffexpr=MyDiff()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

