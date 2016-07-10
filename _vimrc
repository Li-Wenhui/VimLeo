" -----------------------------------------------------------------------------
"
" 我的 VIM/GVIM 配置文件，适用Windows和Linux环境
" 需要安装雅黑和consola 混合字库Microsoft_YaHei_Mono
"
" -----------------------------------------------------------------------------
" {{{
" Fn快捷键说明
"
" F1                         --
" F2                         --打开NERDTree [非插入模式]
" F3                         --打开/闭浏览窗口
" F4                         --后一个搜索项（Ctrl+f建立的搜索列表）
" SHIFT + F4                 --前一个搜索项（Ctrl+f建立的搜索列表）
" F5                         --打开浏览器
" F6                         --代码格式优化化
" F7                         --一键保存并编译
" F8                         --
" F9                         --一键保存并连接
" F10                        --一键保存、编译、连接存并运行
" F11                        --用于 Windows Gvim 全屏窗口切换
" F12                        --显示/隐藏菜单栏、工具栏、滚动条，可用  切换

" ---------- Ctrl系按键 ----------
"
" Ctrl + H                   --光标移当前行行首       [插入模式]
" Ctrl + J                   --光标移下一行行首       [插入模式]
" Ctrl + K                   --光标移上一行行尾       [插入模式]
" Ctrl + L                   --光标移当前行行尾       [插入模式]
" Ctrl + ↑                   --减少窗口透明度         [非插入模式]
" Ctrl + ↓                   --增加窗口透明度         [非插入模式]
" Ctrl + T                   --窗口置顶模式切换       [非插入模式]


" ---------- Alt系按键 ----------
"
" Alt  + H                   --光标左移一格           [插入模式] [Linux下可能失效]
" Alt  + J                   --光标下移一格           [插入模式] [Linux下可能失效]
" Alt  + K                   --光标上移一格           [插入模式] [Linux下可能失效]
" Alt  + L                   --光标右移一格           [插入模式] [Linux下可能失效]


" ---------- Multi Cursor ---------

" Alt + n                    --multi_cursor_next_key
" Alt + p                    --multi_cursor_prev_key
" Alt + x                    --multi_cursor_skip_key
" ECS                        --multi_cursor_quit_key

" ---------- Leader系按键 ----------
"

" \ec                        -- 开始拼写检查
" \en                        -- 跳转到下一个拼写错误处
" \ee                        -- 结束拼写检查

"
" \c                         --复制至公共剪贴板       [仅选择模式]
" \a                         --复制所有至公共剪贴板   [Normal模式可用]
" \v                         --从公共剪贴板粘贴       [全模式可用]
"
" \rb                        --一键去除所有尾部空白   [全模式可用]
" \rm                        --一键去除^M字符         [全模式可用]
" \rt                        --一键替换全部Tab为空格  [全模式可用]
" \ra                        --一键清理当前代码文件   [Normal模式可用]
"
" \r                         --替换: 不确认、非整词
" \rw                        --替换: 不确认、整词
" \rc                        --替换: 确认、非整词
" \rcw \rwc                  --替换: 确认、整词"
"
" \nt                        --打开/关闭NERDTree文件树窗口
" \tl                        --打开/关闭TagList窗口
" \tb                        --打开/关闭TagBar窗口
" \tc                        --执行ctags生成tags
"
" \tn                        --遍历同名标签
" \tp                        --反向遍历同名标签
" \sp                        --在工程内全局查找光标所在关键字
"
" \be                        --打开BufExplorer窗口    [独立显示] [Normal模式可用]
" \bs                        --打开BufExplorer窗口    [分割显示] [Normal模式可用]
" \bv                        --打开BufExplorer窗口    [边栏显示] [Normal模式可用]
"
" \fe                        --打开/关闭文件编码窗口  [Normal模式可用]
" \mp                        --生成Promptline脚本文件 [Normal模式可用]
"
" \gi                        --开启或关闭GitGutter    [Normal模式可用]
" \gd                        --打开Git文件对比模式    [Normal模式可用] [竖直]
" \gs                        --打开Git文件对比模式    [Normal模式可用] [水平]
"
" \il                        --显示/关闭对齐线        [Normal模式可用]
" \bb                        --按=号对齐代码          [Normal模式可用]
" \bn                        --自定义对齐             [Normal模式可用]
" \ev                        --编辑当前所使用的Vim配置文件
" \ss                        --source Vim配置文件
"
" \cc                        --添加行注释             [NERD_commenter]
" \cm                        --添加块注释             [NERD_commenter]
" \cu                        --取消注释               [NERD_commenter]
"
" \ud                        --调用 gundo 树

" ---------- 补全命令 ----------
"
" Ctrl + P                   --缓冲区补全             [插入模式]
" Ctrl + U                   --全能补全               [插入模式]
" Tab键                      --语法结构补全           [插入模式] [snipMate插件]

" ---------- 格式化命令 ----------
"
" ==                         --缩进当前行
" =G                         --缩进直到文件结尾
" gg=G                       --缩进整个文件
" 行号G=行号G                --缩进指定区间

" u [小写]                   --单步复原               [非插入模式]
" U [大写]                   --整行复原               [非插入模式]
" Ctrl + R                   --反撤消                 [非插入模式]
"
"
" ---------- 搜索命令 ----------
"
" #                          --向前搜索当前光标所在字符
" *                          --向后搜索当前光标所在字符
" ?                          --向前搜索
" /                          --向后搜索
"
" ---------- 替换命令 ----------
"
" :3,5s/regexp/repstr/[flags]  --替换3-5行的匹配内容
" :s/regexp/repstr/[flags]     --在当前行中替换
" :%s/regexp/repstr/[flags]    --全文替换匹配内容
" [flags]                      --g:替换所有匹配；gc:每次替换要求确认
"
" ---------- 跳转命令 ----------
"
" Ctrl + ]                   --转到函数定义           [ctags跳转]
" Ctrl + T                   --返回调用函数           [ctags跳转]

" Ctrl + O                   --跳到上一个编辑位置     [Normal模式]
" Ctrl + I                   --跳回下一个编辑位置     [Normal模式]

" 0 or ^ or $                --跳至 行首 or 第一个非空字符 or 行尾
" %                          --在匹配的括号间跳跃
" { or }                     --按段落上/下跳跃
" f字符                      --跳至从当前光标开始本行第一个指定字符出现的位置
" gd                         --跳至当前光标所在单词首次出现的位置
" gf                         --打开当前光标所在的文件名，如果确实存在该文件的话
"
" ]c                         --跳到下一个差异处
" [c                         --跳到上一个差异处
"
" [ Ctrl+D                   --跳至当前光标所在变量的首次定义位置 [从文件头部开始]
" [ Ctrl+I                   --跳至当前光标所在变量的首次出现位置 [从文件头部开始]
" [ D                        --列出当前光标所在变量的所有定义位置 [从文件头部开始]
" [ I                        --列出当前光标所在变量的所有出现位置 [从文件头部开始]
"
" ---------- 文本操作 ----------
"
" dw de d0 d^ d$ dd          --删除
" cw ce c0 c^ c$ cc          --删除并进入插入模式
" yw ye y0 y^ y$ yy          --复制
" vw ve v0 v^ v$ vv          --选中
"
" di分隔符                   --删除指定分隔符之间的内容 [不包括分隔符]
" ci分隔符                   --删除指定分隔符之间的内容并进入插入模式 [不包括分隔符]
" yi分隔符                   --复制指定分隔符之间的内容 [不包括分隔符]
" vi分隔符                   --选中指定分隔符之间的内容 [不包括分隔符]
"
" da分隔符                   --删除指定分隔符之间的内容 [包括分隔符]
" ca分隔符                   --删除指定分隔符之间的内容并进入插入模式 [包括分隔符]
" ya分隔符                   --复制指定分隔符之间的内容 [包括分隔符]
" va分隔符                   --选中指定分隔符之间的内容 [包括分隔符]
"
" Xi和Xa都可以在X后面加入一个数字，以指代所处理的括号层次
" 如 d2i( 执行的是删除当前光标外围第二层括号内的所有内容
"
" dt字符                     --删除本行内容，直到遇到第一个指定字符 [不包括该字符]
" ct字符                     --删除本行内容，直到遇到第一个指定字符并进入插入模式 [不包括该字符]
" yt字符                     --复制本行内容，直到遇到第一个指定字符 [不包括该字符]
" vt字符                     --选中本行内容，直到遇到第一个指定字符 [不包括该字符]
"
" df字符                     --删除本行内容，直到遇到第一个指定字符 [包括该字符]
" cf字符                     --删除本行内容，直到遇到第一个指定字符并进入插入模式 [包括该字符]
" yf字符                     --复制本行内容，直到遇到第一个指定字符 [包括该字符]
" vf字符                     --选中本行内容，直到遇到第一个指定字符 [包括该字符]
"
" XT 和 XF 是 Xt/Xf 的反方向操作
"
" cs'"                        --将外围的单引号变成双引号     [surround.vim插件]
" cs"<p>                      --将外围的双引号变成HTML标签对 [surround.vim插件]
" cst"                        --将外围的界定符变成双引号     [surround.vim插件]
" ds"                         --删除外围的双引号定界符       [surround.vim插件]
"
" ---------- 文本比较 ----------
"
" dp                         --将当前文件所在差异行替换到对比文件 [give]
" do                         --将对比文件所在差异行替换到当前文件 [get]
"
" ---------- 便捷操作 ----------
"
" Ctrl + A                   --将当前光标所在数字自增1        [仅普通模式可用]
" Ctrl + X                   --将当前光标所在数字自减1        [仅普通模式可用]
" :g/^/m0                    --将整个文件所有行排列顺序颠倒   [命令模式]
" m字符       and '字符      --标记位置 and 跳转到标记位置
" q字符 xxx q and @字符      --录制宏   and 执行宏
"
" ---------- 代码折叠 ----------
"
" za                         --打开或关闭当前折叠
" zA                         --循环地打开/关闭当前折叠
" (SpaceBar)                 --循环地打开/关闭当前折叠
" zM                         --关闭所有折叠
" zR                         --打开所有折叠
" zo                         --打开当前折叠
" zO                         --对所在范围内所有嵌套的折叠点展开
" zc                         --关闭当前折叠
" zC                         --对所在范围内所有嵌套的折叠点进行折叠
" [z                         --到当前打开的折叠的开始处
" ]z                         --到当前打开的折叠的末尾处
" zj                         --向下移动到后一个折叠的开始处
" zk                         --向上移动到前一个折叠的结束处

" Tab键                      --插入模式下的全功能语法结构补全 [snipMate插件]
" Shift + Insert             --向Vim中粘贴从别处复制的内容

" ---------- NERDTree [智能文件浏览器] ----------------
" :NERDTree                  --启动NERDTree插件
" o [小写]                   --切换当前文件或目录的打开、关闭状态
" u                          --打开上层目录
" p [小写]                   --返回上层目录
" P [大写]                   --返回根目录
" K                          --转到当前目录第一个节点
" J                          --转到当前目录最后的节点
" m                          --显示文件系统菜单 [增、删、移]
" ?                          --弹出帮助菜单
" q                          --退出该插件

" ------------------  [其他VIM快捷操作] ---------------------

" :set syntax=cpp            --手动选择语法高亮 [或 :set filetype=cpp]

" :%!xxd                     --转储二进制文件，以十六进制形式显示
" :%!xxd -r                  --还原二进制文件
" }}}


" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
" {{{
if(has("win32") || has("win64"))
  let g:isWindows = 1
  let g:isLinux = 0
else
  let g:isWindows = 0
  let g:isLinux = 1
endif
" }}}


" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
" {{{
if has("gui_running")
  let g:isGUI = 1
else
  let g:isGUI = 0
endif
" }}}


" -----------------------------------------------------------------------------
"  < 设置是否使用 vim_airline 插件 >
" -----------------------------------------------------------------------------
" {{{
let g:isAirLine = 1    "  1: 使用 vim_airline 插件
" let g:isAirLine = 0    "  0: 禁用 vim_airline 插件
" }}}


" =============================================================================
"                          << 以下为软件默认配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Windows Gvim 默认配置> 做了一点修改
" -----------------------------------------------------------------------------
" {{{
if (g:isWindows && g:isGUI)
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
  set diffexpr=MyDiff()

  function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction
endif
" }}}


" -----------------------------------------------------------------------------
"  < Linux Gvim/Vim 默认配置> 做了一点修改
" -----------------------------------------------------------------------------
" {{{
if g:isLinux
  set hlsearch        "高亮搜索
  set incsearch       "在输入要搜索的文字时，实时匹配

  " Uncomment the following to have Vim jump to the last position when
  " reopening a file
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif

  if g:isGUI
    " Source a global configuration file if available
    if filereadable("/etc/vim/gvimrc.local")
      source /etc/vim/gvimrc.local
    endif
  else
    " This line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian.
    runtime! debian.vim

    " Vim5 and later versions support syntax highlighting. Uncommenting the next
    " line enables syntax highlighting by default.
    if has("syntax")
      syntax on
    endif

    set mouse=a                    " 在任何模式下启用鼠标
    set t_Co=256                   " 在终端启用256色
    set backspace=2                " 设置退格键可用

    " Source a global configuration file if available
    if filereadable("/etc/vim/vimrc.local")
      source /etc/vim/vimrc.local
    endif
  endif
endif
" }}}


" =============================================================================
"                          << 以下为用户自定义配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"   自定义快捷键
" -----------------------------------------------------------------------------
" {{{
" Ctrl + ]            多选择跳转
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>

" Ctrl + U            简化全能补全按键
inoremap <C-u> <C-x><C-o>

" Ctrl + H            光标移当前行行首[插入模式]、切换左窗口[Normal模式]
inoremap <C-h> <ESC>I
noremap <C-h> <C-w><C-h>

" Ctrl + J            光标移下一行行首[插入模式]、切换下窗口[Normal模式]
inoremap <C-j> <ESC><down>I
noremap <C-j> <C-w><C-j>

" Ctrl + K            光标移上一行行尾[插入模式]、切换上窗口[Normal模式]
inoremap <C-k> <ESC><up>A
noremap <C-k> <C-w><C-k>

" Ctrl + L            光标移当前行行尾[插入模式]、切换右窗口[Normal模式]
inoremap <C-l> <ESC>A
noremap <C-l> <C-w><C-l>

" Alt  + H            光标左移一格
inoremap <m-h> <left>

" Alt  + J            光标下移一格
inoremap <m-j> <down>

" Alt  + K            光标上移一格
inoremap <m-k> <up>

" Alt  + L            光标右移一格
inoremap <m-l> <right>

" \c                  复制至公共剪贴板
vnoremap <Leader>c "+y

" \a                  复制所有至公共剪贴板
nnoremap <Leader>a <ESC>ggVG"+y<ESC>

" \v                  从公共剪贴板粘贴
inoremap <Leader>v <ESC>"+p
nnoremap <Leader>v "+p
vnoremap <Leader>v "+p

" \rb                 一键去除所有尾部空白
inoremap <Leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <Leader>rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vnoremap <Leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" \rm                 一键去除字符
inoremap <Leader>rm <ESC>:%s/<C-v><C-m>//g<CR>
nnoremap <Leader>rm :%s/<C-v><C-m>//g<CR>
vnoremap <Leader>rm <ESC>:%s/<C-v><C-m>//g<CR>

" \rt                 一键替换全部Tab为空格
func! RemoveTabs()
  if &shiftwidth == 2
    exec '%s/  /  /g'
  elseif &shiftwidth == 4
    exec '%s/  /    /g'
  elseif &shiftwidth == 6
    exec '%s/  /      /g'
  elseif &shiftwidth == 8
    exec '%s/  /        /g'
  else
    exec '%s/  / /g'
  end
endfunc

inoremap <Leader>rt <ESC>:call RemoveTabs()<CR>
nnoremap <Leader>rt :call RemoveTabs()<CR>
vnoremap <Leader>rt <ESC>:call RemoveTabs()<CR>

" \ra                 一键清理当前代码文件
nnoremap <Leader>ra <ESC>\rt<ESC>\rb<ESC>gg=G<ESC>gg<ESC>

" \ev                 编辑当前所使用的Vim配置文件
nnoremap <Leader>ev <ESC>:e $MYVIMRC<CR>

" \sv
nnoremap <Leader>sv <ESC>:source $MYVIMRC<CR>
" }}}


" -----------------------------------------------------------------------------
"  < Vundle 插件管理工具配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
" 安装方法为在终端输入如下命令
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 如果想在 windows 安装就必需先安装 "git for window"，可查阅网上资料

set nocompatible                                      "禁用 Vi 兼容模式
filetype off                                          "禁用文件类型侦测

if g:isLinux
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
else
  set rtp+=$VIM/vimfiles/bundle/vundle/
  call vundle#rc('$VIM/vimfiles/bundle/')
endif

" 使用Vundle来管理Vundle，这个必须要有。
Bundle 'gmarik/vundle'

" 以下为要安装或更新的插件
"
" quick commands to swtich between source files and header files
Bundle 'a.vim'

" align statements on given signs
Bundle 'Align'

" Insert or delete brackets, parens, quotes in pair
Bundle 'jiangmiao/auto-pairs'

" quickly and easily switch between buffers
Bundle 'bufexplorer.zip'

" convenice way to use ctags and cscope in vim
Bundle 'ccvext.vim'

" displaying thin vertical lines at each indentation level
Bundle 'Yggdroot/indentLine'

" highlight several words in different colors simultaneously
Bundle 'Mark--Karkat'

" keyword completion
Bundle 'Shougo/neocomplete'

" 代码快速注释插件
Bundle 'scrooloose/nerdcommenter'

" 树形目录插件
Bundle 'scrooloose/nerdtree'

" 变量或函数的自动弹出与补全
Bundle 'OmniCppComplete'

" 代码块的自动补全
Bundle 'msanders/snipmate.vim'

" 代码块的自动补全
Bundle 'drmingdrmer/xptemplate'

" 显示跳转函数及变量定义
Bundle 'wesleyche/SrcExpl'

" A Standard C syntax
Bundle 'std_c.zip'

" 快速切换括号/引号或者标签
Bundle 'tpope/vim-surround'

" 书签可视化  
Bundle 'kshenoy/vim-signature'

" 语法与编码风格检查
Bundle 'scrooloose/syntastic'

" 源文件浏览标签
Bundle 'majutsushi/tagbar'

" 显示定位程序中各种符号
Bundle 'taglist.vim'

" 对文件进行模糊查找
Bundle 'ctrlpvim/ctrlp.vim'

" 窗口全屏缩放
Bundle 'ZoomWin'

" Markdown语法高亮
Bundle 'tpope/vim-markdown'

" markdown实时预览
Bundle 'iamcco/markdown-preview.vim'

" 括号显示增强
Bundle 'kien/rainbow_parentheses.vim'

" 对齐插件
Bundle 'junegunn/vim-easy-align'

" 匹配成对的标签
Bundle 'edsono/vim-matchit'

" Latex
Bundle 'edsono/vim-latex'

" 多重选取
Bundle 'terryma/vim-multiple-cursors'

" 跳转到光标后任意位置
Bundle 'Lokaltog/vim-easymotion'

" 输入查找内容的同时进行匹配
Bundle 'haya14busa/incsearch.vim'

" 选择区域扩展按键映射
Bundle 'terryma/vim-expand-region'

" git托管、diff或者其他任务
Bundle 'tpope/vim-fugitive'

" 给插件增加文件类型图标显示
Bundle 'ryanoasis/vim-devicons'

" 状态栏增强插件
if (g:isAirLine)
  Bundle 'vim-airline/vim-airline'
endif

" syntax highlighting for C-like languages
Bundle 'cSyntaxAfter'
Bundle 'octol/vim-cpp-enhanced-highlight'  

" switch between .h and .cpp
Bundle 'derekwyatt/vim-fswitch'

" 自动生成标签并引入
Bundle 'vim-scripts/indexer.tar.gz'
Bundle 'vim-scripts/DfrankUtil'
Bundle 'vim-scripts/vimprj'

" powered code search and view tool
Bundle 'mileszs/ack.vim'
Bundle 'dyng/ctrlsf.vim'
Bundle 'derekwyatt/vim-protodef'

" plain text browser
Bundle 'TxtBrowser'

" 编辑修改撤销管理
Bundle 'sjl/gundo.vim'

" 更改开始界面
Bundle 'mhinz/vim-startify'

"  显示主题
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'gosukiwi/vim-atom-dark'
" }}}


" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" {{{
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8                                    "设置gvim内部编码
set fileencoding=utf-8                                "设置当前文件编码
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码

" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新文件的<EOL>格式
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

if (g:isWindows && g:isGUI)
  "解决菜单乱码
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

  "解决consle输出乱码
  language messages zh_CN.utf-8
endif

" 防止菜单乱码
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif

set helplang=cn                                       "中文帮助
" }}}


" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
" {{{
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype indent on                                    "针对不同的文件类型采用不同的缩进
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=2                                         "设置Tab键的宽度为2个空格
set shiftwidth=2                                      "换行时自动缩进2个空格
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格
set foldenable                                        "启用折叠
set foldlevel=9999                                    "打开后不自动折叠
set foldmethod=indent                                 "indent 折叠方式
" set foldmethod=marker                               "marker 折叠方式
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> "用空格键来开关折叠
set clipboard+=unnamed                                " 与windows共享剪贴板

set autoread                                          "当文件在外部被修改，自动更新该文件
"set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，
"只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
" set noincsearch                                       "在输入要搜索的文字时，取消实时匹配

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
" }}}


" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
" {{{
set number                                          "显示行号
set showcmd                                         "输入的命令显示出来
set laststatus=2                                    "启用状态栏信息
set cmdheight=2                                     "设置命令行的高度为2，默认为1
set cursorline                                      "突出显示当前行
" set cursorcolumn                                  "高亮突出当前列

if g:isGUI
  set showtabline=2                                 "始终显示标签页, =0 隐藏Tab栏
  set guitablabel=%{tabpagenr()}.%t\ %m             "在每个tab上显示编号
  "  set guifont=Microsoft_YaHei_Mono:h12           "设置字体:字号（字体名称空格用下划线代替）

  augroup ex_gui_font
    " check and determine the gui font after GUIEnter.
    " NOTE: getfontname function only works after GUIEnter.
    au!
    au GUIEnter * call s:set_gui_font()
  augroup END

  " set guifont
  function! s:set_gui_font()
    if(g:isWindows)
      if getfontname( 'Microsoft YaHei Mono' ) != ''
        set guifont=Microsoft_YaHei_Mono:h12
      elseif getfontname( 'Consolas' ) != ''
        set guifont=Consolas:h12
      endif
    else
      if getfontname( 'Microsoft YaHei Mono' ) != ''
          set guifont=Microsoft\ YaHei\ Mono\ h12
      elseif getfontname( 'DejaVu Sans Mono' ) != ''
        set guifont=DejaVu\ Sans\ Mono\ 12
      endif
    endif
  endfunction
endif

"set nowrap                                          "设置不自动换行
set wrap                                            "设置自动换行
set shortmess=atI                                   "启动的时候不显示援助索马里儿童的提示
"set guicursor=a:blinkon0                                  "禁止光标闪烁
set virtualedit=onemore

" 设置 gVim 窗口初始位置及大小
if g:isGUI
  " au GUIEnter * simalt ~x                         "窗口启动时自动最大化
  winpos 100 10                                     "指定窗口出现的位置，坐标原点在屏幕左上角
  set lines=42 columns=120                          "指定窗口大小，lines为高度，columns为宽度
endif

" 设置配色方案
  " set background=light
  set background=dark
  colorscheme atom-dark
  " colorscheme solarized

" }}}


" 显示/隐藏菜单栏、工具栏、滚动条，可用 F12 切换 
" {{{
if g:isGUI
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=l  " remove left-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar even if there is a vertical split
  set guioptions-=b  " remove bottom scroll bar
  noremap <silent> <F12> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=l <Bar>
        \set guioptions-=L <Bar>
        \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions-=l <Bar>
        \set guioptions+=L <Bar>
        \endif<CR>
endif
" }}}


" 个性化状栏（这里提供两种方式，要使用其中一种去掉注释即可，不使用反之）
" 在使用AirLine时，这个设置无效，应修改AirLine设置
" {{{
if (!g:isAirLine)

  " 状态栏颜色配置
  function! InsertStatuslineColor(mode)
    if a:mode == 'i'
      hi statusline guibg=blue
    elseif a:mode == 'r'
      hi statusline guibg=magenta
    else
      hi statusline guibg=red
    endif
  endfunction

  au InsertEnter * call InsertStatuslineColor(v:insertmode)
  au InsertChange * call InsertStatuslineColor(v:insertmode)
  au InsertLeave * hi statusline guibg=black

  " default the statusline to black when entering Vim
  hi statusline guibg=black

  " 状态栏显示内容配置
  " set statusline=%F%m%r%h%w\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
  set statusline=%t\ %m\ %r\ %h%w\ %=[%l/%L(%p%%),%c%V]\ [%b:0x%B]\ [%{&ft==''?'TEXT':toupper(&ft)},%{toupper(&ff)},%{toupper(&fenc!=''?&fenc:&enc)}%{&bomb?',BOM':''}%{&eol?'':',NOEOL'}]%{strftime(\"\ [%d/%m/%y-%H:%M]\")}
endif
" }}}


" -----------------------------------------------------------------------------
"  < 其它配置 >
" -----------------------------------------------------------------------------
" {{{
set writebackup                             "保存文件前建立备份，保存成功后删除该备份
set nobackup                                "设置无备份文件
set undofile                                "使用撤销缓存文件
set undodir=$VIM/undodir                    "撤销缓存文件位置
set undolevels=100                          "最大撤销数
" set noswapfile                              "设置无临时文件
" set vb t_vb=                                "关闭提示音
set list
set listchars=tab:\|\ ,trail:~,extends:>,precedes:<   "将tab显示为可见字符|

set wildmenu                                          " 在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个单行菜单形式显示出来。
set wildmode=list:longest,full                        " <Tab> 命令补全, 显示匹配列表.
" =<空>  只用第一个匹配补全。
" =full  用下一个完整的匹配补全。在最后一次匹配之后，使用原来的字符串，然后又是第一个匹配。
" =longest  用最长的公共子串补全。如果结果没有变长，使用下一个部分。
" =longest:full  类似于longest，但如果wildmenu打开的话，使用之。
" =list  如果有多于一个补全，列出所有的匹配。
" =list:full  如果有多于一个补全，列出所有的匹配并先用第一个补全。
" =list:longest 如果有多于一个补全，列出所有的匹配并先用最长的子串补全。
set whichwrap=b,s,h,l,<,>,[,]                         " 开启Backspace等按键到头自动折向下一行的功能

" English Spelling Checker settings
" \ec               (engspchk's startup map)
" \en               (jump to next spelling error)
" \ee               (end engspchk)
set mouse=n                                           " (or set mouse=a)
let g:spchkmouse   = 1
let g:spchkautonext= 1
let g:spchkdialect = "usa"                            " (or "can" or "uk")
" }}}


" =============================================================================
"                     自定义操作
" =============================================================================

" -----------------------------------------------------------------------------
"新建.c,.h,.sh,.java文件，自动插入文件头
" -----------------------------------------------------------------------------
" {{{
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func! SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call setline(1,          "\###############################################################################")
    call append(line("."),   "\# File Name: ".expand("%"))
    call append(line(".")+1, "\# Author: ")
    call append(line(".")+2, "\# E-Mail: ")
    call append(line(".")+3, "\# Date: ".strftime("%Y-%m-%d"))
    call append(line(".")+4, "\###############################################################################")
    call append(line(".")+5, "\#!/bin/bash")
    call append(line(".")+6, "")
  elseif &filetype == 'python'
    call append(line("."),   "\#-*- coding:utf-8 -*-")
    call append(line(".")+1, "\#Filename: ".expand("%"))
    call append(line(".")+2, "\#Author: ")
    call append(line(".")+3, "\#E-Mail: ")
    call append(line(".")+4, "\#Date: ".strftime("%Y-%m-%d"))
    call append(line(".")+5, "\#Description: ")
    call append(line(".")+6, "")
  endif

  "新建文件后，自动定位到文件末尾
  autocmd BufNewFile * normal G
endfunc
" }}}


" -----------------------------------------------------------------------------
" 替换函数
" -----------------------------------------------------------------------------
" {{{
" 参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
  wa
  let flag = ''
  if a:confirm
    let flag .= 'gec'
  else
    let flag .= 'ge'
  endif
  let search = ''
  if a:wholeword
    let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
  else
    let search .= expand('<cword>')
  endif
  let replace = escape(a:replace, '/\&~')
  execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

" \r 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" \rw 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" \rc 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" \rcw \rwc 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" }}}


"-----------------------------------------------------------------------------
":针对部分语言本地词典文件设置
"-----------------------------------------------------------------------------
" {{{
au FileType c          call AddCDict()
au FileType cpp        call AddCPPDict()
au FileType java       call AddJavaDict()
au FileType lua        call AddLuaDict()
au FileType perl       call AddPerlDict()
au FileType php        call AddPHPDict()
au FileType python     call AddPythonDict()
au FileType ruby       call AddRubyDict()
au FileType javascript call AddJavaScriptDict()
au FileType coffee     call AddJavaScriptDict()
au FileType typescript call AddJavaScriptDict()
au FileType ls         call AddJavaScriptDict()
au FileType css        call AddCSSDict()
au FileType scss       call AddCSSDict()
au FileType less       call AddCSSDict()

function AddCDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/c.dict
  else
    set dict+=~/.vim/dict/c.dict
  endif
  set complete+=k
endfunction

function AddCPPDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/cpp.dict
    set dict+=$VIM/vimfiles/dict/cpp-stdlib.dict
    set dict+=$VIM/vimfiles/dict/cpp-boost.dict
  else
    set dict+=~/.vim/dict/cpp.dict
    set dict+=~/.vim/dict/cpp-stdlib.dict
    set dict+=~/.vim/dict/cpp-boost.dict
  endif
  set complete+=k
endfunction

function AddJavaDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/java.dict
  else
    set dict+=~/.vim/dict/java.dict
  endif
  set complete+=k
endfunction

function AddLuaDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/lua.dict
  else
    set dict+=~/.vim/dict/lua.dict
  endif
  set complete+=k
endfunction

function AddPerlDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/perl.dict
  else
    set dict+=~/.vim/dict/perl.dict
  endif
  set complete+=k
endfunction

function AddPHPDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/php.dict
  else
    set dict+=~/.vim/dict/php.dict
  endif
  set complete+=k
endfunction

function AddPythonDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/python.dict
  else
    set dict+=~/.vim/dict/python.dict
  endif
  set complete+=k
endfunction

function AddRubyDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/ruby.dict
  else
    set dict+=~/.vim/dict/ruby.dict
  endif
  set complete+=k
endfunction

function AddJavaScriptDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/javascript.dict
  else
    set dict+=~/.vim/dict/javascript.dict
  endif
  set complete+=k
endfunction

function AddCSSDict()
  if g:isWindows
    set dict+=$VIM/vimfiles/dict/css.dict
  else
    set dict+=~/.vim/dict/css.dict
  endif
  set complete+=k
endfunction
" }}}


" -----------------------------------------------------------------------------
"  < 显示.NFO文件 >
" -----------------------------------------------------------------------------
" {{{
function! SetFileEncodings(encodings)
  let b:myfileencodingsbak=&fileencodings
  let &fileencodings=a:encodings
endfunction

function! RestoreFileEncodings()
  let &fileencodings=b:myfileencodingsbak
  unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()
" }}}


" -----------------------------------------------------------------------------
"  < 单文件编译、连接、运行配置 >
" -----------------------------------------------------------------------------
" {{{
" 以下只做了 C、C++ 的单文件配置，其它语言可以参考以下配置增加

" F7 一键保存并编译
noremap <F7> :call Compile()<CR>
inoremap <F7> <ESC>:call Compile()<CR>

" F9 一键保存并连接
noremap <F9> :call Link()<CR>
inoremap <F9> <ESC>:call Link()<CR>

" F10 一键保存、编译、连接存并运行
noremap <F10> :call Run()<CR>
inoremap <F10> <ESC>:call Run()<CR>

let s:LastShellReturn_C = 0
let s:LastShellReturn_L = 0
let s:ShowWarning = 1
let s:Obj_Extension = '.o'
let s:Exe_Extension = '.exe'
let s:Sou_Error = 0

let s:windows_CFlags = 'gcc\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CFlags = 'gcc\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:windows_CPPFlags = 'g++\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CPPFlags = 'g++\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

func! Compile()
  exe ":ccl"
  exe ":update"
  let s:Sou_Error = 0
  let s:LastShellReturn_C = 0
  let Sou = expand("%:p")
  let v:statusmsg = ''
  if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
    let Obj = expand("%:p:r").s:Obj_Extension
    let Obj_Name = expand("%:p:t:r").s:Obj_Extension
    if !filereadable(Obj) || (filereadable(Obj) && (getftime(Obj) < getftime(Sou)))
      redraw!
      if expand("%:e") == "c"
        if g:isWindows
          exe ":setlocal makeprg=".s:windows_CFlags
        else
          exe ":setlocal makeprg=".s:linux_CFlags
        endif
        echohl WarningMsg | echo " compiling..."
        silent make
      elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
        if g:isWindows
          exe ":setlocal makeprg=".s:windows_CPPFlags
        else
          exe ":setlocal makeprg=".s:linux_CPPFlags
        endif
        echohl WarningMsg | echo " compiling..."
        silent make
      endif
      redraw!
      if v:shell_error != 0
        let s:LastShellReturn_C = v:shell_error
      endif
      if g:isWindows
        if s:LastShellReturn_C != 0
          exe ":bo cope"
          echohl WarningMsg | echo " compilation failed"
        else
          if s:ShowWarning
            exe ":bo cw"
          endif
          echohl WarningMsg | echo " compilation successful"
        endif
      else
        if empty(v:statusmsg)
          echohl WarningMsg | echo " compilation successful"
        else
          exe ":bo cope"
        endif
      endif
    else
      echohl WarningMsg | echo ""Obj_Name"is up to date"
    endif
  else
    let s:Sou_Error = 1
    echohl WarningMsg | echo " please choose the correct source file"
  endif
  exe ":setlocal makeprg=make"
endfunc

func! Link()
  call Compile()
  if s:Sou_Error || s:LastShellReturn_C != 0
    return
  endif
  if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
    let s:LastShellReturn_L = 0
    let Sou = expand("%:p")
    let Obj = expand("%:p:r").s:Obj_Extension
    if g:isWindows
      let Exe = expand("%:p:r").s:Exe_Extension
      let Exe_Name = expand("%:p:t:r").s:Exe_Extension
    else
      let Exe = expand("%:p:r")
      let Exe_Name = expand("%:p:t:r")
    endif
    let v:statusmsg = ''
    if filereadable(Obj) && (getftime(Obj) >= getftime(Sou))
      redraw!
      if !executable(Exe) || (executable(Exe) && getftime(Exe) < getftime(Obj))
        if expand("%:e") == "c"
          setlocal makeprg=gcc\ -o\ %<\ %<.o
          echohl WarningMsg | echo " linking..."
          silent make
        elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
          setlocal makeprg=g++\ -o\ %<\ %<.o
          echohl WarningMsg | echo " linking..."
          silent make
        endif
        redraw!
        if v:shell_error != 0
          let s:LastShellReturn_L = v:shell_error
        endif
        if g:isWindows
          if s:LastShellReturn_L != 0
            exe ":bo cope"
            echohl WarningMsg | echo " linking failed"
          else
            if s:ShowWarning
              exe ":bo cw"
            endif
            echohl WarningMsg | echo " linking successful"
          endif
        else
          if empty(v:statusmsg)
            echohl WarningMsg | echo " linking successful"
          else
            exe ":bo cope"
          endif
        endif
      else
        echohl WarningMsg | echo ""Exe_Name"is up to date"
      endif
    endif
    setlocal makeprg=make
  endif
endfunc

func! Run()
  let s:ShowWarning = 0
  call Link()
  let s:ShowWarning = 1
  if s:Sou_Error || s:LastShellReturn_C != 0 || s:LastShellReturn_L != 0
    return
  endif
  let Sou = expand("%:p")
  if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
    let Obj = expand("%:p:r").s:Obj_Extension
    if g:isWindows
      let Exe = expand("%:p:r").s:Exe_Extension
    else
      let Exe = expand("%:p:r")
    endif
    if executable(Exe) && getftime(Exe) >= getftime(Obj) && getftime(Obj) >= getftime(Sou)
      redraw!
      echohl WarningMsg | echo " running..."
      if g:isWindows
        exe ":!%<.exe"
      else
        if g:isGUI
          exe ":!gnome-terminal -x bash -c './%<; echo; echo 请按 Enter 键继续; read'"
        else
          exe ":!clear; ./%<"
        endif
      endif
      redraw!
      echohl WarningMsg | echo " running finish"
    endif
  endif
endfunc
" }}}


" -----------------------------------------------------------------------------
" F6 代码格式优化化
" -----------------------------------------------------------------------------
" {{{
nnoremap <F6> :call FormartSrc()<CR><CR>
inoremap <F6> <ESC>:call FormartSrc()<CR>

func! FormartSrc()
  exec ":update"
  if &filetype == 'c' || &filetype == 'h'
    exec "!astyle --style=allman  -f -X -U -Q -s4 -S -N -L -m0 -M40 --convert-tabs --suffix=none %"
  elseif &filetype == 'cpp' || &filetype == 'hpp'
    exec "!astyle --style=allman  -f -X -U -Q -s4 -S -N -L -m0 -M40 --convert-tabs --suffix=none %""
  elseif &filetype == 'perl'
    exec "!astyle --style=allman -s4 --suffix=none %"
  elseif &filetype == 'py'||&filetype == 'python'
    exec "r !autopep8 -i --aggressive %"
  elseif &filetype == 'java'
    exec "!astyle --style=java -s4 --suffix=none %"
  elseif &filetype == 'jsp'
    exec "!astyle --style=java -s4 --suffix=none %"
  elseif &filetype == 'xml'
    exec "!astyle --style=allman -s4 --suffix=none %"
  else
    exec "normal gg=G"
    return
  endif
  exec "e! %"
endfunc
" }}}

" Load doxygen syntax file for c/cpp/idl files
let load_doxygen_syntax=1


" -----------------------------------------------------------------------------
"  < 在浏览器中预览 Html 或 PHP 文件 >
" {{{
" -----------------------------------------------------------------------------
" 修改前请先通读此模块，明白了再改以避免错误

" F5 加浏览器名称缩写调用浏览器预览，启用前先确定有安装相应浏览器，并在下面的配置好其安装目录
if g:isWindows
  "以下为只支持Windows系统的浏览器

  " 调用系统IE浏览器预览，如果已卸载可将其注释
  nnoremap <F5>ie :call ViewInBrowser("ie")<CR>
  inoremap <F5>ie <ESC>:call ViewInBrowser("ie")<CR>

  " 调用IETester(IE测试工具)预览，如果有安装可取消注释
  " nnoremap <F5>ie6 :call ViewInBrowser("ie6")<CR>
  " inoremap <F5>ie6 <ESC>:call ViewInBrowser("ie6")<CR>
  " nnoremap <F5>ie7 :call ViewInBrowser("ie7")<CR>
  " inoremap <F5>ie7 <ESC>:call ViewInBrowser("ie7")<CR>
  " nnoremap <F5>ie8 :call ViewInBrowser("ie8")<CR>
  " inoremap <F5>ie8 <ESC>:call ViewInBrowser("ie8")<CR>
  " nnoremap <F5>ie9 :call ViewInBrowser("ie9")<CR>
  " inoremap <F5>ie9 <ESC>:call ViewInBrowser("ie9")<CR>
  " nnoremap <F5>ie10 :call ViewInBrowser("ie10")<CR>
  " inoremap <F5>ie10 <ESC>:call ViewInBrowser("ie10")<CR>
  " nnoremap <F5>iea :call ViewInBrowser("iea")<CR>
  " inoremap <F5>iea <ESC>:call ViewInBrowser("iea")<CR>
elseif g:isLinux
  "以下为只支持Linux系统的浏览器
  "暂未配置，待有时间再弄了
endif

"以下为支持Windows与Linux系统的浏览器

" 调用Firefox浏览器预览，如果有安装可取消注释
nnoremap <F5>ff :call ViewInBrowser("ff")<CR>
inoremap <F5>ff <ESC>:call ViewInBrowser("ff")<CR>

" 调用Maxthon(遨游)浏览器预览，如果有安装可取消注释
" nnoremap <F5>ay :call ViewInBrowser("ay")<CR>
" inoremap <F5>ay <ESC>:call ViewInBrowser("ay")<CR>

" 调用Opera浏览器预览，如果有安装可取消注释
" nnoremap <F5>op :call ViewInBrowser("op")<CR>
" inoremap <F5>op <ESC>:call ViewInBrowser("op")<CR>

" 调用Chrome浏览器预览，如果有安装可取消注释
nnoremap <F5>cr :call ViewInBrowser("cr")<CR>
inoremap <F5>cr <ESC>:call ViewInBrowser("cr")<CR>

" 浏览器调用函数
function! ViewInBrowser(name)
  if expand("%:e") == "php" || expand("%:e") == "html"
    exe ":update"
    if g:isWindows
      "获取要预览的文件路径，并将路径中的'\'替换为'/'，同时将路径文字的编码转换为gbk（同cp936）
      let file = iconv(substitute(expand("%:p"), '\', '/', "g"), "utf-8", "gbk")

      "浏览器路径设置，路径中使用'/'斜杠，更改路径请更改双引号里的内容
      "下面只启用了系统IE浏览器，如需启用其它的可将其取消注释（得先安装，并配置好安装路径），也可按需增减
      " let SystemIE = "C:/progra~1/intern~1/iexplore.exe"  "系统自带IE目录
      " let IETester = "F:/IETester/IETester.exe"           "IETester程序目录（可按实际更改）
      let Chrome = "C:/Users/leo/AppData/Local/Google/Chrome/Application/chrome.exe"                 "Chrome程序目录（可按实际更改）
      " let Firefox = "D:/PortarbleStartup/yangguangheziFirefox/Firefox/firefox.exee"              "Firefox程序目录（可按实际更改）
      " let Opera = "F:/Opera/opera.exe"                    "Opera程序目录（可按实际更改）
      " let Maxthon = "C:/Progra~2/Maxthon/Bin/Maxthon.exe" "Maxthon程序目录（可按实际更改）

      "本地虚拟服务器设置，我测试的是phpStudy2014，可根据自己的修改，更改路径请更改双引号里的内容
      " let htdocs ="F:/phpStudy2014/WWW/"                  "虚拟服务器地址或目录（可按实际更改）
      " let url = "localhost"                               "虚拟服务器网址（可按实际更改）
    elseif g:isLinux
      "暂时还没有配置，有时间再弄了。
    endif

    "浏览器调用缩写，可根据实际增减，注意，上面浏览器路径中没有定义过的变量（等号右边为变量）不能出现在下面哟（可将其注释或删除）
    let l:browsers = {}                             "定义缩写字典变量，此行不能删除或注释
    let l:browsers["cr"] = Chrome                   "Chrome浏览器缩写
    " let l:browsers["ff"] = Firefox                  "Firefox浏览器缩写
    " let l:browsers["op"] = Opera                    "Opera浏览器缩写
    " let l:browsers["ay"] = Maxthon                  "遨游浏览器缩写
    " let l:browsers["ie"] = SystemIE                 "系统IE浏览器缩写
    " let l:browsers["ie6"] = IETester."-ie6"         "调用IETESTER工具以IE6预览缩写（变量加参数）
    " let l:browsers["ie7"] = IETester."-ie7"         "调用IETESTER工具以IE7预览缩写（变量加参数）
    " let l:browsers["ie8"] = IETester."-ie8"         "调用IETESTER工具以IE8预览缩写（变量加参数）
    " let l:browsers["ie9"] = IETester."-ie9"         "调用IETESTER工具以IE9预览缩写（变量加参数）
    " let l:browsers["ie10"] = IETester."-ie10"       "调用IETESTER工具以IE10预览缩写（变量加参数）
    " let l:browsers["iea"] = IETester."-al"          "调用IETESTER工具以支持的所有IE版本预览缩写（变量加参数）

    if stridx(file, htdocs) == -1   "文件不在本地虚拟服务器目录，则直接预览（但不能解析PHP文件）
      exec ":silent !start ". l:browsers[a:name] ." file://" . file
    else    "文件在本地虚拟服务器目录，则调用本地虚拟服务器解析预览（先启动本地虚拟服务器）
      let file = substitute(file, htdocs, "http://".url."/", "g")    "转换文件路径为虚拟服务器网址路径
      exec ":silent !start ". l:browsers[a:name] file
    endif
  else
    echohl WarningMsg | echo " please choose the correct source file"
  endif
endfunction
" }}}


" =============================================================================
"                          << 以下为常用插件配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  <calendar 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" :Calendar   ---显示日历窗口
" calendar 日记存储位置
if (g:isWindows)
  let g:calendar_diary = "~/diary"
else
  let g:calendar_diary = "~/diary"
endif
" }}}


" -----------------------------------------------------------------------------
"  <c-suport 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 设置 c-suport 插件支持 cmake or doxygen
let g:c_UseTool_cmake   = 'yes'
let g:c_UseTool_doxygen = 'yes'
" }}}


" -----------------------------------------------------------------------------
"  < a.vim 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于切换C/C++头文件
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
" }}}


" -----------------------------------------------------------------------------
"  < Align 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多
" }}}


" -----------------------------------------------------------------------------
"  < auto-pairs 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于括号与引号自动补全，不过会与函数原型提示插件echofunc冲突
" 所以我就没有加入echofunc插件
" }}}


" -----------------------------------------------------------------------------
"  < BufExplorer 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 快速轻松的在缓存中切换（相当于另一种多个文件间的切换方式）
" <Leader>be 在当前窗口显示缓存列表并打开选定文件
" <Leader>bs 水平分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件
" <Leader>bv 垂直分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件
let g:bufExplorerSortBy = 'name'               " 按文件名排序
" }}}


" -----------------------------------------------------------------------------
"  < ccvext.vim 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于对指定文件自动生成tags与cscope文件并连接
" 如果是Windows系统, 则生成的文件在源文件所在盘符根目录的.symbs目录下(如: X:\.symbs\)
" 如果是Linux系统, 则生成的文件在~/.symbs/目录下
" 具体用法可参考www.vim.org中此插件的说明
" <Leader>gs 自动生成tags与cscope文件并连接
" <Leader>cs 连接已存在的tags与cscope文件
" }}}


" -----------------------------------------------------------------------------
"  < cSyntaxAfter 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 高亮括号与运算符等
"au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()
" }}}


" -----------------------------------------------------------------------------
"  < ctrlp.vim 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件；详细帮助见 :h ctrlp
" 常规模式下输入：Ctrl + p 调用插件
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
noremap <Leader>f :CtrlPMRU<CR>
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
      \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
      \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" }}}


" -----------------------------------------------------------------------------
"  < nerdcommenter 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 我主要用于C/C++代码注释(其它的也行)
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
let NERDSpaceDelims = 1                     "自动在左注释符之后，右注释符之前留有空格
" }}}


" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 有目录村结构的文件浏览插件
let g:NERDTreeShowHidden = 1                   " 显示隐藏文件

" 常规模式下输入 F2 调用插件
nnoremap <F2> :NERDTreeToggle<CR>
" \nt  打开文件树窗口，在左侧栏显示 [NERDTree插件]
nnoremap <Leader>nt :NERDTree<CR>

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
" 设置图标显示效果
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeDirArrows=0
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1
" }}}


" -----------------------------------------------------------------------------
"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" \il  显示/关闭对齐线
nnoremap <Leader>il :IndentLinesToggle<CR>

" 设置Gvim的对齐线样式
if g:isGUI
  let g:indentLine_char = "|"
  let g:indentLine_first_char = "|"
endif

" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 239

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'
" }}}


" -----------------------------------------------------------------------------
"  < Mark--Karkat（也就是 Mark） 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 给不同的单词高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt
" }}}


" -----------------------------------------------------------------------------
"  < MiniBufExplorer 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 快速浏览和操作Buffer
" 主要用于同时打开多个文件并相与切换

"let g:miniBufExplMapWindowNavArrows = 1     "用Ctrl加方向键切换到上下左右的窗口中去
"let g:miniBufExplMapWindowNavVim = 1        "用<C-k,j,h,l>切换到上下左右的窗口中去
"let g:miniBufExplMapCTabSwitchBufs = 1      "功能增强（不过好像只有在Windows中才有用）
" "                                            <C-Tab> 向前循环切换到每个buffer上,并在但前窗口打开
" "                                            <C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开

" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
" }}}


" -----------------------------------------------------------------------------
"  < neocomplete 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。
" Enable omni completion.
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" }}}


" -----------------------------------------------------------------------------
"  < omnicppcomplete 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于C/C++代码补全，这种补全主要针对命名空间、类、结构、共同体等进行补全，详细
" 说明可以参考帮助或网络教程等
" 使用前先执行如下 ctags 命令（本配置中可以直接使用 ccvext 插件来执行以下命令）
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
" 我使用上面的参数生成标签后，对函数使用跳转时会出现多个选择
" 定义快捷键 \tc
noremap <Leader>tc :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
set completeopt=menu                " 关闭预览窗口
let OmniCpp_MayCompleteDot = 1   " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
" }}}


" -----------------------------------------------------------------------------
" rainbow_parentheses括号显示增强
" -----------------------------------------------------------------------------
" {{{
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}


" ----------------------------------------------------------------------------
" vim-easy-align快速赋值语句对齐 \a
" ----------------------------------------------------------------------------
" {{{
vnoremap <Leader>a <Plug>(EasyAlign)
nnoremap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" }}}


" -----------------------------------------------------------------------------
"  < vim_airline 插件配置 >
" -----------------------------------------------------------------------------
" {{{
"设置状态栏符号显示"
let g:airline_powerline_fonts = 1
" let g:airline_symbols = {}
" let g:airline_left_sep = ""
" let g:airline_left_alt_sep = ">"
" let g:airline_right_sep = ""
" let g:airline_right_alt_sep = "<"
" let g:airline_symbols.branch = ""
" let g:airline_symbols.readonly = "R"
" let g:airline_symbols.linenr = ""
" }}}


" -----------------------------------------------------------------------------
"  < repeat 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 主要用"."命令来重复上次插件使用的命令
" }}}


" -----------------------------------------------------------------------------
"  < snipMate 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于各种代码补全，这种补全是一种对代码中的词与代码块的缩写补全，详细用法可以参
" 考使用说明或网络教程等。不过有时候也会与 supertab 插件在补全时产生冲突，如果大
" 侠有什么其它解决方法希望不要保留呀
" }}}


" -----------------------------------------------------------------------------
"  < XPTemplate 插件配置 >
" -----------------------------------------------------------------------------
" {{{
let g:xptemplate_key = '<Tab>'
let g:xptemplate_vars = "SPcmd=&BRloop=\n"
let g:xptemplate_vars = "BRfun= "
let g:xptemplate_vars = "author=Leo&email=lwh@vip.163.com&..."
let g:xptemplate_minimal_prefix = 0
" }}}


" -----------------------------------------------------------------------------
"  < SrcExpl 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 增强源代码浏览，其功能就像Windows中的"Source Insight"
nnoremap <F3> :SrcExplToggle<CR>                "打开/闭浏览窗口
" }}}


" -----------------------------------------------------------------------------
"  < std_c 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于增强C语法高亮

" 启用 // 注视风格
let c_cpp_comments = 0
" }}}


" -----------------------------------------------------------------------------
"  < surround 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 快速给单词/句子两边增加符号（包括html标签），缺点是不能用"."来重复命令
" 不过 repeat 插件可以解决这个问题，详细帮助见 :h surround.txt
" }}}


" -----------------------------------------------------------------------------
"  < vim-signature 插件配置 >
" -----------------------------------------------------------------------------
" {{{
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
" }}}

" -----------------------------------------------------------------------------
"  < Syntastic 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 多语言语法检查
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1

" 最轻量
" let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes

" 中等
" error code: http://pep8.readthedocs.org/en/latest/intro.html#error-codes
let g:syntastic_python_checkers=['pyflakes', 'pep8'] " 使用pyflakes,速度比pylint快
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712'

" 重量级, 但是足够强大, 定制完成后相当个性化
" pylint codes: http://pylint-messages.wikidot.com/all-codes
" let g:syntastic_python_checkers=['pyflakes', 'pylint'] " 使用pyflakes,速度比pylint快
" let g:syntastic_python_checkers=['pylint'] " 使用pyflakes,速度比pylint快
" let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'


let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

function! ToggleErrors()
  let old_last_winnr = winnr('$')
  lclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel
    Errors
  endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<CR>
" nnoremap <Leader>sn :lnext<CR>
" nnoremap <Leader>sp :lprevious<CR>
" }}}


" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 相对 TagList 能更好的支持面向对象

" \tb 常规模式下输入 \tb 调用插件，如果有打开 TagList 窗口则先将其关闭
nnoremap <Leader>tb :TlistClose<CR>:TagbarToggle<CR>

let g:tagbar_width=30                       "设置窗口宽度
" let g:tagbar_left=1                       "在左侧窗口中显示
let g:tagbar_sort = 0                       " 关闭排序     [也就是按标签本身在文件中的位置排序]
let g:tagbar_show_linenumbers = -1          " 显示行号     [使用全局关于行号的默认配置]
let g:tagbar_autopreview = 1                " 开启自动预览 [随着光标在标签上的移动，顶部会出现一个实时的预览窗口]
let g:tagbar_compact=1                      " tagbar 子窗口中不显示冗余帮助信息
 
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
" }}}


" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等

" \tl  常规模式下输入 \tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
nnoremap <Leader>tl :TagbarClose<CR>:Tlist<CR>

let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0            "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_File_Fold_Auto_Close=1            "自动折叠
let Tlist_WinWidth=30                       "设置窗口宽度
let Tlist_Use_Right_Window=1                "在右侧窗口中显示taglist窗口
" }}}


" -----------------------------------------------------------------------------
"  < expand-regiond 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 选择区域扩展按键配置（Visual模式下）
vnoremap v <Plug>(expand_region_expand)
vnoremap <S-v> <Plug>(expand_region_shrink)
" }}}


" -----------------------------------------------------------------------------
"  < txtbrowser 插件配置 >
" -----------------------------------------------------------------------------
" 用于文本文件生成标签与与语法高亮（调用TagList插件生成标签，如果可以）
" {{{
"au BufRead,BufNewFile *.txt setlocal ft=txt
" }}}

" ------------------------------------------------------------------------------
"  < ZoomWin 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于分割窗口的最大化与还原
" 常规模式下按快捷键 <C-w>o 在最大化与还原间切换
" }}}


" -----------------------------------------------------------------------------
" vim-matchit
" -----------------------------------------------------------------------------
" {{{
" 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" }}}


" -----------------------------------------------------------------------------
" vim-latex
" -----------------------------------------------------------------------------
" {{{
set grepprg=grep\ -nH\ $*    " 使grep总是生成文件名
let g:tex_flavor='latex'    " vim默认把空的tex文件设为plaintex而不是tex，导致latex-suite不被加载
set iskeyword+=:
autocmd BufEnter *.tex set sw=2
let g:Tex_CompileRule_dvi='latex -src-specials -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'SumatraPDF -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'
let g:Tex_CompileRule_pdf = 'xelatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
" }}}


" -----------------------------------------------------------------------------
" Markdown Porview setting
" ----------------------------------------------------------------------------
" {{{
let g:mkdp_path_to_chrome = "iexplorer.exe"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）

let g:mkdp_auto_start = 0
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开 markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预览窗口

let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不自动关闭预览窗口

let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时更新预览

let g:mkdp_py_version = 3
" }}}


" -----------------------------------------------------------------------------
"  vim-multiple-cursors
" ----------------------------------------------------------------------------
" {{{
" Set multiple cursore key
"
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_key='<A-b>'
let g:multi_cursor_next_key='<A-n>'
let g:multi_cursor_prev_key='<A-p>'
let g:multi_cursor_skip_key='<A-x>'
let g:multi_cursor_quit_key='<ESC>'
" }}}


" -----------------------------------------------------------------------------
" vim-easymotion
" -----------------------------------------------------------------------------
" {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nnoremap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nnoremap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
noremap <Leader>j <Plug>(easymotion-j)
noremap <Leader>k <Plug>(easymotion-k)
" }}}


" -----------------------------------------------------------------------------
" incsearch
" -----------------------------------------------------------------------------
" {{{
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>
" }}}

 
" -----------------------------------------------------------------------------
" indexer
" -----------------------------------------------------------------------------
" {{{
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
" }}}

" -----------------------------------------------------------------------------
" ctrlsf.vim
" -----------------------------------------------------------------------------
" {{{
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
" }}}

" -----------------------------------------------------------------------------
" gundo.vim
" -----------------------------------------------------------------------------
" {{{
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
" }}}

" =============================================================================
"                          << 以下为常用工具配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
" {{{
" 用Cscope自己的话说 - 你可以把它当做是超过频的ctags
if has("cscope")
  "设定可以使用 quickfix 窗口来查看 cscope 结果
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
  set cscopetag
  "如果你想反向搜索顺序设置为1
  set csto=0
  "在当前目录中添加任何数据库
  if filereadable("cscope.out")
    cs add cscope.out
    "否则添加数据库环境中所指出的
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set cscopeverbose
  "快捷键设置
  nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
" }}}


"------grep工具配置------------------------------------------------------------
" {{{
"定义快捷键关闭当前分割窗口
"nnoremap<Leader>q :q<CR>
"使用Grep.vim插件在工程内全局查找，设置快捷键。快捷键速记法：searchin project
nnoremap <Leader>gp :Grep<CR>
"使用Grep.vim插件在工程内全局查找，设置快捷键。快捷键速记法：searchin buffer
nnoremap <Leader>gb :GrepBuffer -ir<CR><CR>
" }}}


" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" {{{
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set autochdir                              " 设置当前目录为当前打开文件所在目录 
set tags+=tags;                            " 向上级目录递归查找tags文件
"set tags+=./addtags/qt5_h                 " 用户可以加入其它程序头文件以便ctags建立索引
"set tags+=./addtags/cpp_stl
"set tags+=./addtags/qt5_cpp
"set tags+=/usr/include/glibc-2.0/glibc.tags
" }}}


" -----------------------------------------------------------------------------
"  < GitGutter 工具配置 >
" -----------------------------------------------------------------------------
" {{{
" \gi 开启或关闭GitGutter
nnoremap <Leader>gi :GitGutterToggle<CR>:GitGutterSignsToggle<CR>:GitGutterLineHighlightsToggle<CR>
" \gd 打开Git文件对比模式 [竖直]
nnoremap <Leader>gd :Gdiff<CR>
" \gs 打开Git文件对比模式 [水平]
nnoremap <Leader>gs :Gsdiff<CR>

let g:gitgutter_enabled               = 0      " 默认不开启
let g:gitgutter_signs                 = 0      " 默认不开启提示
let g:gitgutter_highlight_lines       = 0      " 默认不高亮行
let g:gitgutter_sign_added            = '+'    " 自定义新增指示符
let g:gitgutter_sign_modified         = '>'    " 自定义修改指示符
let g:gitgutter_sign_removed          = '-'    " 自定义删除指示符
let g:gitgutter_sign_modified_removed = '->'   " 自定义既修改又删除指示符
" }}}


" -----------------------------------------------------------------------------
"  < startify 配置 > 请确保已安装了工具
" -----------------------------------------------------------------------------
" {{{
let g:startify_custom_header = [
      \ '                                  ________  __ __       ',
      \ '             __                  /\_______\/\ \\ \      ',
      \ '     __  __ /\_\    ___ ___      \/____   /\ \ \\ \     ',
      \ '    /\ \/\ \\/\ \  / __` __`\       / /  /  \ \ \\ \_   ',
      \ '    \ \ \_/ |\ \ \/\ \/\ \/\ \     / /  / __ \ \__  __\ ',
      \ '     \ \___/  \ \_\ \_\ \_\ \_\   / /  / /\_\ \/_/\_\_/ ',
      \ '      \/__/    \/_/\/_/\/_/\/_/   \/__/  \/_/    \/_/   ',
      \ '                                                        ',
      \ ]
" }}}

" -----------------------------------------------------------------------------
"  < gvimtweak 工具配置 > 请确保以已装了工具
" -----------------------------------------------------------------------------
" {{{ Win平台下窗口全屏组件 gvimtweak.dll
" F11 全屏切换
" Ctrl + ↑                   --减少窗口透明度         [非插入模式]
" Ctrl + ↓                   --增加窗口透明度         [非插入模式]
" Ctrl + T                   --窗口置顶模式切换       [非插入模式]
" Vim启动的时候自动使用当前颜色的背景色以去除Vim的白色边框
if (g:isWindows && g:isGUI) && has("libcall")
    if(has("win64"))
        let g:MyVimLib = "gvimtweak_x64.dll"
    else
        let g:MyVimLib = "gvimtweak_x86.dll"
    endif

    function! ToggleFullScreen()
        call libcall(g:MyVimLib, "ToggleFullScreen", 1)
    endfunction

    let g:VimAlpha = 245
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 100
            let g:VimAlpha = 100
        endif
        if g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall(g:MyVimLib, "SetAlpha", g:VimAlpha)
    endfunction

    let g:VimTopMost = 0
    function! SwitchVimTopMostMode()
        if g:VimTopMost == 0
            let g:VimTopMost = 1
        else
            let g:VimTopMost = 0
        endif
        call libcall(g:MyVimLib, "EnableTopMost", g:VimTopMost)
    endfunction
    "映射 F11 切换全屏vim, 全屏后再隐藏菜单栏、工具栏、滚动条效果更好
    noremap <F11> <ESC>:call ToggleFullScreen()<CR>
    "切换Vim是否在最前面显示
    nnoremap <C-t> <ESC>:call SwitchVimTopMostMode()<CR>
    "减少Vim窗体的透明度
    nnoremap <C-up> <ESC>:call SetAlpha(+10)<CR>
    "增加Vim窗体的不透明度
    nnoremap <C-down> <ESC>:call SetAlpha(-10)<CR>
    " 默认设置透明
    autocmd GUIEnter * call libcallnr(g:MyVimLib, "SetAlpha", g:VimAlpha)
endif
" }}}

" =============================================================================
"                          << 以下为常用自动命令配置 >>
" =============================================================================

" 自动切换目录为当前编辑文件所在目录
"au BufRead,BufNewFile,BufEnter * cd %:p:h

" =============================================================================
"                     << windows 下解决 Quickfix 乱码问题 >>
" =============================================================================
" windows 默认编码为 cp936，而 Gvim(Vim) 内部编码为 utf-8，所以常常输出为乱码
" 以下代码可以将编码为 cp936 的输出信息转换为 utf-8 编码，以解决输出乱码问题
" 但好像只对输出信息全部为中文才有满意的效果，如果输出信息是中英混合的，那可能
" 不成功，会造成其中一种语言乱码，输出信息全部为英文的好像不会乱码
" 如果输出信息为乱码的可以试一下下面的代码，如果不行就还是给它注释掉

" if g:isWindows
"     function QfMakeConv()
"         let qflist = getqflist()
"         for i in qflist
"            let i.text = iconv(i.text, "cp936", "utf-8")
"         endfor
"         call setqflist(qflist)
"      endfunction
"      au QuickfixCmdPost make call QfMakeConv()
" endif

" \q 搜索光标处的单词并打开Quickfix搜索列表窗口
noremap <Leader>q :execute "let g:word=expand(\"<cword>\")"<Bar>execute "vimgrep /\\<" . g:word ."\\>/g **/*.[ch] **/*.cpp"<Bar>execute "cc 1"<Bar>execute "cw"<CR>
" next matched line
noremap <silent> <F4> :cnext<CR>
" previous matched line
noremap <silent> <S-F4> :cprevious<CR>
" open QuickFix
" :copen
" close QuickFix
" :cclose

" =============================================================================
"                          << 其它 >>
" =============================================================================

" 注：上面配置中的"<Leader>"在本软件中设置为"\"键（引号里的反斜杠），如<Leader>t
" 指在常规模式下按"\"键加"t"键，这里不是同时按，而是先按"\"键后按"t"键，间隔在一
" 秒内，而<Leader>cs是先按"\"键再按"c"又再按"s"键