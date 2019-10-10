set nocompatible              " be iMproved, required
filetype off                  " required

" ==========通用配置区==========
" 默认编码
set encoding=utf-8
set fileencodings=zh_cn
" 默认字体
set guifont=Fira_Code:h12
" 删除vim交换文件
set noundofile
set nobackup
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
set visualbell
" 关闭高亮查找
set nohlsearch
" 查找预览
set incsearch
" 开启鼠标
set mouse=a

" ==========按键映射==========


" ==========插件配置区==========
" 指定插件位置
call plug#begin('D:/CodeProgram/vim/vimfiles/plugged')
" 文件树
Plug 'scrooloose/nerdtree'
" 符号补全
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
" 注释补全
Plug 'scrooloose/nerdcommenter'
" 代码补全
Plug 'Shougo/neocomplete.vim'


" 初始化插件系统
call plug#end()



" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
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

