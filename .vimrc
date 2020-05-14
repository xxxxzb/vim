
" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
let &t_ut=''
set autochdir
set fileencodings=utf8,cp936,gb18030,big5 

set nocompatible 
syntax on
set mouse=a
set encoding=utf-8
set t_Co=256
filetype off


" ===
" === Editor behavior
" ===
set number
"set relativenumber
"set cursorcolumn
set cursorline
set colorcolumn=80
set noshowmode
set nobackup
set ttimeoutlen=0
set notimeout
set noswapfile
set wildmenu
set showcmd
set undofile
set clipboard^=unnamed,unnamedplus

" ===高级
set regexpengine=1
"在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能。
set lazyredraw
set ttyfast "should make scrolling faster
set noerrorbells "关闭错误信息响铃 
set visualbell "使用可视响铃代替呼叫

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 搜索
set hlsearch
set incsearch
set ignorecase
set smartcase

" 自动缩进
set autoindent

" 将ΤΑΒ转换成空格
set expandtab

" 在 insert 模式下，一个 TAB 键按下后，展示成几个空格
set softtabstop=4

"tabstop 有两个作用: 1.识别多少个空格形成一个TAB/ 2.显示既有文件时，将 TAB 显示成多个个空格
set tabstop=4

" >> 缩进的空格数
set shiftwidth=4

" 将ΤΑΒ显示为 | ，空格显示为▫
set listchars=tab:\|\ ,trail:▫
set list

" 自动换行
set wrap

" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set linebreak

" 指定折行处与编辑窗口的右边缘之间空出的字符数
set wrapmargin=2

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set scrolloff=5

" 水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用
set sidescrolloff=15



" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   o >
"     e
"     v
noremap <silent> r k
noremap <silent> n h
noremap <silent> i j
noremap <silent> o l
" 上下左右plus
noremap <silent> R 5k
noremap <silent> I 5j
noremap <silent> N 0
noremap <silent> O $

noremap <silent> l o
noremap <silent> L O

noremap <silent> k r
noremap <silent> h i
noremap <silent> H I

noremap m u
noremap M <C-r>

noremap u r

" Faster in-line navigation
noremap W 3w
noremap B 3b

noremap = n
noremap - N


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
"noremap ; :

" Save & quit
nnoremap q :q<CR>
nnoremap s :w<CR>
inoremap ii <ESC>
inoremap <c-e> <ESC>A
inoremap <c-a> <ESC>I

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>src :source ~/.config/nvim/init.vim<CR>

" Open Startify
noremap <LEADER>st :Startify<CR>


" sudo to write
cnoremap w!! w !sudo tee % >/dev/null


" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>



" ===
" === Other useful stuff
" ===
" 切换buffer
nnoremap ] :bn<CR>
nnoremap [ :bp<CR>

" \p to show the current buffer file path
nnoremap \p 1<C-G>

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>


" 大小写转换 change case 
noremap ` ~

" 括号自动补全
" inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap ) ()
inoremap [ []<ESC>i
inoremap < <><ESC>i
""inoremap { {<CR>}<ESC>O
inoremap { {}<ESC>i
inoremap } {}

"??????????????????? Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>o <C-w>l

" Disable the default s key
noremap S <nop>
noremap D <nop>
noremap j <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap <LEADER>su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap <LEADER>se :set splitbelow<CR>:split<CR>
noremap <LEADER>sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap <LEADER>so :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <LEADER><up> :res +5<CR>
noremap <LEADER><down> :res -5<CR>
noremap <LEADER><left> :vertical resize-5<CR>
noremap <LEADER><right> :vertical resize+5<CR>

" Place the two screens up and down
noremap <LEADER>sh <C-w>t<C-w>K
" Place the two screens side by side
noremap <LEADER>sv <C-w>t<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap to :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmo :+tabmove<CR>


