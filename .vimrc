"encoding
set encoding=utf-8   "vim内部使用的字符编码方式，包括vim的buffer，菜单文本等
set termencoding=utf-8 "vim所工作的终端的字符编码方式
set fileencoding=utf-8   "vim中当前编辑的文件的字符编码方式,vim保存文件时也采用该字符编码
set fileencodings=utf-8  "vim启动时会按照所列字符编码方式逐一探测...
set langmenu=zh_CN.utf-8
language messages zh_CN.utf-8 "vim 提示信息乱码的解决

"vim插件管理器：vundle 配置
set nocompatible "关闭兼容vi模式
filetype off   " vundle required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required!
Plugin 'gmarik/Vundle.vim'

" Color scheme
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/tpope/vim-vividchalk.git'
Plugin 'https://github.com/jonathanfilip/vim-lucius.git'

"Syntax
"Plugin 'cscope.vim'
"A plugin for visually displaying indent levels in Vim(用来显示对齐线)
Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'

"indent
"Vastly improved vim's javascript indentation
"Plugin 'pangloss/vim-javascript'

"ftplugin
"python代码检查功能 插件
Plugin 'pyflakes.vim'
"python代码折叠
Plugin 'https://github.com/vim-scripts/Efficient-python-folding.git'
"vim代码自动补全插件
Plugin 'https://github.com/vim-scripts/OmniCppComplete.git'
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/xolox/vim-lua-ftplugin.git'
"
Plugin 'xml.vim'

" utility
" a tree explorer plugin for navigating the filesystem
Plugin 'https://github.com/scrooloose/nerdtree.git'
"VIM批量注释与反注释插件
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
" .c和.h文件快速切换
Plugin 'a.vim'   
"自动生成各种注释插件 
Plugin 'DoxygenToolkit.vim'  
"源代码阅读插件
Plugin 'taglist.vim'
"查找python文档
Plugin 'pydoc.vim'
"python_fn 提供众多方便编辑python效率的快捷键
Plugin 'https://github.com/Crapworks/python_fn.vim.git'
"pydiction 通过tab键补全python代码
Plugin 'https://github.com/rkulla/pydiction.git'
"提供很好的python代码提示，以及shift+k 提供 __doc__ 展示功能
Plugin 'https://github.com/davidhalter/jedi-vim.git'
"HTML5 omnicomplete function and syntax for vim
Plugin 'https://github.com/othree/html5.vim.git'
"Unite and create user interfaces
Plugin 'https://github.com/Shougo/unite.vim.git'
"Interactive command execution in Vim
Plugin 'https://github.com/Shougo/vimproc.vim.git'
"The ultimate statusline/prompt utility
Plugin 'https://github.com/Lokaltog/vim-powerline.git'
"The Sublime Text style multiple selectors for Vim
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
"在缓冲间快速切换
Plugin 'https://github.com/corntrace/bufexplorer.git'
"
Plugin 'https://github.com/xolox/vim-session.git'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

call vundle#end()           " required!
filetype plugin indent on   " required!

"fancy 判断是终端还是Gvim
if has("gui_running")
		let g:isGUI = 1
else
		let g:isGUI = 0
endif

"set mapleader  
let mapleader=","
" vim waits for 1 seconds after the <Leader>key has been
" pressed.这个变量可以设置等待时间
set timeoutlen=2000

"设置光标所在列高亮 简写是 set cuc . 另外一个： set cc=8  设置第8列高亮
set cursorcolumn
set cc=120

"启动时最大化
autocmd GUIEnter * simalt ~x


if g:isGUI
	colorscheme lucius
	
	set guifont=Monaco:h12:cANSI
	"隐藏工具栏和菜单栏
	set guioptions-=m
	set guioptions-=T
endif
set background=dark


"修改默认注释颜色
"hi Commnet ctermfg=DarkCyan

"设置行号
set nu

"设置tab键为4个空格
set tabstop=4
" 指定自动缩进所使用的空格数量
set shiftwidth=4
"插入模式中用合适数量的空格代替tab
set expandtab

" 高亮显示结果
set hlsearch

" 在输入字符串的过程中就显示匹配点
set incsearch

" 不自动换行
"set nowrap

" 打开高亮
syntax on

" 指明在插入模式下在那里允许<BS>删除光标前面的字符
" 逗号分隔的三个值分别指：
" 行首的空白字符，换行符，插入模式开始处的之前的字符
set backspace=indent,eol,start

"使vim在启动一个新行的时候使用于前一行一样的缩进
set autoindent

" 保存50个命令和50个查找模式的历史
set history=50

"总在vim窗口的右下角显示当前光标位置
set ruler

"在vim窗口右下角，标尺的右边显示未完成的命令
set showcmd

"这告诉vim当覆盖一个文件的时候保留一个备份。但VMS系统除外，因为VMS系统会
"自动产生备份文件。备份文件的名称是在原来的文件名上加上"~"字符
if has("vms")
    set nobackup
else
    "set backup
endif

"cscope的配置
if has("cscope")
	set csprg=/usr/bin/cscope " specifies the command to execute
	set csto=0  " cscopetagorder
	set cst " cscopetag
	set nocsverb
    " add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb  " cscopeverbose
endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> " 0 or s: Find this C symbol
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR> " 1 or g: Find this definition
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> " 2 or d: Find functions called by this function
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> " 3 or c: Find functions calling this function 
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> " 4 or t: Find this text string
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> " 6 or e: Find this egrep pattern 
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR> " 7 or f: Find this file
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> " 8 or i: Find files #including this file 

set cscopequickfix=s-,c-,d-,i-,t-,e-

"ctag配置 很多插件要用到ctags生成的tag文件
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 进行Taglist的设置
map <F3> :silent! Tlist<CR> "直接F3弹出
let Tlist_Ctags_Cmd='ctags' "因为ctags放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动退出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0   "弹出taglist  不改变窗口大小


" 进行omnicppcomplete的设置
set completeopt=menu,longest,menuone
let OmniCpp_NamespaceSearch = 2  "search namespaces in this and included files
let OmniCpp_GlobalScopeSearch = 1 "
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 "show function prototype in popup window 
let OmniCpp_MayCompleteDot = 1  " autocomplete with . 
let OmniCpp_MayCompleteArrow = 1 "autocomplete with ->
let OmniCpp_MayCompleteScope = 1  " autocomplete with ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2 "select first item(but don't insert)
let OmniCpp_DisplayMode=1
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif " 自动关闭补全窗口

" 对DoxygenToolkit的设置
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="bellszhu, bellszhu@gmail.com"
let g:DoxygenToolkit_licenseTag="bellszhu license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 

" 对javascript.vim的配置
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" html5.vim
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" 增加html的自动补全.
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"设置vim-indent-guides
let g:indent_guiges_start_level = 2
let g:indent_guides_guide_size = 1

nnoremap <leader>f :Unite file
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>

"powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'

"pydiction
let g:pydiction_location = '/home/bells/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 10

"nerdtree
"autocmd VimEnter * NERDTree "vim启动时，加载nerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "当只剩下nerdtree窗口时，自动关闭
nnoremap <F10> :exe 'NERDTreeToggle'<CR> "F10 关闭/开启nerdTree
let NERDChristmasTree=1 "让Tree装饰的多姿多彩漂亮点
let NERDTreeAutoCenter=1 "控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt' "指定书签文件
let NERDTreeMouseMode=2  " 指定鼠标模式
let NERDTreeShowBookmarks=1 "是否默认显示书签列表
let NERDTreeShowFiles=1     " 是否默认显示文件
let NERDTreeShowHidden=0   "是否默认显示隐藏文件
let NERDTreeShowLineNumbers=1  "是否默认显示行号
let NERDTreeWinPos='left'  "窗口位置
let NERDTreeWinSize=31   "窗口宽度
let NERDTreeChDirMode=1
let NERDTreeIgnore=['\.pyc']

let g:session_autosave = 'no'

"vim-indent-guides
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=darkgrey


"ultisnips的配置 Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<c-m>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
