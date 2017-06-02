# 我的 vim 配置及插件

lwh@vip.163.com
2016-03-30 16:39:33


##【致谢】

本配置文件前后很多参考了网上配置说明及源文件，在此不一一列出，统一对各位朋友致以诚挚谢意。


##【版本】
----
* v0.1.0，2016-07-10，新增。发布初始版本。


##【目录】
----

[0 vim 必知会 ](#0)
........[0.1 .vimrc 文件 ](#0.1)
........[0.2 .vim/ 目录 ](#0.2)
[1 源码安装编辑器 vim ](#1)
[2 插件管理 ](#2)
[3 界面美化 ](#3)
........[3.1 主题风格 ](#3.1)
........[3.2 营造专注氛围 ](#3.2)
........[3.3 添加辅助信息 ](#3.3)
........[3.4 其他 ](#3.4)
[4 代码分析 ](#4)
........[4.1 语法高亮 ](#4.1)
........[4.2 代码缩进 ](#4.2)
........[4.3 代码折叠 ](#4.3)
........[4.4 接口与实现快速切换 ](#4.4)
........[4.5 代码收藏 ](#4.5)
........[4.6 标识符列表 ](#4.6)
................[标签系统 ](#4.6.1)
................[语义系统 ](#4.6.2)
................[基于标签的标识符列表 ](#4.6.3)
........[4.7 声明 / 定义跳转 ](#4.7)
................[基于标签的声明 / 定义跳转 ](#4.7.1)
........[4.8 内容查找 ](#4.8)
........[4.9 内容替换 ](#4.9)
................[快捷替换 ](#4.9.1)
................[精确替换 ](#4.9.2)
[5 代码开发 ](#5)
........[5.1 快速开关注释 ](#5.1)
........[5.2 模板补全 ](#5.2)
........[5.3 智能补全 ](#5.4)
................[基于标签的智能补全 ](#5.3.1)
........[5.4 库信息参考 ](#5.5)
[6 工程管理 ](#6)
........[6.1 工程文件浏览 ](#6.1)
........[6.2 多文档编辑 ](#6.2)
........[6.3 环境恢复 ](#6.3)
[7 工具链集成 ](#7)
........[7.1 构建工具集成 ](#7.1)
................[代码编译 ](#7.1.1)
................[系统构建 ](#7.1.2)
................[一键编译 ](#7.1.3)
........[7.2 静态分析器集成 ](#7.2)
[8 其他辅助 ](#8)
........[8.1 快速编辑结对符 ](#8.1)
........[8.2 支持分支的 undo ](#8.2)
........[8.3 快速移动 ](#8.3)
........[8.4 中 / 英输入平滑切换 ](#8.5)
[9 尾声](#9)


##【正文】
----

开始前，我假设你：0）具备基本的 vim 操作能力，清楚如何打开 / 编辑 / 保存文档、命令与插入模式间切换；1）希望将 vim 打造成 C/C++ 语言的 IDE，而非其他语言。

关于 vim 的优点，你在网上能查到 128+ 项，对我而言，只有两项：0）所思即所得，让手输入的速度跟上大脑思考的速度，1）所需即所获，只有你想不到的功能、没有实现不了的插件。希望获得前者的能力，你需要两本教程深入学习，《Practical Vim: Edit Text at the Speed of Thought》和《vim user manual》；要想拥有后者的能力，通读本文 -。-#。

vim 用户手册中，50％ 的例子都是在讲 vim 如何高效编写代码，由此可见，vim 是一款面向于程序员的编辑器，即使某些功能 vim 无法直接完成，借助其丰富的插件资源，必定可以达成目标，这就是所需即所获。

我是个目标驱动的信奉者，本文内容，我会先给出优秀 C/C++ IDE 应具备哪些功能，再去探索如何通过 vim 的操作或插件来达到目标。最终至少要像这个样子：

<img src="./images/图形环境下 IDE 总揽.png" alt=""/>
（图形环境下 IDE 总揽）


<img src="./images/纯字符模式下总览.png" alt=""/>
（纯字符模式下 IDE 总揽）


## 0 vim 必知会

在正式开始前先介绍几个 vim 的必知会，这不是关于如何使用而是如何配置 vim 的要点，这对理解后续相关配置非常有帮助。

### 0.1 .vimrc 文件

.vimrc 是控制 vim 行为的配置文件，位于 ~/.vimrc，不论 vim 窗口外观、显示字体，还是操作方式、快捷键、插件属性均可通过编辑该配置文件将 vim 调教成最适合你的编辑器。

很多人之所以觉得 vim 难用，是因为 vim 缺少默认设置，甚至安装完后你连配置文件自身都找不到，不进行任何配置的 vim 的确难看、难用。不论用于代码还是普通文本编辑，有必要将如下基本配置加入 .vimrc 中。

前缀键。各类 vim 插件帮助文档中经常出现 \<leader>，即，前缀键。vim 自带有很多快捷键，再加上各类插件的快捷键，大量快捷键出现在单层空间中难免引起冲突，为缓解该问题，引入了前缀键 \<leader>，这样，键 r 可以配置成 r、\<leader>r、\<leader>\<leader>r 等等多个快捷键。前缀键是 vim 使用率较高的一个键（最高的当属 Esc），选一个最方便输入的键作为前缀键，将有助于提高编辑效率。找个无须眼睛查找、无须移动手指的键 —— 分号键，挺方便的，就在你右手小指处：

```
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
```
既然前缀键是为快捷键服务的，那随便说下快捷键设定原则：不同快捷键尽量不要有同序的相同字符。比如，\<leader>e 执行操作 0 和 \<leader>eb 执行操作 1，在你键入 \<leader>e 后，vim 不会立即执行操作 0，而是继续等待用户键入 b，即便你只想键入 \<leader>e，vim 也不得不花时间等待输入以确认是哪个快捷键，显然，这让 \<leader>e 响应速度变慢。\<leader>ea 和 \<leader>eb 就没问题。

文件类型侦测。允许基于不同语言加载不同插件（如，C++ 的语法高亮插件与 python 的不同）：

```
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
```

快捷键。把 vim（非插件）常用操作设定成快捷键，提升效率：

```
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>c "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>v "+p
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
```

其他。搜索、vim 命令补全等设置：

```
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
```

以上的四类配置不仅影响 vim，而且影响插件是否能正常运行。很多插件不仅要在 .vimrc 中添加各自特有的配置信息，还要增加 vim 自身的配置信息，在后文的各类插件介绍中，我只介绍对应插件特有配置信息，当你发现按文中介绍操作后插件未生效，很可能是 vim 自身配置信息未添加，所以一定要把上述配置拷贝至到你的 .vimrc 中，再对照本文介绍一步步操作。.vimrc 完整配置信息参见附录，每个配置项都有对应注释。另外，由于有些插件还未来得及安装，在你实验前面的插件是否生效时，vim 可能有报错信息提示，先别理会，安装完所有插件后自然对了。

### 0.2 .vim/ 目录

.vim/ 目录是存放所有插件的地方。vim 有一套自己的脚本语言 vimscript，通过这种脚本语言可以实现与 vim 交互，达到功能扩展的目的。一组 vimscript 就是一个 vim 插件，vim 的很多功能都由各式插件实现。此外，vim 还支持 perl、python、lua、ruby 等主流脚本语言编写的插件，前提是 vim 源码编译时增加 ---enable-perlinterp、--enable-pythoninterp、--enable-luainterp、--enable-rubyinterp 等选项。vim.org 和 github.com 有丰富的插件资源，任何你想得到的功能，如果 vim 无法直接支持，那一般都有对应的插件为你服务，有需求时可以去逛逛。

vim 插件目前分为 \*.vim 和 \*.vba 两类，前者是传统格式的插件，实际上就是一个文本文件，通常 someplugin.vim（插件脚本）与 someplugin.txt（插件帮助文件）并存在一个打包文件中，解包后将 someplugin.vim 拷贝到 ~/.vim/plugin/ 目录，someplugin.txt 拷贝到 ~/.vim/doc/ 目录即可完成安装，重启 vim 后刚安装的插件就已经生效，但帮助文件需执行 :helptags ~/.vim/doc/ 才能生效，可通过 :h someplugin 查看插件帮助信息。传统格式插件需要解包和两次拷贝才能完成安装，相对较繁琐，所以后来又出现了 \*.vba 格式插件，安装便捷，只需在 shell 中依次执行如下命令即可：

```
vim someplugin.vim
:so %
:q
```
不论是直接拷贝插件到目录，还是通过 \*.vim 安装，都不便于插件卸载、升级，后来又出现了管理插件的插件 vundle。

后面就正式开始了喽，文中前后内容顺序敏感，请依次查阅。

## 1 源码安装编辑器 vim

发行套件的软件源中预编译的 vim 要么不是最新版本，要么功能有阉割，有必要升级成全功能的最新版，当然，源码安装必须滴：
```
git clone git@github.com:vim/vim.git
cd vim/
./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
make
make install
```
其中，--enable-pythoninterp、--enable-rubyinterp、--enable-perlinterp、--enable-luainterp 等分别表示支持 ruby、python、perl、lua 编写的插件，--enable-gui=gtk2 表示生成采用 GNOME2 风格的 gvim，--enable-cscope 支持 cscope，--with-python-config-dir=/usr/lib/python2.7/config/ 指定 python 路径（先自行安装 python 的头文件 python-devel），这几个特性非常重要，影响后面各类插件的使用。注意，你得预先安装相关依赖库的头文件，python-devel、python3-devel、ruby-devel、lua-devel、libX11-devel、gtk-devel、gtk2-devel、gtk3-devel、ncurses-devel，如果缺失，源码构建过程虽不会报错，但最终生成的 vim 很可能缺失某些功能。构建完成后在 vim 中执行

```
:echo has('python')
```
若输出 1 则表示构建出的 vim 已支持 python，反之，0 则不支持。

## 2 插件管理

既然本文主旨在于讲解如何通过插件将 vim 打造成中意的 C/C++ IDE，那么高效管理插件是首要解决的问题。

vim 自身希望通过在 .vim/ 目录中预定义子目录管理所有插件（比如，子目录 doc/ 存放插件帮助文档、plugin/ 存放通用插件脚本），vim 的各插件打包文档中通常也包含上述两个（甚至更多）子目录，用户将插件打包文档中的对应子目录拷贝至 .vim/ 目录即可完成插件的安装。一般情况下这种方式没问题，但我等重度插件用户，.vim/ 将变得混乱不堪，至少存在如下几个问题：

* 插件名字冲突。所有插件的帮助文档都在 doc/ 子目录、插件脚本都在 plugin/ 子目录，同个名字空间下必然引发名字冲突；
* 插件卸载易误。你需要先知道 doc/ 和 plugin/ 子目录下哪些文件是属于该插件的，再逐一删除，容易多删 / 漏删。

我希望每个插件在 .vim/ 下都有各自独立子目录，这样需要升级、卸载插件时，直接找到对应插件目录变更即可；另外，我希望所有插件清单能在某个配置文件中集中罗列，通过某种机制实现批量自动安装 / 更新 / 升级所有插件。vundle（https://github.com/VundleVim/Vundle.vim ）为此而生，它让管理插件变得更清晰、智能。

vundle 会接管 .vim/ 下的所有原生目录，所以先清空该目录，再通过如下命令安装 vundle：

```

" -----------------------------------------------------------------------------
"  < Vundle 插件管理工具配置 >
" -----------------------------------------------------------------------------
"
" 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
" 安装方法为在终端输入如下命令
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle.vim
" 如果想在 windows 安装就必需先安装 "git for window"，可查阅网上资料

" set the runtime path to include Vundle and initialize
if g:isLinux
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#rc()
else
  set rtp+=$VIM/vimfiles/bundle/Vundle.vim
  call vundle#rc('$VIM/vimfiles/bundle')
endif

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" 使用Vundle来管理Vundle，这个必须要有。
Plugin 'VundleVim/Vundle.vim'


" 以下为要安装或更新的插件
"

" 异步运行 Shell 指令并且把结果实时输出到 Quickfix
Plugin 'skywind3000/asyncrun.vim'

" quick commands to swtich between source files and header files
Plugin 'liwangmj/green_vim_switchtoinc'
" -----------------------------------------------------------------------------
"  < green_vim_switchtoinc 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于头文件和源文件间快速切换。注：在a.vim插件基础上修改的。
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
" :AN    ---多个重名文件之间的切换
" :SearchIncAndSrcPath  ---初始化查找目录（只在用最后一种方式前使用，其他方法不用）
"
" 基于源文件的相对路径查找（如下是默认值）：
" let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
" 基于绝对路径查找（例子）：
" let g:alternateSearchPath = 'abs:/home/my/myporject/inc,abs:/home/my/myproject/src'
" }}}

" 对齐插件
Plugin 'Align'
" -----------------------------------------------------------------------------
"  < Align 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多
" }}}

Plugin 'junegunn/vim-easy-align'
" ----------------------------------------------------------------------------
" vim-easy-align快速赋值语句对齐 \a
" ----------------------------------------------------------------------------
" {{{
vnoremap <Leader>ea <Plug>(EasyAlign)
nnoremap <Leader>ea <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" }}}

Plugin 'jiangmiao/auto-pairs'
" -----------------------------------------------------------------------------
"  < auto-pairs 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于括号与引号自动补全，不过会与函数原型提示插件echofunc冲突
" 所以我就没有加入echofunc插件
" }}}

Plugin 'jlanzarotta/bufexplorer'
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

Plugin 'ccvext.vim'
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

" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" {{{
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set tags+=tags;                            " 向上级目录递归查找tags文件
"set tags+=./addtags/qt5_h                 " 用户可以加入其它程序头文件以便ctags建立索引
"set tags+=./addtags/cpp_stl
"set tags+=./addtags/qt5_cpp
"set tags+=/usr/include/glibc-2.0/glibc.tags
" }}}

Plugin 'Yggdroot/indentLine'
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

Plugin 'Shougo/neocomplete'
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
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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

" 代码快速注释插件
Plugin 'scrooloose/nerdcommenter'
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

" 树形目录插件
Plugin 'scrooloose/nerdtree'
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

" 显示 Git 管理的项目文件变更状态
Plugin 'Xuyuanp/nerdtree-git-plugin'
" -----------------------------------------------------------------------------
"  < nerdtree-git-plugin 插件配置 >
" -----------------------------------------------------------------------------
"{{{
" 在NerdTree窗口里显示 Git 管理的项目文件变更状态
"}}}

Plugin 'airblade/vim-gitgutter'
" -----------------------------------------------------------------------------
"  < vim-gitgutter 工具配置 >
" -----------------------------------------------------------------------------
" {{{
" shows a git diff in the gutter (sign column) and stages/undoes hunks
" \gi 开启或关闭GitGutter
nnoremap <Leader>gi :GitGutterToggle<CR>:GitGutterSignsToggle<CR>:GitGutterLineHighlightsToggle<CR>
" \gd 打开Git文件对比模式 [竖直]
nnoremap <Leader>gid :Gdiff<CR>
" \gs 打开Git文件对比模式 [水平]
nnoremap <Leader>gis :Gsdiff<CR>

let g:gitgutter_enabled               = 0      " 默认不开启
let g:gitgutter_signs                 = 0      " 默认不开启提示
let g:gitgutter_highlight_lines       = 0      " 默认不高亮行
let g:gitgutter_sign_added            = '+'    " 自定义新增指示符
let g:gitgutter_sign_modified         = '>'    " 自定义修改指示符
let g:gitgutter_sign_removed          = '-'    " 自定义删除指示符
let g:gitgutter_sign_modified_removed = '->'   " 自定义既修改又删除指示符
" }}}

" 变量或函数的自动弹出与补全
Plugin 'OmniCppComplete'
" -----------------------------------------------------------------------------
"  < OmniCppComplete 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于C/C++代码补全，这种补全主要针对命名空间、类、结构、共同体等进行补全，详细
" 说明可以参考帮助或网络教程等
" 使用前先执行如下 ctags 命令（本配置中可以直接使用 ccvext 插件来执行以下命令）
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
" 我使用上面的参数生成标签后，对函数使用跳转时会出现多个选择
" 定义快捷键 \tc
noremap <Leader>tc :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>
set completeopt=menu                " 关闭预览窗口
let OmniCpp_GlobalScopeSearch = 1 " 全局查找控制。0:禁止；1:允许(缺省)
let OmniCpp_NamespaceSearch = 1   " 命名空间查找控制。
                                  " 0 : 禁止查找命名空间
                                  " 1 : 查找当前文件缓冲区内的命名空间(缺省)
                                  " 2 : 查找当前文件缓冲区和包含文件中的命名空间
let OmniCpp_DisplayMode = 0       " 类成员显示控制(是否显示全部公有(public)私有(private)保护(protected)成员)。
                                  " 0 : 自动
                                  " 1 : 显示所有成员
let OmniCpp_ShowScopeInAbbr = 0   " 选项用来控制匹配项所在域的显示位置。
                                  " 缺省情况下，omni显示的补全提示菜单中总是将匹配项所在域信息显示在缩略信息最后一列。
                                  " 0 : 信息缩略中不显示匹配项所在域(缺省)
                                  " 1 : 显示匹配项所在域，并移除缩略信息中最后一列
let OmniCpp_ShowPrototypeInAbbr = 1 " 是否是补全提示缩略信息中显示函数原型。
                                    " 0 : 不显示(缺省)
                                    " 1 : 显示原型
let OmniCpp_ShowAccess = 1          " 是否显示访问控制信息('+', '-', '#')。0/1, 缺省为1(显示)
let OmniCpp_DefaultNamespaces =  ["std", "_GLIBCXX_STD"]  " 默认命名空间列表，项目间使用','隔开。
                                  " 如：let OmniCpp_DefaultNamespaces = ["std', "MyNamespace"]
let OmniCpp_MayCompleteDot = 1    " 在'.'号后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
let OmniCpp_MayCompleteArrow = 1  " 在"->"后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
let OmniCpp_MayCompleteScope = 1  " 在域标识符"::"后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为0
let OmniCpp_SelectFirstItem = 0   " 是否自动选择第一个匹配项。仅当"completeopt"不为"longest"时有效。
                                  " 0 : 不选择第一项(缺省)
                                  " 1 : 选择第一项并插入到光标位置
                                  " 2 : 选择第一项但不插入光标位置
" }}}

" 代码块的自动补全
Plugin 'MarcWeber/vim-addon-mw-utils'
" snipMate 依赖组件

Plugin 'tomtom/tlib_vim'
" snipMate 依赖组件

Plugin 'garbas/vim-snipmate'
 " -----------------------------------------------------------------------------
"  < snipmate 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于各种代码补全，这种补全是一种对代码中的词与代码块的缩写补全，详细用法可以参
" 考使用说明或网络教程等。不过有时候也会与 supertab 插件在补全时产生冲突，如果大
" 侠有什么其它解决方法希望不要保留呀
" }}}

" 代码块的自动补全
Plugin 'drmingdrmer/xptemplate'
" -----------------------------------------------------------------------------
"  < xptemplate 插件配置 >
" -----------------------------------------------------------------------------
" {{{
let g:xptemplate_key = '<Tab>'
let g:xptemplate_vars = "SPcmd=&BRloop=\n"
let g:xptemplate_vars = "BRfun= "
let g:xptemplate_vars = "author=Leo&email=lwh@vip.163.com&..."
let g:xptemplate_minimal_prefix = 0
" }}}

" 显示跳转函数及变量定义
Plugin 'wesleyche/SrcExpl'
" -----------------------------------------------------------------------------
"  < SrcExpl 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 增强源代码浏览，其功能就像Windows中的"Source Insight"
nnoremap <F3> :SrcExplToggle<CR>                "打开/闭浏览窗口
" }}}

Plugin 'std_c.zip'
" -----------------------------------------------------------------------------
"  < std_c 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于增强C语法高亮
" 启用 // 注视风格
let c_cpp_comments = 0
" }}}

" 快速切换括号/引号或者标签
Plugin 'tpope/vim-surround'
" -----------------------------------------------------------------------------
"  < surround 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 快速给单词/句子两边增加符号（包括html标签），缺点是不能用"."来重复命令
" 不过 repeat 插件可以解决这个问题，详细帮助见 :h surround.txt
" }}}

Plugin 'tpope/vim-repeat'
" -----------------------------------------------------------------------------
"  < repeat 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 主要用"."命令来重复上次插件使用的命令
" }}}

" 书签可视化
Plugin 'kshenoy/vim-signature'
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

" 语法与编码风格检查
Plugin 'scrooloose/syntastic'
" -----------------------------------------------------------------------------
"  < syntastic 插件配置 >
" -----------------------------------------------------------------------------
" {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
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

" 源文件浏览标签
Plugin 'majutsushi/tagbar'
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

" 显示定位程序中各种符号
Plugin 'taglist.vim'
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

" 对文件进行模糊查找
Plugin 'ctrlpvim/ctrlp.vim'
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

" 窗口全屏缩放
Plugin 'ZoomWin'
" ------------------------------------------------------------------------------
"  < ZoomWin 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于分割窗口的最大化与还原
" 常规模式下按快捷键 <C-w>o 在最大化与还原间切换
" }}}

" 标准化中文排版
Plugin 'hotoo/pangu.vim'

" 括号显示增强
Plugin 'kien/rainbow_parentheses.vim'
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

" 匹配成对的标签
Plugin 'adelarsq/vim-matchit'
" -----------------------------------------------------------------------------
" vim-matchit
" -----------------------------------------------------------------------------
" {{{
" 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" }}}

Plugin 'cSyntaxAfter'
" -----------------------------------------------------------------------------
"  < cSyntaxAfter 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 高亮括号与运算符等
"au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()
" }}}

Plugin 'octol/vim-cpp-enhanced-highlight'
" -----------------------------------------------------------------------------
"  < cSyntaxAfter 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" C++11/14 语法高亮插件从 STL-Syntax 换为 vim-cpp-enhanced-highlight，后者支持
" STL 以及自行编写函数、容器、模版等的高亮
"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"}}}

Plugin 'vim-latex/vim-latex'
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

" 多重选取
Plugin 'terryma/vim-multiple-cursors'
" -----------------------------------------------------------------------------
"  vim-multiple-cursors
" ----------------------------------------------------------------------------
" {{{
" Set multiple cursore key
"
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-n>'
"let g:multi_cursor_start_word_key='g<C-n>'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
" }}}

" 跳转到光标后任意位置
Plugin 'Lokaltog/vim-easymotion'
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

" 输入查找内容的同时进行匹配
Plugin 'haya14busa/incsearch.vim'
" -----------------------------------------------------------------------------
" incsearch
" -----------------------------------------------------------------------------
" {{{
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>
" }}}

Plugin 'EasyGrep'
"------grep工具配置------------------------------------------------------------
" {{{
"定义快捷键关闭当前分割窗口
"nnoremap<Leader>q :q<CR>
"使用Grep.vim插件在工程内全局查找，设置快捷键。快捷键速记法：searchin project
nnoremap <Leader>gp :Grep<CR>
"使用Grep.vim插件在工程内全局查找，设置快捷键。快捷键速记法：searchin buffer
nnoremap <Leader>gb :GrepBuffer -ir<CR><CR>
" }}}

" 选择区域扩展按键映射
Plugin 'terryma/vim-expand-region'
" -----------------------------------------------------------------------------
"  < expand-regiond 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 选择区域扩展按键配置（Visual模式下）
vnoremap v <Plug>(expand_region_expand)
vnoremap <S-v> <Plug>(expand_region_shrink)
" }}}

" 处理 git 信息的 vim 插件
Plugin 'tpope/vim-fugitive'

" 给插件增加文件类型图标显示
Plugin 'ryanoasis/vim-devicons'

" 状态栏增强插件
if g:isAirLine
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
" -----------------------------------------------------------------------------
"  < vim_airline 插件配置 >
" -----------------------------------------------------------------------------
" {{{
"设置状态栏符号显示"
" let g:airline_theme='cool'
let g:airline_powerline_fonts = 1

function! AirLineInit()
let spc = g:airline_symbols.space
"  let g:airline_section_a = airline#section#create_left(['mode', 'crypt', 'paste', 'spell', 'capslock', 'xkblayout', 'iminsert'])
"  let g:airline_section_b = let g:airline_section_b = airline#section#create(['hunks', 'branch'])
"  if exists("+autochdir") && &autochdir == 1
"    let g:airline_section_c = airline#section#create(['%<', 'path', spc, 'readonly'])
"  else
"    let g:airline_section_c = airline#section#create(['%<', 'file', spc, 'readonly'])
"  endif

"  let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype'])
"  let g:airline_section_y = airline#section#create_right(['ffenc'])
  if winwidth(0) > 80
    let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%'.spc, 'linenr', 'maxlinenr', spc.':%3v', ': [%b/0x%B]'])
  else
    let g:airline_section_z = airline#section#create(['%3p%%'.spc, 'linenr',  ':%3v', ': [%b/0x%B]'])
  endif
endfunction

autocmd VimEnter * call AirLineInit()
" }}}
endif

" powered code search and view tool
Plugin 'mileszs/ack.vim'

" 添加 Doxygen 风格的注释
Plugin 'DoxygenToolkit.vim'
" -----------------------------------------------------------------------------
" DoxygenToolkit.vim
" -----------------------------------------------------------------------------
"{{{
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_templateParamTag_pre = "@tparam "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_fileTag = "@file "
let g:DoxygenToolkit_dateTag = "@date "
let g:DoxygenToolkit_authorTag = "@author "
let g:DoxygenToolkit_versionTag = "@version "
let g:DoxygenToolkit_blockTag = "@name "
let g:DoxygenToolkit_classTag = "@class "
let g:DoxygenToolkit_authorName = "LI Wenhui, lwh@vip.163.com"
let g:doxygen_enhanced_color = 1
"}}}

Plugin 'dyng/ctrlsf.vim'
" -----------------------------------------------------------------------------
" ctrlsf.vim
" -----------------------------------------------------------------------------
" {{{
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
" }}}

" plain text browser
Plugin 'TxtBrowser'
" -----------------------------------------------------------------------------
"  < txtbrowser 插件配置 >
" -----------------------------------------------------------------------------
" 用于文本文件生成标签与与语法高亮（调用TagList插件生成标签，如果可以）
" {{{
"au BufRead,BufNewFile *.txt setlocal ft=txt
" }}}

" 编辑修改撤销管理
Plugin 'sjl/gundo.vim'
" -----------------------------------------------------------------------------
" gundo.vim
" -----------------------------------------------------------------------------
" {{{
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
" }}}

" 自动创建目录插件
Plugin 'benizi/vim-automkdir'

" 更改开始界面
Plugin 'mhinz/vim-startify'
" -----------------------------------------------------------------------------
"  < startify 配置 > 请确保已安装了工具
" -----------------------------------------------------------------------------
" {{{
let g:startify_custom_header = [
      \ '                                  ________  _______      ',
      \ '             __                  /\_______\/\  ___ \     ',
      \ '     __  __ /\_\    ___ ___     / / ___   /\ \ \ /\ \    ',
      \ '    /\ \/\ \\/\ \  / __` __`\  / / /_\/  /  \ \ \  \ \   ',
      \ '    \ \ \_/ |\ \ \/\ \/\ \/\ \/ /  __   / __ \ \ \__\ \  ',
      \ '     \ \___/  \ \_\ \_\ \_\ \_\/ /_\/  / /\_\ \ \______\ ',
      \ '      \/__/    \/_/\/_/\/_/\/_/_______/  \/_/  \/______/ ',
      \ '                                                         ',
      \ ]
" }}}

" All of your Plugins must be added before the following line
call vundle#end() 

```
其中，每项

```
Plugin '*'
```
对应一个插件，后续若有新增插件，只需追加至该列表中即可。vundle 支持源码托管在 https://github.com/ 的插件，同时 vim 官网 http://www.vim.org/ 上的所有插件均在 https://github.com/vim-scripts/ 有镜像，所以，基本上主流插件都可以纳入 vundle 管理。具体而言，以 ctrlsf.vim 为例，它在 .vimrc 中配置信息为 dyng/ctrlsf.vim，vundle 很容易构造出其真实下载地址 https://github.com/dyng/ctrlsf.vim.git ，然后借助 git 工具进行下载及安装。

此后，需要安装插件，先找到其在 github.com 的地址，再将配置信息其加入 .vimrc 中。


## 3 界面美化

玉不琢不成器，vim 不配不算美。刚安装好的 vim 朴素得吓人，这是与我同时代的软件么？

<img src="./images/默认 vim 界面.png" alt=""/>
（默认 vim 界面）

就我的审美观而言，至少有几个问题：语法高亮太单薄、主题风格太简陋、窗口元素太冗余、辅助信息太欠缺。

### 3.1 主题风格

一套好的配色方案绝对会影响你的编码效率，vim 内置了 10 多种配色方案供你选择，GUI 下，可以通过菜单（Edit -> Color Scheme）试用不同方案，字符模式下，需要你手工调整配置信息，再重启 vim 查看效果（csExplorer 插件，可在字符模式下不用重启即可查看效果）。不满意，可以去 http://vimcolorschemetest.googlecode.com/svn/html/index-c.html 慢慢选。我自认为“阅美无数”，目前最夯三甲：
* 素雅 solarized（https://github.com/altercation/vim-colors-solarized ）
* 多彩 molokai（https://github.com/tomasr/molokai ）

在 .vimrc 中选用某个主题：

```
" 配色方案
set background=dark
colorscheme solarized
```

其中，不同主题都有暗 / 亮色系之分，这样三种主题六种风格，久不久换一换，给你不一样的心情：

<img src="./images/solarized 主题风格.png" alt=""/>
（solarized 主题风格）


### 3.2 营造专注氛围

如今的 UX 设计讲究的是内容至上，从 GNOME3 的变化就能看出。编辑器界面展示的应全是代码，不应该有工具条、菜单、滚动条浪费空间的元素，另外，编程是种精神高度集中的脑力劳动，不应出现闪烁光标、花哨鼠标这些分散注意力的东东。配置如下：

```
" 显示 / 隐藏菜单栏、工具栏、滚动条，可用 F12 切换
" {{{
if g:isGUI
  set guioptions-=m  " 删除菜单栏
  set guioptions-=T  " 删除工具栏
  set guioptions-=r  " 删除右侧滚动条
  set guioptions-=l  " 删除左侧滚动条
  set guioptions-=L  " 即使存在垂直窗口分割也删除左侧滚动条
  set guioptions-=b  " 删除底部滚动条
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
```

重启 vim 后效果如下：

<img src="./images/去除冗余窗口元素.png" alt=""/>
（去除冗余窗口元素）


还容易分神？好吧，我们把 vim 弄成全屏模式。vim 自身无法实现全屏，必须借助第三方工具 gvimtweak，一个控制窗口 XYZ 坐标、窗口尺寸的命令行工具。本 vim 包已包含 gvimtweak，再在 .vimrc 中增加如下信息：

```
" -----------------------------------------------------------------------------
"  < gvimtweak 工具配置 > 请确保以已装了工具
" -----------------------------------------------------------------------------
" {{{ Win平台下窗口全屏组件 gvimtweak.dll
" F11 全屏切换
" Ctrl + ↑                   --减少窗口透明度         [非插入模式]
" Ctrl + ↓                   --增加窗口透明度         [非插入模式]
" Ctrl + T                   --窗口置顶模式切换       [非插入模式]
" Vim启动的时候自动使用当前颜色的背景色以去除Vim的白色边框
if g:isWindows && g:isGUI && has("libcall")
    if has("win64")
        let g:MyVimLib = "gvimtweak_x64.dll"
    else
        let g:MyVimLib = "gvimtweak.dll"
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
    nnoremap <C-T> <ESC>:call SwitchVimTopMostMode()<CR>
    "减少Vim窗体的透明度
    nnoremap <C-up> <ESC>:call SetAlpha(+10)<CR>
    "增加Vim窗体的不透明度
    nnoremap <C-down> <ESC>:call SetAlpha(-10)<CR>
    " 默认设置透明
    autocmd GUIEnter * call libcallnr(g:MyVimLib, "SetAlpha", g:VimAlpha)
endif
" }}}
```

上面是一段简单的 vimscript 脚本，外部命令 wmctrl 及其命令行参数控制将指定窗口 windowid（即，vim）全屏，绑定快捷键 F11 实现全屏 / 窗口模式切换（linux 下各 GUI 软件约定使用 F11 全屏，最好遵守约定），最后配置启动时自动全屏。

### 3.3 添加辅助信息

去除了冗余元素让 vim 界面清爽多了，为那些实用辅助信息腾出了空间。光标当前位置、显示行号、高亮当前行 / 列等等都很有用：

```
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行 / 列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
```

效果如下：

<img src="./images/添加辅助信息.png" alt=""/>
（添加辅助信息）


### 3.4 其他美化

默认字体不好看，挑个自己喜欢的，前提是你得先安装好该字体。中文字体，我喜欢饱满方正的（微软雅黑），英文字体喜欢圆润的（Consolas），vim 无法同时使用两种字体，怎么办？有人制作发布了一款中文字体用微软雅黑、英文字体用 Consolas 的混合字体 —— yahei consolas hybrid 字体，号称最适合中国程序员使用的字体，效果非常不错（本文全文采用该字体）。在 .vimrc 中设置下：

```
" 设置 gvim 显示字体
set guifont=Microsoft_YaHei_Mono:h11
```

上面的字体设置方式是在 Windows 操作系统下，如果是在 Linux 设置方式如下

```
set guifont=Microsoft\ YaHei\ Mono:11
```
其中，由于字体名存在空格，需要用转义符“\”进行转义；最后的 12 用于指定字体大小。

代码折行也不太美观，禁止掉：

```
" 禁止折行
set nowrap
```

前面介绍的主题风格对状态栏不起作用，需要借助插件 Airline（https://github.com/bling/vim-airline ）美化状态栏，在 .vimrc 中设定状态栏主题风格：

```
" 个性化状栏（这里提供两种方式，要使用其中一种去掉注释即可，不使用反之）
" 在使用 AirLine 时，这个设置无效，应修改 AirLine 设置
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
  " set statusline=%F%m%r%h%w[ %=[FORMAT=%{&ff}][ [TYPE=%Y][ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
  set statusline=%t[ %m\ %r\ %h%w\ %=[%l/%L(%p%%),%c%V][ [%b:0x%B]\ [%{&ft==''?'TEXT':toupper(&ft)},%{toupper(&ff)},%{toupper(&fenc!=''?&fenc:&enc)}%{&bomb?',BOM':''}%{&eol?'':',NOEOL'}]%{strftime(\"\ [%d/%m/%y-%H:%M]\")}
endif
" }}}
```

效果如下：

<img src="./images/界面美化最终效果.png" alt=""/>
（界面美化最终效果）

图中，中英文混合字体看着是不是很舒服哈；增强后的状态栏，不仅界面漂亮多了，而且多了好些辅助信息（所在函数名、文件编码格式、文件类型）。

## 4 代码分析

阅读优秀开源项目源码是提高能力的重要手段，营造舒适、便利的阅读环境至关重要。

### 4.1 语法高亮

代码只有一种颜色的编辑器，就好像红绿灯只有一种颜色的路口，全然无指引。现在已是千禧年后的十年了，早已告别上世纪六、七十年代黑底白字的时代，即使在字符模式下编程（感谢伟大的 fbterm），我也需要语法高亮。所幸 vim 自身支持语法高亮，只需显式打开即可：

```
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
```
效果如下：

<img src="./images/语法高亮.png" alt=""/>
（语法高亮）

上图中 STL 容器模板类 unordered\_multimap 并未高亮，对滴，vim 对 C++ 语法高亮支持不够好（特别是 C++11/14 新增元素），必须借由插件 vim-cpp-enhanced-highlight（https://github.com/octol/vim-cpp-enhanced-highlight ）进行增强。效果如下：

<img src="./images/增强 C++11 及 STL 的语法高亮.png" alt=""/>
（增强 C++11 及 STL 的语法高亮）

vim-cpp-enhanced-highlight 主要通过 .vim/bundle/vim-cpp-enhanced-highlight/after/syntax/cpp.vim 控制高亮关键字及规则，所以，当你发现某个 STL 容器类型未高亮，那么将该类型追加进 cpp.vim 即可。如，initializer_list 默认并不会高亮，需要添加

```
syntax keyword cppSTLtype initializer_list
```

### 4.2 代码缩进

C/C++ 中的代码执行流由复合语句控制，如 if(){} 判断复合语句、for(){} 循环符号语句等等，这势必出现大量缩进。缩进虽然不影响语法正确性，但对提升代码清晰度有不可替代的功效。

在 vim 中有两类缩进表示法，一类是用 1 个制表符（'\t'），一类是用多个空格（' '）。两者并无本质区别，只是源码文件存储的字符不同而已，但，缩进可视化插件对两类缩进显示方式不同，前者只能显示为粗块，后者可显示为细条，就我的审美观而言，选后者。增加如下配置信息：

```
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
```
其中，注意下 expandtab、tabstop 与 shiftwidth、softtabstop、retab：

* expandtab，把制表符转换为多个空格，具体空格数量参考 tabstop 和 shiftwidth 变量；
* tabstop 与 shiftwidth 是有区别的。tabstop 指定我们在插入模式下输入一个制表符占据的空格数量，linux 内核编码规范建议是 8，看个人需要；shiftwidth 指定在进行缩进格式化源码时制表符占据的空格数。所谓缩进格式化，指的是通过 vim 命令由 vim 自动对源码进行缩进处理，比如其他人的代码不满足你的缩进要求，你就可以对其进行缩进格式化。缩进格式化，需要先选中指定行，要么键入 = 让 vim 对该行进行智能缩进格式化，要么按需键入多次 < 或 > 手工缩进格式化；
* softtabstop，如何处理连续多个空格。因为 expandtab 已经把制表符转换为空格，当你要删除制表符时你得连续删除多个空格，该设置就是告诉 vim 把连续数量的空格视为一个制表符，即，只删一个字符即可。通常应将这 tabstop、shiftwidth、softtabstop 三个变量设置为相同值；

另外，你总会阅读其他人的代码吧，他们对制表符定义规则与你不同，这时你可以手工执行 vim 的 retab 命令，让 vim 按上述规则重新处理制表符与空格关系。

很多编码规范建议缩进（代码嵌套类似）最多不能超过 4 层，但难免有更多层的情况，缩进一多，我那个晕啊：

<img src="./images/多层缩进.png" alt=""/>
（多层缩进）


我希望有种可视化的方式能将相同缩进的代码关联起来，indentLine（https://github.com/Yggdroot/indentLine ）来了。安装好该插件后，增加如下配置信息：

```
" -----------------------------------------------------------------------------
"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
" {{{
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" \il  显示 / 关闭对齐线
nnoremap <Leader>il :IndentLinesToggle<CR>

" 设置 Gvim 的对齐线样式
if g:isGUI
  let g:indentLine_char = "|"
  let g:indentLine_first_char = "|"
endif

" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 239

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'
" }}}
```

重启 vim 效果如下：

<img src="./images/不连续的缩进可视化.png" alt=""/>
（不连续的缩进可视化）

断节？Indent Guides 通过识别制表符来绘制缩进连接线，断节处是空行，没有制表符，自然绘制不出来，算是个小 bug，但瑕不掩瑜，有个小技巧可以解决，换行 - 空格 - 退格：

<img src="./images/完美可视化缩进.png" alt=""/>
（完美可视化缩进）


### 4.3 代码折叠

有时为了去除干扰，集中精力在某部分代码片段上，我会把不关注部分代码折叠起来。vim 自身支持多种折叠：手动建立折叠（manual）、基于缩进进行折叠（indent）、基于语法进行折叠（syntax）、未更改文本构成折叠（diff）等等，其中，indent、syntax 比较适合编程，按需选用。增加如下配置信息：

```
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
```

操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。效果如下：

<img src="./images/代码折叠.gif" alt=""/>
（代码折叠）


### 4.4 接口与实现快速切换

我习惯把类的接口和实现分在不同文件中，常有在接口文件（MyClass.h）和实现文件（MyClass.cpp）中来回切换的操作。你当然可以先分别打开接口文件和实现文件，再手动切换，但效率不高。我希望，假如在接口文件中，vim 自动帮我找到对应的实现文件，当键入快捷键，在新 buffer 中打开对应实现文件。

switchtoinc（https://github.com/liwangmj/green_vim_switchtoinc）来了。安装后增加配置信息：

```
" 用于头文件和源文件间快速切换。注：在a.vim插件基础上修改的。
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
" :AN    ---多个重名文件之间的切换
```
这样，键入 :A 就能在实现文件和接口文件间切换。如下图所示：

<img src="./images/接口文件与实现文件切换.gif" alt=""/>
（接口文件与实现文件切换）

上图中，初始状态先打开了接口文件 MyClass.h，键入 :A 后，vim 在新 buffer 中打开实现文件 MyClass.cpp，并在当前窗口中显示；再次键入 :A 后，当前窗口切回接口文件。

### 4.5 代码收藏

源码分析过程中，常常需要在不同代码间来回跳转，我需要“收藏”分散在不同处的代码行，以便需要查看时能快速跳转过去，这时，vim 的书签（mark）功能派上大用途了。

vim 书签的使用很简单，在你需要收藏的代码行键入 mm，这样就收藏好了，你试试，没反应？不会吧，难道你 linux 内核编译参数有问题，或者，vim 的编译参数没给全，让我想想，别急，喔，对了，你是指看不到书签？好吧，我承认这是 vim 最大的坑，书签所在行与普通行外观上没任何差别，肉眼，你是找不到他滴。这可不行，得来个让书签可视化的插件，vim-signature（https://github.com/kshenoy/vim-signature ）。vim-signature 通过在书签所在行的前面添加字符的形式，以此可视化书签，这就要求你源码安装的 vim 具备 signs 特性，具体可在 vim 命令模式下键入
```
:echo has('signs')
```
若显示 1 则具备该特性，反之 0 则不具备该特性，需参考“1 源码安装编辑器 vim ”重新编译 vim。

vim 的书签分为两类，独立书签和分类书签。独立书签，书签名只能由字母（a-zA-Z）组成，长度最多不超过 2 个字母，并且，同个文件中，不同独立书签名中不能含有相同字母，比如，a 和 bD 可以同时出现在同个文件在，而 Fc 和 c 则不行。分类书签，书签名只能由可打印特殊字符（!@#$%^&\*()）组成，长度只能有 1 个字符，同个文件中，你可以把不同行设置成同名书签，这样，这些行在逻辑上就归类成相同类型的书签了。下图定义了名为 a 和 dF 两个独立书签（分别 259 行和 261 行）、名为 # 的一类分类书签（含 256 行和 264 行）、名为 @ 的一类分类书签（257 行），如下所示：

<img src="./images/独立书签和分类书签.png" alt=""/>
（独立书签和分类书签）


两种形式的书签完全分布在各自不同的空间中，所以，它俩的任何操作都是互不相同的，比如，你无法遍历所有书签，要么只能在各个独立书签间遍历，要么只能在分类书签间遍历。显然，两种形式的书签都有各自的使用场景，就我而言，只使用独立书签，原因有二：一是独立书签可保存，当我设置好独立书签后关闭文档，下次重新打开该文档时，先前的独立书签仍然有效，而分类书签没有该特性（其他文档环境恢复参见“6.3 环境恢复”）；一是减少记忆快捷键，光是独立书签就有 8 种遍历方式，每种遍历对应一种快捷键，太难记了。

vim-signature 快捷键如下：

```
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
```
够多了吧，粗体部分是按个人习惯重新定义的快捷键，请添加进 .vimrc 中。

常用的操作也就如下几类：
* 书签设定。mx，设定 / 取消当前行名为 x 的标签；m,，自动设定下一个可用书签名，前面提说，独立书签名是不能重复的，在你已经有了多个独立书签，当想再设置书签时，需要记住已经设定的所有书签名，否则很可能会将已有的书签冲掉，这可不好，所以，vim-signature 为你提供了 m, 快捷键，自动帮你选定下一个可用独立书签名；mda，删除当前文件中所有独立书签。
* 书签罗列。m?，罗列出当前文件中所有书签，选中后回车可直接跳转；
* 书签跳转。mn，按行号前后顺序，跳转至下个独立书签；mp，按行号前后顺序，跳转至前个独立书签。书签跳转方式很多，除了这里说的行号前后顺序，还可以基于书签名字母顺序跳转、分类书签同类跳转、分类书签不同类间跳转等等。

效果如下：

<img src="./images/可视化书签.gif" alt=""/>
（可视化书签）


我虽然选用了 vim-signature，但不代表它完美了，对我而言，无法在不同文件的书签间跳转绝对算是硬伤。另外，如果觉得收藏的代码行只有行首符号来表示不够醒目，你可以考虑 BOOKMARKS--Mark-and-Highlight-Full-Lines 这个插件（https://github.com/vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines ），它可以让书签行高亮，如下是它的快捷键：<F1>，高亮所有书签行；<F2>，关闭所有书签行高亮；<SHIFT-F2>，清除 [a-z] 的所有书签；<F5>，收藏当前行；<SHIFT-F5>，取消收藏当前行。


### 4.6 标识符列表

本节之前的内容，虽说与代码开发有些关系，但最多也只能算作用户体验层面的，真正提升生产效率的内容将从此开始。

本文主题是探讨如何将 vim 打造成高效的 C/C++ 开发环境，希望实现标识符列表、定义跳转、声明提示、实时诊断、代码补全等等系列功能，这些都需要 vim 能够很好地理解我们的代码（不论是 vim 自身还是借助插件甚至第三方工具），如何帮助 vim 理解代码？基本上，有两种主流方式：标签系统和语义系统。至于优劣，简单来说，标签系统配置简单，而语义系统效果精准，后者是趋势。目前对于高阶 IDE 功能，部分已经有对应基于语义的插件支撑，而部分仍只能通过基于标签的方式实现，若同个功能既有语义插件又有标签插件，优选语义。

#### 标签系统

代码中的类、结构、类成员、函数、对象、宏等等这些统称为标识符，每个标识符的定义、所在文件中的行位置、所在文件的路径等等信息就是标签（tag）。

Exuberant Ctags（http://ctags.sourceforge.net/ ，后简称 ctags）就是一款经典的用于生成代码标签信息的工具 。ctags 最初只支持生成 C/C++ 语言，目前已支持 41 种语言，具体列表运行如下命令获取：

```
ctags --list-languages
```

学习知识最好方式就是动手实践。我们以 main.cpp、my_class.h、my_class.cpp 三个文件为例：

第一步，准备代码文件。创建演示目录 /data/workplace/example/、库子目录 /data/workplace/example/lib/，创建如下内容的 main.cpp：

```
#include <iostring>
#include <string>
#include "lib/my_class.h"
using namespace std;
int g_num = 128;
// 重载函数
static void
printMsg (char ch)
{
	std::cout << ch << std::endl;
}
int
main (void)
{
	// 局部对象
	const string	name = "yangyang.gnu";
	// 类
	MyClass	one;
	// 成员函数
	one.printMsg();
	// 使用局部对象
	cout << g_num << name << endl;
	return	(EXIT_SUCCESS);
}
```
创建如下内容的 my_class.h：

```
#pragma once
class MyClass
{
	public:
		void printMsg(void);
	private:
		;
};
```
创建如下内容的 my_class.cpp：

```
#include "my_class.h"
// 重载函数
static void
printMsg (int i)
{
	std::cout << i << std::endl;
}
void
MyClass::printMsg (void)
{
	std::cout << "I'M MyClass!" << std::endl;
}
```

第二步，生成标签文件。现在运行 ctags 生成标签文件：

```
cd /data/workplace/example/
ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++
```
命令行参数较多，主要关注 --c++-kinds，ctags 默认并不会提取所有标签，运行

```
ctags --list-kinds=c++
```
可看到 ctags 支持生成标签类型的全量列表：

```
c  classes
d  macro definitions
e  enumerators (values inside an enumeration)
f  function definitions
g  enumeration names
l  local variables [off]
m  class, struct, and union members
n  namespaces
p  function prototypes [off]
s  structure names
t  typedefs
u  union names
v  variable definitions
x  external and forward variable declarations [off]
```
其中，标为 off 的局部对象、函数声明、外部对象等类型默认不会生成标签，所以我显式加上所有类型。运行完后，example/ 下多了个文件 tags，内容大致如下：

```
!_TAG_FILE_FORMAT	2	/extended format; --format=1 will not append ;" to lines/
!_TAG_FILE_SORTED	1	/0=unsorted, 1=sorted, 2=foldcase/
!_TAG_PROGRAM_AUTHOR	Darren Hiebert	/dhiebert@users.sourceforge.net/
!_TAG_PROGRAM_NAME	Exuberant Ctags	//
!_TAG_PROGRAM_URL	http://ctags.sourceforge.net	/official site/
!_TAG_PROGRAM_VERSION	5.8	//
MyClass	lib/my_class.h	/^class MyClass $/;"	c
MyClass::printMsg	lib/my_class.cpp	/^MyClass::printMsg (void) $/;"	f	class:MyClass	signature:(void)
MyClass::printMsg	lib/my_class.h	/^		void printMsg(void);$/;"	p	class:MyClass	access:public	signature:(void)
endl	lib/my_class.cpp	/^	std::cout << "I'M MyClass!" << std::endl;$/;"	m	class:std	file:
endl	lib/my_class.cpp	/^	std::cout << i << std::endl;$/;"	m	class:std	file:
endl	main.cpp	/^	cout << g_num << name << endl;$/;"	l
endl	main.cpp	/^	std::cout << ch << std::endl;$/;"	m	class:std	file:
g_num	main.cpp	/^int g_num = 128;$/;"	v
main	main.cpp	/^main (void) $/;"	f	signature:(void)
name	main.cpp	/^	const string	name = "yangyang.gnu";$/;"	l
one	main.cpp	/^	MyClass	one;$/;"	l
printMsg	lib/my_class.cpp	/^MyClass::printMsg (void) $/;"	f	class:MyClass	signature:(void)
printMsg	lib/my_class.cpp	/^printMsg (int i) $/;"	f	file:	signature:(int i)
printMsg	lib/my_class.h	/^		void printMsg(void);$/;"	p	class:MyClass	access:public	signature:(void)
printMsg	main.cpp	/^	one.printMsg();$/;"	p	file:	signature:()
printMsg	main.cpp	/^printMsg (char ch) $/;"	f	file:	signature:(char ch)
std::endl	lib/my_class.cpp	/^	std::cout << "I'M MyClass!" << std::endl;$/;"	m	class:std	file:
std::endl	lib/my_class.cpp	/^	std::cout << i << std::endl;$/;"	m	class:std	file:
std::endl	main.cpp	/^	std::cout << ch << std::endl;$/;"	m	class:std	file:
```
其中，! 开头的几行是 ctags 生成的软件信息忽略之，下面的就是我们需要的标签，每个标签项至少有如下字段（命令行参数不同标签项的字段数不同）：标识符名、标识符所在的文件名（也是该文件的相对路径）、标识符所在行的内容、标识符类型（如，l 表示局部对象），另外，若是函数，则有函数签名字段，若是成员函数，则有访问属型字段等等。

#### 语义系统

通过 ctags 这类标签系统在一定程度上助力 vim 理解我们的代码，对于 C 语言这类简单语言来说，差不多也够了。近几年，随着 C++11/14 的推出，诸如类型推导、lamda 表达式、模版等等新特性，标签系统显得有心无力，这个星球最了解代码的工具非编译器莫属，如果编译器能在语义这个高度帮助 vim 理解代码，那么我们需要的各项 IDE 功能肯定能达到另一个高度。

语义系统，编译器必不可少。GCC 和 clang 两大主流 C/C++ 编译器，作为语义系统的支撑工具，我选择后者，除了 clang 对新标准支持及时、错误诊断信息清晰这些优点之外，更重要的是，它在高内聚、低耦合方面做得非常好，各类插件可以调用 libclang 获取非常完整的代码分析结果，从而轻松且优雅地实现高阶 IDE 功能。你对语义系统肯定还是比较懵懂，紧接着的“基于语义的声明 / 定义跳转”会让你有更为直观的了解，现在，请跳转至“7.1 编译器 / 构建工具集成”，一是了解 clang 相较 GCC 的优势，二是安装好最新版 clang 及其标准库，之后再回来。

#### 基于标签的标识符列表

在阅读代码时，经常分析指定函数实现细节，我希望有个插件能把从当前代码文件中提取出的所有标识符放在一个侧边子窗口中，并且能能按语法规则将标识符进行归类，tagbar （https://github.com/majutsushi/tagbar ）是一款基于标签的标识符列表插件，它自动周期性调用 ctags 获取标签信息（仅保留在内存，不落地成文件）。安装完 tagbar 后，在 .vimrc 中增加如下信息：

```
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键
nnoremap <Leader>tb :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=30
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
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
```
前面提过，ctags 默认并不会提取局部对象、函数声明、外部对象等类型的标签，我必须让 tagbar 告诉 ctags 改变默认参数，这是 tagbar_type_cpp 变量存在的主要目的，所以前面的配置信息中将局部对象、函数声明、外部对象等显式将其加进该变量的 kinds 域中。具体格式为

```
  {short}:{long}[:{fold}[:{stl}]]
```
用于描述函数、变量、结构体等等不同类型的标识符，每种类型对应一行。其中，short 将作为 ctags 的 --c++-kinds 命令行选项的参数，类似：

```
  --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
```
long 将作为 short 的简要描述展示在 vim 的 tagbar 子窗口中；fold 表示这种类型的标识符是否折叠显示；stl 指定是否在 vim 状态栏中显示附加信息。

重启 vim 后，打开一个 C/C++ 源码文件，键入 <leader>tb，将在左侧的 tagbar 窗口中将可看到标签列表：

<img src="./images/基于标签的标识符列表.gif" alt=""/>
（基于标签的标识符列表）

从上图可知 tagbar 的几个特点：
* 按作用域归类不同标签。按名字空间 n_foo、类 Foo 进行归类，在内部有声明、有定义；
* 显示标签类型。名字空间、类、函数等等；
* 显示完整函数原型；
* 图形化显示共有成员（+）、私有成员（-）、保护成员（#）；

在标识符列表中选中对应标识符后回车即可跳至源码中对应位置；在源码中停顿几秒，tagbar 将高亮对应标识符；每次保存文件时或者切换到不同代码文件时 tagbar 自动调用 ctags 更是标签数据库；tagbar 有两种排序方式，一是按标签名字母先后顺序、一是按标签在源码中出现的先后顺序，在 .vimrc 中我配置选用后者，键入 s 切换不同不同排序方式。

### 4.7 声明 / 定义跳转

假设你正在分析某个开源项目源码，在 main.cpp 中遇到调用函数 func()，想要查看它如何实现，一种方式：在 main.cpp 中查找 -> 若没有在工程内查找 -> 找到后打开对应文件 -> 文件内查找其所在行 -> 移动光标到该行 -> 分析完后切换会先前文件，不仅效率太低更要命的是影响我的思维连续性。我需要另外高效的方式，就像真正函数调用一样：光标选中调用处的 func() -> 键入某个快捷键自动转换到 func() 实现处 -> 键入某个键又回到 func() 调用处，这就是所谓的定义跳转。

基本上，vim 世界存在两类导航：基于标签的跳转和基于语义的跳转。

#### 基于标签的声明 / 定义跳转

继续延用前面接收标签系统的例子文件 main.cpp、my_class.h、my_class.cpp，第二步已经生成好了标签文件，那么要实现声明 / 定义跳转，需要第三步，引入标签文件。这让 vim 知晓标签文件的路径。在 /data/workplace/example/ 目录下用 vim 打开 main.cpp，在 vim 中执行如下目录引入标签文件 tags：

```
:set tags+=/data/workplace/example/tags
```
既然 vim 有个专门的命令来引入标签，说明 vim 能识别标签。虽然标签文件中并无行号，但已经有标签所在文件，以及标签所在行的完整内容，vim 只需切换至对应文件，再在文件内作内容查找即可找到对应行。换言之，只要有对应的标签文件，vim 就能根据标签跳转至标签定义处。

这时，你可以体验下初级的声明 / 定义跳转功能。把光标移到 main.cpp 的 one.printMsg() 那行的 printMsg 上，键入快捷键 g]，vim 将罗列出名为 printMsg 的所有标签候选列表，按需选择键入编号即可跳转进入。如下图：

<img src="./images/待选标签.png" alt=""/>
（待选标签）


目前为止，离我预期还有差距。

第一，选择候选列表影响思维连续性。首先得明白为何会出现待选列表。前面说过，vim 做的事情很简单，就是把光标所在单词放到标签文件中查找，如果只有一个，当然你可以直接跳转过去，大部分时候会找到多项匹配标签，比如，函数声明、函数定义、函数调用、函数重载等等都会导致同个函数名出现在多个标签中，vim 无法知道你要查看哪项，只能让你自己选择。其实，因为标签文件中已经包含了函数签名属性，vim 的查找机制如果不是基于关键字，而是基于语义的话，那也可以直接命中，期待后续 vim 有此功能吧。既然无法直接解决，换个思路，我不想选择列表，但可以接受遍历匹配标签。就是说，我不想输入数字选择第几项，但可以接受键入正向快捷键后遍历第一个匹配标签，再次键入快捷键遍历第二个，直到最后一个，键入反向快捷键逆序遍历。这下事情简单了，命令 :tnext 和 :tprevious 分别先后和向前遍历匹配标签，定义两个快捷键搞定：

```
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
```
等等，这还不行，vim 中有个叫标签栈（tags stack）的机制，:tnext、:tprevious 只能遍历已经压入标签栈内的标签，所以，你在遍历前需要通过快捷键 ctrl-] 将光标所在单词匹配的所有标签压入标签栈中，然后才能遍历。不说复杂了，以后你只需先键入 ctrl-]，若没跳转至需要的标签，再键入 <leader>tn 往后或者 <leader>tp 往前遍历即可。如下图所示：

<img src="./images/基于标签的跳转.gif" alt=""/>
（基于标签的跳转）


第二，如何返回先前位置。当分析完函数实现后，我需要返回先前调用处，可以键入 vim 快捷键 ctrl-t 返回，如果想再次进入，可以用前面介绍的方式，或者键入 ctrl-i。另外，注意，ctrl-o 以是一种返回快捷键，但与 ctrl-t 的返回不同，前者是返回上次光标停留行、后者返回上个标签。

### 4.7 内容查找

vim 支持正则表达式，那么已经具有强劲的查供能力，在当前文件内查找，vim 的 / 和 ? 查找命令非常好用，但工程内查找，自带的查找用户体验还无法达到我的预期。

内容查找，你第一反应会想到 grep 和 ack 两个工具，没错，它俩强大的正则处理能力无需质疑，如果有插件能在 vim 中集成两个工具之一，那么任何查找任务均可轻松搞定，为此，出现了 grep.vim（https://github.com/yegappan/grep ）和 ack.vim（https://github.com/mileszs/ack.vim ）两个插件，通过它们，你可以在 vim 中自在地使用高度整合的 grep 或 ack 两个外部命令，就像 vim 的内部命令一样：查找时，把光标定位到待查找关键字上后，通过快捷键立即查找该关键字，查询结果通过列表形式将关键字所在行罗列出来，选择后就能跳转到对应位置。很好，这全部都是我想要的，但是，不是我想要的全部。

你知道，在分析源码时，同个关键字会在不同文件的不同位置多次出现，grep.vim 和 ack.vim 只能“将关键字所在行罗列出来”，如果关键字出现的那几行完全相同，那么，我单凭这个列表是无法确定哪行是我需要的，比如，我查找关键字 cnt，代码中，cnt 在 4 行出现过、64 行、128 行、1024 行都出现过，且每行内容均为

```
++cnt;
```
这时，即便 grep.vim 或 ack.vim 在一个有四个选项的列表中为你罗列出相关行，因为完全相同，所以你也无法确定到底应该查看第几项。换言之，除了罗列关键字所在行之外，我还需要看到所在行的上下几行，这样，有了上下文，我就可以最终决定哪一行是我需要的了。ctrlsf.vim（https://github.com/dyng/ctrlsf.vim ）为此而生。

ctrlsf.vim 后端调用 ack，所以你得提前自行安装，版本不得低于 v2.0，openSUSE 用户可以

```
zypper --no-refresh in ack
```
进行安装。ctrlsf.vim 支持 ack 所有选项，要查找某个关键字（如，yangyang），你可以想让光标定位在该关键字上面，然后命令模式下键入

```
:CtrlSF
```
将自动提取光标所在关键字进行查找，你也可以指定 ack 的选项

```
:CtrlSF -i -C 1 [pattern] /my/path/
```
为方便操作，我设定了快捷键：

```
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
```
避免手工键入命令的麻烦。查找结果将以子窗口在左侧呈现，不仅罗列出所有匹配项，而且给出匹配项的上下文。如果从上下文中你还觉得信息量不够，没事，可以键入 p 键，将在右侧子窗口中给出该匹配项的完整代码，而不再仅有前后几行。不想跳至任何匹配项，可以直接键入 q 退出 ctrlsf.vim；如果有钟意的匹配项，光标定位该项后回车，立即跳至新 buffer 中对应位置。

太性感了，以关键字 CmdlineOption 为例，如下所示：

<img src="./images/内容查找.gif" alt=""/>
（内容查找）


### 4.8 内容替换

有个名为 iFoo 的全局变量，被工程中 16 个文件引用过，由于你岳母觉得匈牙利命名法严重、异常、绝对以及十分万恶，为讨岳母欢心，不得不将该变量更名为 foo，怎么办？依次打开每个文件，逐一查找后替换？对我而言，内容替换存在两种场景：快捷替换和精确替换。

#### 快捷替换

前面介绍的 ctrlsf 已经把匹配的字符串汇总在侧边子窗口中显示了，同时，它还允许我们直接在该子窗口中进行编辑操作，在这种环境下，如果我们能快捷选中所有匹配字符串，那么就可以先批量删除再在原位插入新的字符串，这岂不是我们需要的替换功能么？

快捷选中 ctrlsf 子窗口中的多个匹配项，关键还是这些匹配项分散在不同行的不同位置，这就需要多光标编辑功能，vim-multiple-cursors 插件（https://github.com/terryma/vim-multiple-cursors ）为次而生。装好 vim-multiple-cursors 后，你随便编辑个文档，随便输入多个相同的字符串，先在可视化模式下选中其中一个，接着键入 ctrl-n，你会发现第二个该字符串也被选中了，持续键入 ctrl-n，你可以选中所有相同的字符串，把这个功能与 ctrlsf 结合，你来感受下：

<img src="./images/快捷替换.gif" alt=""/>
（快捷替换）

上图中，我想将 prtHelpInfo() 更名为 showHelpInfo()，先通过 ctrlsf 找到工程中所有 prtHelpInfo，然后直接在 ctrlsf 子窗口中选中第一个 ptr，再通过 vim-multiple-cursors 选中第二个 ptr，接着统一删除 ptr 并统一键入 show，最后保存并重新加载替换后的文件。

vim-multiple-cursors 默认快捷键与我系统中其他软件的快捷键冲突，按各自习惯重新设置：

```
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-p>
```

#### 精确替换

vim 有强大的内容替换命令：

```
:[range]s/{pattern}/{string}/[flags]
```

在进行内容替换操作时，我关注几个因素：如何指定替换文件范围、是否整词匹配、是否逐一确认后再替换。

如何指定替换文件范围？

* 如果在当前文件内替换，[range] 不用指定，默认就在当前文件内；
* 如果在当前选中区域，[range] 也不用指定，在你键入替换命令时，vim 自动将生成如下命令：

```
:'<,'>s/{pattern}/{string}/[flags]
```
* 你也可以指定行范围，如，第三行到第五行：

```
:3,5s/{pattern}/{string}/[flags]
```
* 如果对打开文件进行替换，你需要先通过 :bufdo 命令显式告知 vim 范围，再执行替换；
* 如果对工程内所有文件进行替换，先 :args \*\*/*.cpp **/*.h 告知 vim 范围，再执行替换；

是否整词匹配？{pattern} 用于指定匹配模式。如果需要整词匹配，则该字段应由 \< 和 \> 修饰待替换字符串（如，\<iFoo\>）；无须整词匹配则不用修饰，直接给定该字符串即可；

是否逐一确认后再替换？[flags] 可用于指定是否需要确认。若无须确认，该字段设定为 ge 即可；有时不见得所有匹配的字符串都需替换，若在每次替换前进行确认，该字段设定为 gec 即可。

是否整词匹配和是否确认两个条件叠加就有 4 种组合：非整词且不确认、非整词且确认、整词且不确认、整词且确认，每次手工输入这些命令真是麻烦；我把这些组合封装到一个函数中，如下 Replace() 所示：

```
" 替换函数。参数说明：
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
```
为最大程度减少手工输入，Replace() 还能自动提取待替换字符串（只要把光标移至待替换字符串上），同时，替换完成后自动为你保存更改的文件。现在要做的就是赋予 confirm、wholeword 不同实参实现 4 种组合，再绑定 4 个快捷键即可。如下：

```
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
```
我平时用的最多的无须确认但整词匹配的替换模式，即 \<leader>rw。

请将完整配置信息添加进 .vimrc 中：

```
" 替换函数。参数说明：
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
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
```

比如，我将工程的所有 *.cpp 和 *.h 中的关键字 MyClassA 按不确认且整词匹配模式替换成 MyClass，所以注释中的关键字不会被替换掉。如下所示：

<img src="./images/不确认且整词匹配模式的替换.gif" alt=""/>
（不确认且整词匹配模式的替换）

又比如，对当前文件采用需确认且无须整词匹配的模式进行替换，你会看到注释中的关键字也被替换了：

<img src="./images/确认且无须整词匹配模式的替换.gif" alt=""/>
（确认且无须整词匹配模式的替换）



## 5 代码开发

在具体编码过程中，我需要一系列提高生产力的功能：批量开 / 关注释、快速输入代码模板、代码智能补全、路径智能补全、从接口生成实现、查看参考库信息等等，我们逐一来实现。

### 5.1 快速开关注释

需要注释时，到每行代码前输入 //，取消注释时再删除 //，这种方式不是现代人的行为。IDE 应该支持对选中文本块批量（每行）添加注释符号，反之，可批量取消。本来 vim 通过宏方式可以支持该功能，但每次注释时要自己录制宏，关闭 vim 后宏无法保存，所以有人专门编写了一款插件 NERD Commenter（https://github.com/scrooloose/nerdcommenter ），NERD Commenter 根据编辑文档的扩展名自适应采用何种注释风格，如，文档名 x.cpp 则采用 // 注释风格，而 x.c 则是 /\*\*/ 注释风格；另外，如果选中的代码并非整行，那么该插件将用 /\*\*/ 只注释选中部分。

常用操作：

* \<leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /*、*/；
* \<leader>cu，取消选中文本块的注释。

如下图所示：

<img src="./images/快速开关注释.gif" alt=""/>
（快速开 / 关注释）


### 5.2 模板补全

开发时，我经常要输入相同的代码片断，比如 if-else、switch 语句，如果每个字符全由手工键入，我可吃不了这个苦，我想要简单的键入就能自动帮我完成代码模板的输入，并且光标停留在需要我编辑的位置，比如键入 if，vim 自动完成

```
if (/* condition */) {
    TODO
}
```
而且帮我选中 /* condition */ 部分，不会影响编码连续性 —— UltiSnips（https://github.com/SirVer/ultisnips ），我的选择。

在进行模板补全时，你是先键入模板名（如，if），接着键入补全快捷键（默认 \<tab>），然后 UltiSnips 根据你键入的模板名在代码模板文件中搜索匹配的“模板名 - 模板”，找到对应模板后，将模板在光标当前位置展开。

UltiSnips 有一套自己的代码模板语法规则，类似：

```
snippet if "if statement" i
if (${1:/* condition */}) {
    ${2:TODO}
}
endsnippet
```

其中，snippet 和 endsnippet 用于表示模板的开始和结束；if 是模板名；"if statement" 是模板描述，你可以把多个模板的模板名定义成一样（如，if () {} 和 if () {} else {} 两模板都定义成相同模板名 if），在模板描述中加以区分（如，分别对应 "if statement" 和 "if-else statement"），这样，在 YCM（重量级智能补全插件） 的补全列表中可以根据模板描述区分选项不同模板；i 是模板控制参数，用于控制模板补全行为，具体参见“快速编辑结对符”一节；${1}、${2} 是 \<tab> 跳转的先后顺序。

新版 UltiSnips 并未自带预定义的代码模板，你可以从 https://github.com/honza/vim-snippets 获取各类语言丰富的代码模板，也可以重新写一套符合自己编码风格的模板。无论哪种方式，你需要在 .vimrc 中设定该模板所在目录名，以便 UltiSnips 寻找到。比如，我自定义的代码模板文件 cpp.snippets，路径为 ~/.vim/bundle/ultisnips/mysnippets/cpp.snippets，对应设置如下：
let g:UltiSnipsSnippetDirectories=["mysnippets"]
其中，目录名切勿取为 snippets，这是 UltiSnips 内部保留关键字；另外，目录一定要是 ~/.vim/bundle/ 下的子目录，也就是 vim 的运行时目录。

完整 cpp.snippets 内容如下：

```
#=================================
#预处理
#=================================
# #include "..."
snippet INC
#include "${1:TODO}"${2}
endsnippet
# #include <...>
snippet inc
#include <${1:TODO}>${2}
endsnippet
#=================================
#结构语句
#=================================
# if
snippet if
if (${1:/* condition */}) {
    ${2:TODO}
}
endsnippet
# else if
snippet ei
else if (${1:/* condition */}) {
    ${2:TODO}
}
endsnippet
# else
snippet el
else {
    ${1:TODO}
}
endsnippet
# return
snippet re
return(${1:/* condition */});
endsnippet
# Do While Loop
snippet do
do {
    ${2:TODO}
} while (${1:/* condition */});
endsnippet
# While Loop
snippet wh
while (${1:/* condition */}) {
    ${2:TODO}
}
endsnippet
# switch
snippet sw
switch (${1:/* condition */}) {
    case ${2:c}: {
    }
    break;

    default: {
    }
    break;
}
endsnippet
# 通过迭代器遍历容器（可读写）
snippet for
for (auto ${2:iter} = ${1:c}.begin(); ${3:$2} != $1.end(); ${4:++iter}) {
    ${5:TODO}
}
endsnippet
# 通过迭代器遍历容器（只读）
snippet cfor
for (auto ${2:citer} = ${1:c}.cbegin(); ${3:$2} != $1.cend(); ${4:++citer}) {
    ${5:TODO}
}
endsnippet
# 通过下标遍历容器
snippet For
for (decltype($1.size()) ${2:i} = 0; $2 != ${1}.size(); ${3:++}$2) {
    ${4:TODO}
}
endsnippet
# C++11 风格 for 循环遍历（可读写）
snippet F
for (auto& e : ${1:c}) {
}
endsnippet
# C++11 风格 for 循环遍历（只读）
snippet CF
for (const auto& e : ${1:c}) {
}
endsnippet
# For Loop
snippet FOR
for (unsigned ${2:i} = 0; $2 < ${1:count}; ${3:++}$2) {
    ${4:TODO}
}
endsnippet
# try-catch
snippet try
try {
} catch (${1:/* condition */}) {
}
endsnippet
snippet ca
catch (${1:/* condition */}) {
}
endsnippet
snippet throw
th (${1:/* condition */});
endsnippet
#=================================
#容器
#=================================
# std::vector
snippet vec
vector<${1:char}>	v${2};
endsnippet
# std::list
snippet lst
list<${1:char}>	l${2};
endsnippet
# std::set
snippet set
set<${1:key}>	s${2};
endsnippet
# std::map
snippet map
map<${1:key}, ${2:value}>	m${3};
endsnippet
#=================================
#语言扩展
#=================================
# Class
snippet cl
class ${1:`Filename('$1_t', 'name')`}
{
    public:
        $1 ();
        virtual ~$1 ();

    private:
};
endsnippet
#=================================
#结对符
#=================================
 # 括号 bracket
snippet b "bracket" i
(${1})${2}
endsnippet
# 方括号 square bracket，设定为 st 而非 sb，避免与 b 冲突
snippet st "square bracket" i
[${1}]${2}
endsnippet
# 大括号 brace
snippet br "brace" i
{
    ${1}
}${2}
endsnippet
# 单引号 single quote，设定为 se 而非 sq，避免与 q 冲突
snippet se "single quote" I
'${1}'${2}
endsnippet
# 双引号 quote
snippet q "quote" I
"${1}"${2}
endsnippet
# 指针符号 arrow
snippet ar "arrow" i
->${1}
endsnippet
# dot
snippet d "dot" i
.${1}
endsnippet
# 作用域 scope
snippet s "scope" i
::${1}
endsnippet
```

默认情况下，UltiSnips 模板补全快捷键是 \<tab>，可以在 .vimrc 中重新设定：

```
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
```

效果如下：

<img src="./images/模板补全.gif" alt=""/>
（模板补全）



### 5.3 智能补全

真的，这绝对是 G 点。智能补全是提升编码效率的杀手锏。试想下，有个函数叫 getCountAndSizeFromRemotefile()，当你输入 get 后 IDE 自动帮你输入完整的函数名，又如，有个文件 ~/this/is/a/deep/dir/file.txt，就像在 shell 中一样，键入 tab 键自动补全文件路径那是何等惬意！

智能补全有两类实现方式：基于标签的、基于语义的。

#### 基于标签的智能补全

前面代码导航时介绍过标签，每个标签项含有标签名、作用域等等信息，当键入某几个字符时，基于标签的补全插件就在标签文件中搜索匹配的标签项，并罗列出来，你选择中意的，这与前面代码导航类似，一个是用于跳转、一个用于输入。基于标签的补全，后端 ctags 先生成标签文件，前端采用插件 new-omni-completion（内置）进行识别。这种方式操作简单、效果不错，一般来说两步搞定。

第一步，生成标签文件。在工程目录的根目录执行 ctags，该目录下会多出个 tags 文件；

第二步，引入标签文件。在 vim 中引入标签文件，在 vim 中执行命令

```
:set tags+=/home/your_proj/tags
```

后续，在编码时，键入标签的前几个字符后依次键入 ctrl-x ctrl-o 将罗列匹配标签列表、若依次键入 ctrl-x ctrl-i 则文件名补全、ctrl-x ctrl-f 则路径补全。

举个例子，演示如何智能补全 C++ 标准库。与前面介绍的一般步骤一样，先调用 ctags 生成标准库的标签文件，再在 vim 中引入即可，最后编码时由相应插件实时搜索标签文件中的类或模板，显示匹配项：

首先，获取 C++ 标准库源码文件。安装的 GNU C++ 标准库源码文件，openSUSE 可用如下命令：

```
zypper install libstdc++48-devel
```
安装成功后，在 /usr/include/c++/4.8/ 可见到所有源码文件；

接着，执行 ctags 生成标准库的标签文件：

```
cd /usr/include/c++/4.8
ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags
```

然后，让 OmniCppComplete 成功识别标签文件中的标准库接口。C++ 标准库源码文件中使用了 _GLIBCXX_STD 名字空间（GNU C++ 标准库的实现是这样，如果你使用其他版本的标准库，需要自行查找对应的名字空间名称），标签文件里面的各个标签都嵌套在该名字空间下，所以，要让 OmniCppComplete 正确识别这些标签，必须显式告知 OmniCppComplete 相应的名字空间名称。在.vimrc 中增加如下内容：

```
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
```

最后，在 vim 中引入该标签文件。在 .vimrc 中增加如下内容：

```
set tags+=/usr/include/c++/4.8/stdcpp.tags
```
后续你就可以进行 C++ 标准库的代码补全，比如，在某个 string 对象名输入 . 时，vim 自动显示成员列表。如下图所示：

<img src="./images/基于标签的 C++ 标准库补全.png" alt=""/>
（基于标签的 C++ 标准库补全）


没明白？ -。-# 咱再来个例子，看看如何补全 linux 系统 API。与前面的标准库补全类似，唯一需要注意，linux 系统 API 头文件中使用了 GCC 编译器扩展语法，必须告诉 ctags 在生成标签时忽略之，否则将生产错误的标签索引。

首先，获取 linux 系统 API 头文件。openSUSE 可用如下命令：

```
zypper install linux-glibc-devel
```
安装成功后，在 /usr/include/ 中可见相关头文件；

接着，执行 ctags 生成系统 API 的标签文件。linux 内核采用 GCC 编译，为提高内核运行效率，linux 源码文件中大量采用 GCC 扩展语法，这影响 ctags 生成正确的标签，必须借由 ctags 的 -I 命令参数告之忽略某些标签，若有多个忽略字符串之间用逗号分割。比如，在文件 unistd.h 中几乎每个 API 声明中都会出现 __THROW、__nonnull 关键字，前者目的是告诉 GCC 这些函数不会抛异常，尽量多、尽量深地优化这些函数，后者目的告诉 GCC 凡是发现调用这些函数时第一个实参为 nullptr 指针则将其视为语法错误，的确，使用这些扩展语法方便了我们编码，但却影响了 ctags 正常解析，这时可用 -I __THROW,__nonnull 命令行参数让 ctags 忽略这些语法扩展关键字：

```
cd /usr/include/
ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull -f sys.tags
```

最后，在 vim 中引入该标签文件。在 .vimrc 中增加如下内容：

```
set tags+=/usr/include/sys.tags
```

从以上两个例子来看，不论是 C++ 标准库、boost、ACE 这些重量级开发库，还是 linux 系统 API 均可遵循“下载源码（至少包括头文件）- 执行 ctags 生产标签文件 - 引入标签文件”的流程实现基于标签的智能补全，若有异常，唯有如下两种可能：一是源码中使用了名字空间，借助 OmniCppComplete 插件的 OmniCpp_DefaultNamespaces 配置项解决；一是源码中使用了编译器扩展语法，借助 ctags 的 -I 参数解决（上例仅列举了少量 GCC 扩展语法，此外还有 \__attribute_malloc__、__wur 等等大量扩展语法，具体请参见 GCC 手册。以后，如果发现某个系统函数无法自动补全，十有八九是头文件中使用使用了扩展语法，先找到该函数完整声明，再将其使用的扩展语法加入 -I 列表中，最后运行 ctags 重新生产新标签文件即可）。

### 5.4 库信息参考

有过 win32 SDK 开发经验的朋友对 MSDN 或多或少有些迷恋吧，对于多达 7、8 个参数的 API，如果没有一套函数功能描述、参数讲解、返回值说明的文档，那么软件开发将是人间炼狱。别急，vim 也能做到。

要使用该功能，系统中必须先安装对应 man。安装 linux 系统函数 man，先下载（https://www.kernel.org/doc/man-pages/download.html ），解压后将 man1/ 至 man8/ 拷贝至 /usr/share/man/，运行 man fork 确认是否安装成功。安装 C++ 标准库 man，先下载（ftp://GCC.gnu.org/pub/GCC/libstdc++/doxygen/ ），选择最新 libstdc++-api-X.X.X.man.tar.bz2，解压后将 man3/ 拷贝至 /usr/share/man/，运行 man std::vector 确认是否安装成功；

vim 内置的 man.vim 插件可以查看已安装的 man，需在 .vimrc 中配置启动时自动加载该插件：

```
" 启用：Man 命令查看各类 man 信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义：Man 命令查看各类 man 信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>
```
需要查看时，在 vim 中键入输入 :Man fork 或者 :Man std::vector （注意大小写）即可在新建分割子窗口中查看到函数参考信息，为了方便，我设定了快捷键 \<Leader>man，这样，光标所在单词将被传递给 :Man 命令，不用再手工键入，如下图所示：

<img src="./images/库信息参考.gif" alt=""/>
（库信息参考）


另外，我们编码时通常都是先声明使用 std 名字空间，在使用某个标准库中的类时前不会添加 std:: 前缀，所以 vim 取到的当前光标所在单词中也不会含有 std:: 前缀，而，C++ 标准库所有 man 文件名均有 std:: 前缀，所以必须将所有文件的 std:: 前缀去掉才能让 :Man 找到正确的 man 文件。在 libstdc++-api-X.X.X.man/man3/ 执行批量重命名以取消所有 man 文件的 std:: 前缀：

```
rename "std::" "" std::\*
```
顺便说下，很多人以为 rename 命令只是 mv 命令的简单封装，非也，在重命名方面，rename 太专业了，远非 mv 可触及滴，就拿上例来说，mv 必须结合 sed 才能达到这样的效果。

我认为，好的库信息参考手册不仅有对参数、返回值的描述，还应有使用范例，上面介绍的 linux 系统函数 man 做到了，C++ 标准库 man 还未达到我要求。所以，若有网络条件，我更愿意选择查看在线参考，C++ 推荐 http://www.cplusplus.com/reference/ 、http://en.cppreference.com/w/Cppreference:Archives ，前者范例多、后者更新勤；UNIX 推荐 http://pubs.opengroup.org/onlinepubs/9699919799/functions/contents.html 、http://man7.org/linux/man-pages/dir_all_alphabetic.html ，前者基于最新 SUS（Single UNIX Specification，单一 UNIX 规范）、后者偏重 linux 扩展。

## 6 工程管理

我虽不要求达不到软件工程的高度，但基本的管理还是有必要的，比如，工程文件的管理、多文档编辑、工程环境的保存与恢复。

### 6.1 工程文件浏览

我通常将工程相关的文档放在同个目录下，通过 NERDtree （https://github.com/scrooloose/nerdtree ）插件可以查看文件列表，要打开哪个文件，光标选中后回车即可在新 buffer 中打开。

安装好 NERDtree 后，请将如下信息加入.vimrc 中：

```
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=32
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
```

常用操作：回车，打开选中文件；r，刷新工程目录文件列表；I（大写），显示 / 隐藏隐藏文件；m，出现创建 / 删除 / 剪切 / 拷贝操作列表。键入 \<leader>fl 后，右边子窗口为工程项目文件列表，如下图所示：

<img src="./images/工程文件浏览.gif" alt=""/>
（工程文件浏览）


### 6.2 多文档编辑

vim 的多文档编辑涉及三个概念：buffer、window、tab，这三个事物与我们常规理解意义大相径庭。vim 把加载进内存的文件叫做 buffer，buffer 不一定可见；若要 buffer 要可见，则必须通过 window 作为载体呈现；同个看面上的多个 window 组合成一个 tab。一句话，vim 的 buffer、window、tab 你可以对应理解成视角、布局、工作区。我所用到的多文档编辑场景几乎不会涉及 tab，重点关注 buffer、window。

vim 中每打开一个文件，vim 就对应创建一个 buffer，多个文件就有多个 buffer，但默认你只看得到最后 buffer 对应的 window，通过插件 MiniBufExplorer（https://github.com/fholgado/minibufexpl.vim ，原始版本已停止更新且问题较多，该版本是其他人 fork 的新项目）可以把所有 buffer 罗列出来，并且可以显示多个 buffer 对应的 window。如下图所示：

<img src="./images/buffer 列表.png" alt=""/>
（buffer 列表）

我在 vim 中打开了 main.cpp、CMakeLists.txt、MyClass.cpp、MyClass.h 这四个文件，最上面子窗口（buffer 列表）罗列出的 [1:main.cpp][4:CMakeLists.txt][5:MyClass.cpp][6:MyClass.h] 就是对应的四个 buffer。当前显示了 main.cpp 和 MyClass.h 的两个 buffer，分别对应绿色区域和橙色区域的 window，这下对 buffer 和 window 有概念了吧。图中关于 buffer 列表再说明两点：

* \* 表示当前有 window 的 buffer，换言之，有 * 的 buffer 是可见的；! 表示当前正在编辑的 window；
* 你注意到 buffer 序号 1 和 4 不连续的现象么？只要 vim 打开一个 buffer，序号自动增一，中间不连续有几个可能：可能一，打开了 1、2、3、4 后，用户删除了 2、3 两个 buffer，剩下 1、4；可能二，先打开了其他插件的窗口（如，tagbar）后再打开代码文件；

配置：将如下信息加入 .vimrc 中：

```
" 显示 / 隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
```

操作：一般通过 NERDtree 查看工程文件列表，选择打开多个代码文件后，MiniBufExplorer 在顶部自动创建 buffer 列表子窗口。通过前面配置，ctrl-tab 正向遍历 buffer，ctrl-shift-tab 逆向遍历（光标必须在 buffer 列表子窗口外）；在某个 buffer 上键入 d 删除光标所在的 buffer（光标必须在 buffer 列表子窗口内）：

<img src="./images/多文档编辑.gif" alt=""/>
（多文档编辑）


默认时，打开的 window 占据几乎整个 vim 编辑区域，如果你想把多个 window 平铺成多个子窗口可以使用 MiniBufExplorer 的 s 和 v 命令：在某个 buffer 上键入 s 将该 buffer 对应 window 与先前 window 上下排列，键入 v 则左右排列（光标必须在 buffer 列表子窗口内）。如下图所示：

<img src="./images/在子窗口中编辑多文档.gif" alt=""/>
（在子窗口中编辑多文档）

图中，通过 vim 自身的 f 名字查找 buffer 序号可快速选择需要的 buffer。另外，编辑单个文档时，不会出现 buffer 列表。

### 6.3 环境恢复*

vim 的编辑环境保存与恢复是我一直想要的功能，我希望每当重新打开 vim 时恢复：已打开文件、光标位置、undo/redo、书签、子窗口、窗口大小、窗口位置、命令历史、buffer 列表、代码折叠。vim 文档说 viminfo 特性可以恢复书签、session 特性可以恢复书签外的其他项，所以，请确保你的 vim 支持这两个特性：

```
vim --version | grep mksession
vim --version | grep viminfo
```
如果编译 vim 时添加了 --with-features=huge 选项那就没问题。

一般说来，保存 / 恢复环境步骤如下。

第一步，保存所有文档：

```
:wa
```
第二步，借助 viminfo 和 session 保存当前环境：

```
:mksession! my.vim
:wviminfo! my.viminfo
```
第三步，退出 vim：

```
:qa
```
第四步，恢复环境，进入 vim 后执行：

```
:source my.vim
:rviminfo my.viminfo
```

具体能保存哪些项，可由 sessionoptions 指定，另外，前面几步可以设定快捷键，在 .vimrc 中增加：

```
" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史
set undodir=~/.undo_history/
set undofile
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
```
这样，简化第二步、第四步操作。另外，sessionoptions 无法包含 undo 历史，你得先得手工创建存放 undo 历史的目录（如，.undo_history/）再通过开启 undofile 进行单独设置，一旦开启，每次写文件时自动保存 undo 历史，下次加载在文件时自动恢复所有 undo 历史，不再由 :mksession/:wviminfo 和 :source/:rviminfo 控制。

按此操作，并不能像 vim 文档中描述的那样能保存所有环境，比如，书签、代码折叠、命令历史都无法恢复。这和我预期存在较大差距，暂且用用吧，找个时间再深入研究！

## 7 工具链集成

既然我们要把 vim 打造成 IDE，那必须得集成编译器、构建工具、静态分析器、动态调试器，当然，你可能还需要版本控制、重构工具等等，我暂时还好。

### 7.1 编译器 / 构建工具集成

先说下编译器和构建工具。vim 再强大也只能是个优秀的编辑器而非编译器，它能高效地完成代码编辑工作，但必须通过其他外部命令实现将代码转换为二进制可执行文件；一旦工程上规模，你不可能单个单个文件编译，这时构建工具就派上场了。

#### 代码编译

GCC 是 linux 上 C/C++ 编译器的事实标准，几乎所有发行套件都默认安装，它很好但不是最好：编译错误提示信息可读性不够（特别对于 C++ 模板错误信息基本就是读天书）、基于 GCC 的二次开发困难重重。我需要更优秀的 C++ 编译器。

Stanley B. Lippman 先生所推荐宇宙最强 C++ 编译器 —— LLVM/clang。Stanley 何许人也？不是吧，你玩 C++ 居然不认识他。C++ 世界二号人物，当年在贝尔实验室，Bjarne Stroustrup 构思了 C++ 功能框架，Stanley Lippman 实现了第一个版本。还无感？好吧，他是《C++ Primer》的作者。说了大神，再说说大神推荐的编译器。

#### 系统构建

对于只有单个代码文件的项目来说，无非是保存代码文件、shell 中调用 GCC 编译、链接这样的简单方式即可实现；但，对于动辄几十上百个文件的工程项目，采用这种方式只会把自己逼疯，必须借助构建工具管理工程的整个构建过程。

linux 有两类工程构建工具 —— Makefile 系 和非 Makefile 系，Makefile 系常见构建工具有 GNU 出品的老牌 autoconf、新生代的 CMake，非 Makefile 系中最著名的要数 SCons。KDE 就是通过 CMake（http://www.cmake.org/cmake/resources/software.html ）构建出来的，易用性灵活性兼备，洒泪推荐。

一般来说，你需要先写个名为 CMakeLists.txt 的构建脚本，然后执行 cmake  CMakeLists.txt 命令将生成 Makefile 文件，最后执行 make 命令即可编译生成可执行程序。

举例来说，你工程包含 main.cpp 文件，要构建它，你需要执行如下步骤。

第一步，编写 CMakeLists.txt，内容如下：

```
PROJECT(main)
SET(SRC_LIST main.cpp)
SET(CMAKE_CXX_COMPILER "clang++")
SET(CMAKE_CXX_FLAGS "-std=c++11 -stdlib=libc++ -Werror -Weverything -Wno-deprecated-declarations -Wno-disabled-macro-expansion -Wno-float-equal -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-global-constructors -Wno-exit-time-destructors -Wno-missing-prototypes -Wno-padded -Wno-old-style-cast")
SET(CMAKE_EXE_LINKER_FLAGS "-lc++ -lc++abi")
SET(CMAKE_BUILD_TYPE Debug)
ADD_EXECUTABLE(main ${SRC_LIST})
```
其中，PROJECT 指定工程名、SET 是 cmake 变量赋值命令、ADD_EXECUTABLE 指定生成可执行程序的名字。括号内的大写字符串是 cmake 内部预定义变量，这是 CMakeLists.txt 脚本的重点，下面详细讲述：

* SRC_LIST 指定参与编译的源码文件列表，如果有多个文件请用空格隔开，如，你工程有 main.cpp、lib/MyClass.cpp、lib/MyClass.h 三个文件，那么可以指定为：
* SET(SRC_LIST main.cpp lib/MyClass.cpp)
* CMAKE_CXX_COMPILER 指定选用何种编译器；
* CMAKE_CXX_FLAGS 设定编译选项；
* CMAKE_EXE_LINKER_FLAGS 设定链接选项。一定要将 -lc++ 和 -lc++abi 独立设定到 CMAKE_EXE_LINKER_FLAGS 变量中而不能放在 CMAKE_CXX_FLAGS，否则无法通过链接；
* CMAKE_BUILD_TYPE 设定生成的可执行程序中是否包含调试信息。

另外，对于编译选项，我的原则是严己宽人。也就是说，在我本机上使用最严格的编译选项以发现尽量多 bug，发布给其他人的源码包使用最宽松的编译选项以减少环境差异导致编译失败的可能。前面罗列出来的就是严格版的 CMakeLists.txt，宽松版我会考虑：编译器改用 GCC（很多人没装 clang）、忽略所有编译警告、让编译器进行代码优化、去掉调试信息、添加安装路径等要素，具体如下：

```
PROJECT(main)
SET(SRC_LIST main.cpp)
SET(CMAKE_CXX_COMPILER "g++")
SET(CMAKE_CXX_FLAGS "-std=c++11 -O3")
SET(CMAKE_BUILD_TYPE Release)
ADD_EXECUTABLE(porgram_name ${SRC_LIST})
INSTALL(PROGRAMS porgram_name DESTINATION /usr/bin/)
```

第二步，基于 CMakeLists.txt 生成 Makefile。在 CMakeLists.txt 所在目录执行：

```
cmake CMakeLists.txt
```
执行成功的话，你将在该目录下看到 Makefile 文件；

第三步，基于 Makefile 生成可执行程序。相同目录下执行：

```
make
```
这一步，就是在调用编译器进行编译，如果存在代码问题，修正错误后重新执行这一步即可，不用再次执行第一、二步。

基本上，你的新工程，可以在基于上面的 CMakeLists.txt 进行修改，执行一次第二步后，每次代码调整只需执行第三步即可。

#### 一键编译

工程项目的构建过程游离于 vim 之外终究不那么方便，前面章节介绍的构建过程是在 shell 中执行的，全在 vim 中执行又是如何操作。第一步的创建 CMakeLists.txt 没问题，vim 这么优秀的编辑器编辑个普通文本文件易如反掌；第二步的生成 Makefile 也没问题，在 vim 内部通过 ! 前缀可以执行 shell 命令，:!cmake CMakeLists.txt 即可；第三步的编译过程更没问题，因为 vim 自身支持 make 命令，直接在 vim 中输入 :make 命令它会调用外部 make 程序读取当前目录中的 Makefile 文件，完成编译、链接操作。当然，一次性编译通过的可能性很小，难免有些语法错误（语义错误只能靠调试器了），vim 将编译器抛出的错误和警告信息输出到 quickfix 中，执行 :cw 命令即可显示 quickfix。说了这么多，概要之，先通过构建工具（CMake 可通过 CMakeLists.txt 文件，autotools 可通过 configure 文件）生成整个工程的 Makefile，再在 vim 中执行 :make，最后显示 quickfix。

要实现一键编译，无非是把这几步映射为 vim 的快捷键，即：

```
nmap <Leader>m :wa<CR>:make<CR><CR>:cw<CR>
```
分解说明下，m 为设定的一键编译快捷键，:wa\<CR> 保存所有调整文档内容，:make\<CR> 调用 make 命令，后面的 \<CR> 消除执行完 make 命令屏幕上“Press ENTER or type command to continue”的输入等待提示，:cw\<CR> 显示 quickfix（仅当有编译错误或警告时）。如下图所示：

<img src="./images/一键编译.gif" alt=""/>
（一键编译）

我新建了一个工程，编辑好 CMakeLists.txt，执行 :!cmake CMakeLists.txt，接着 \<leader>m 一键编译，quickfix 窗口显示了编译错误，光标自动定位到需要你解决的第一个编译错误，回车后光标自动调整到该错误对应的代码位置，修正后重新 \<leader>r，编译通过并运行生成的程序。

你可能会遇到，调整过的代码能通过编译，但是，要么在工程目录中无法找到可执行程序，要么有程序但体现不出代码调整的内容（就像没调整过代码一样）。对于情况一，还算好，至少你晓得生成可程序失败了，肯定哪儿出了问题，不会继续往下新增代码；情况二，就麻烦了，你想通过运行程序检查刚才添加的代码运行是否正常，以为运行的是新程序，其实，代码调整后的新程序并未生成，运行是老程序，“哇，一切正常，往下写新业务逻辑代码”。导致这两个情况的根本原因，代码中存在链接错误导致并未正常创建新的可执行程序。bad news —— 如果编译错误，quickfix 窗口会固定在底部，罗列出所有编译过程中的所有错误，如果编译正常（即便是存在链接错误），quickfix 窗口会出现“Press ENTER or type command to continue”的输入等待提示信息，前面提过，为了省去手工输入回车，已经在 \<Leader>m 中为 :make 多绑定个回车符 \<CR>，换言之，在编译正确链接错误的情况下，你是无法查看到 quickfix 窗口的；good news —— 有两种方式解决该问题：

* 方式一，将前面 \<Leader>m 中为 :make 绑定的回车符 \<CR> 去掉，即

```
nmap <Leader>m :wa<CR>:make<CR>:cw<CR>
```
* 方式二，先删除老的可执行程序，再编译、链接，发现缺失可执行程序时，再手工执行 :make，这样，可查看具体是什么链接错误了，将如下配置信息加入 .vimrc 中：

```
nmap <Leader>m :!rm -rf main<CR>:wa<CR>:make<CR><CR>:cw<CR>
```
我选方式二。

到此，已实现一键编译，要实现一键编译及运行无非就在刚才的快捷键中追加绑定运行程序的外部命令即可。新快捷键设定为 \<leader>g，假定生成的可执行程序名为 main，将如下配置信息加入 .vimrc 中：

```
nmap <Leader>g :!rm -rf main<CR>:wa<CR>:make<CR>:cw<CR><CR>:!./main<CR>
```

最后，再次强调实现一键编译及运行的几个前提：vim 的当前目录必须为工程目录、事前准备好 Makefile 文件且放于工程目录的根目录、生成的程序必须在工程目录的根目录。

### 7.2 静态分析器集成

one take，中意“一次成型”，最早指歌手录歌时一次性通过录制，不存在发现错误 - 修正错误 - 重新录制这样的往返动作。one take 在编程环境中，就是一次性通过编译，我个人很享受 one take 带来的快感。当然，要达到 one take，不仅需要扎实的编程功底，还需要工具的辅佐 —— 代码静态分析器。前面介绍的神器 YCM 具备实时语法检查的能力。在它的作用下，编码中、编译前，所有语法错误都将被抓出来并呈现给你。

YCM 的整个静态分析过程分为如下几步：

第一步，发现错误。YCM 内部调用 libclang 分析语法错误，通过管道传递给 YCM 呈现。当你保存代码、vim 普通模式下移动光标或者安静 2 秒，错误检查后台任务将自动启动，若有错误，YCM 将接收到；

第二步，呈现错误。YCM 并不非立马显示错误信息，除非你触发下次击键事件，否则你看不到错误信息，换言之，干等是没结果的，你必须有次击键动作（没办法，vim 内部机制所限，后台任务无法直接更新 GUI，所以才采用变通的击键方式）。对于存在语法错误的代码，在行首有个红色的 >> 高亮显示；

第三步，查看错误。好了，现在已经知道哪行代码有问题，具体问题描述如何查看？两种方式：一种是将光标移至问题行，vim 将在其底部显示简要错误描述；一种是将光标移至问题行，键入 \<leader>d 后，vim 将在其底部显示详细错误描述。

如下所示：

<img src="./images/静态代码分析.gif" alt=""/>
（静态代码分析）


## 8 其他辅助

大家关注的 IDE 核心功能前面都已逐一介绍过了，有些辅助功能我认为也有必要让你知道，不是都在提程序员人文关怀嘛，从我做起！

### 8.1 快速编辑结对符

平时，最让我头痛的字符莫过于 {}、""、[] 等这类结对符，输入它们之所以麻烦，主要因为 A）盲打很难找准它们位置，B）还得同时按住 shift 键。两者再一叠加，非常影响我的思维。要高效输入结对符，应该是输入少量几个字母（对，字母，不是字符）后 vim 自动为你输入完整结对符，而非是我输入一半 vim 输入另一半（不用 delimitMate 的原因）。刚好，这在 UltiSnips 能力范围内，只要定义好模板，可完美地解决这类问题，具体模板见上例中最后的结对符部分。

在定义结对符模板时，你应该考虑加上模板控制参数 i。默认情况下，UltiSnips 只会当模板名前是空白字符或行首时才进行模板补全，比如，定义 () 的模板如下：

```
snippet b "bracket"
(${1})${2}
endsnippet
```
我要调用函数 printf()，在输入完 printf 后应该接着输入括号模板名 b，然后输入模板展开快捷键 \<leader>\<tab>，你会发现 UltiSnips 无法帮你补全模板，因为它看到的不是 b 而是 printfb，这在模板文件中根本未定义。有一种间接解决方式是在 printf 后加个空格，再输入 b\<leader>\<tab> 进行补全，这就成了 printf ()，不喜欢这种编码风格。其实，UltiSnips 的作者也注意到这个问题了，他让你可以通过前面提过的模板控制参数 i 进行解决。重新定义 () 的模板如下：
```
snippet b "bracket" i
(${1})${2}
endsnippet
```
这样，UltiSnips 只管光标前 1 个字符是否是 b，若是则补全 ()，不论 b 前是否有其他字符。类似，其他结对符模板都按此加上 i 控制参数。结对符模板完整定义参见上一节 cpp.snippets 示例。如下是几个快速输入结对符的演示：

<img src="./images/快速输入结对符.gif" alt=""/>
（快速输入结对符）


另外，要想高效编辑结对符，你得了解 vim 自身的某些快捷键。比如，有如下字符串且光标在该字符串的任意字符上，这时在命令模式下键入 va) 后将选中包括括号在内的整个字符串：

<img src="./images/快速选中结对符.gif" alt=""/>
（快速选中结对符）

其中，v 是动作、a 是范围、) 是结对符。结对符命令的动作包括：选中 v、复制 y、删除 d、删除后插入 c；结对符命令的范围包括：含结对符 a、不含结对符 i。针对不同结对符，组合不同动作和范围就有 4\*2 种方式。比如，di{ 删除不含结对符 {} 的字符串，va\[ 将选中含结对符 [] 内的所有字符。

选中结对符内的文本是我较为频繁的操作之一，通过诸如 vi\[ 的命令可以选中当前结对符 [] 内的所有文本，这虽谈不上麻烦，但每次都得去看下是 ]、)、> 还是 }，总是有点别扭。有款叫 wildfire.vim（https://github.com/gcmt/wildfire.vim ）的插件，让我能更自然地选中结对符内的文本，有了它，我只需按下空格（你也可以设置成其他快捷键），自动选中光标所在区域最近的一层结对符内的文本，如果没有结对符，则选择最近的一个段落。

简单设置：

```
" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
```
这样，在 vim 的命令模式下，一次空格选中最近一层结对符内的文本，两次则选中近两层内的文本，三次三层，依此类推；或者键入 3space，直接选中三层内的文本；若要取消，键入 shift-space 即可。另外，结对符类型也可以在 wildfire_objects 变量中指定。如下图所示：

<img src="./images/快速选中结对符文本.gif" alt=""/>
（快速选中结对符文本）


### 8.2 支持分支的 undo

undo，编辑器世界中的后悔药，让你有机会撤销最近一步或多步操作，这是任何编辑器都具备的基础功能。比如，第一步输入 A，第二步输入 B，第三步输入 C，当前文本为 ABC，一次 undo 后变成 AB，再次 undo 后变成 A，显然，每次 undo 撤销的均是最后的一步操作，通常采用栈这种数据结构来实现 undo 功能，由于栈具有后进先出的特点，所以，功能实现起来非常自然且便捷，但同时，也引入了致命伤，无法支持分支上的 undo 操作。

还是前面的例子，分三步依次输入完 ABC 后，一次 undo 变成 AB，这时，输入 D，之后，无论你多少次 undo 都不可能再找回 C，究其原因，D 是彻底覆盖了 C，而不是与 C 形成两个分支，如下图所示：

<img src="./images/不支持分支的 undo.gif" alt=""/>
（不支持分支的 undo）


在我的使用场景中，非常需要在我输入 D 后还能找回 C 的 undo 功能，即，支持分支的 undo，gundo.vim （http://sjl.bitbucket.org/gundo.vim/ ）降临。gundo.vim 采用树这种数据结构来实现 undo，每一次编辑操作均放在树的叶子上，每次 undo 后，先回到主干，新建分支继续后续操作，而不是直接覆盖，从而实现支持分支的 undo 功能。gundo.vim 要求 vim 版本不低于 v7.3 且支持 python v2.4 及以上。

如下方式设置好调用 gundo.vim 的快捷方式：

```
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
```
gundo.vim 非常贴心，调用它后，你会在左侧看到一个分割为上下两个区域的子窗口。上半区域以可视化方式显示了整颗 undo 树，同时，用 @ 标识最后一步编辑操作，用序号标识各步编辑操作的先后顺序，用时长显示每步操作距离当前消耗时间。下半区域展示了各个操作间的 diff 信息及其上下文，默认为选中那步操作与前一步操作间的 diff，键入 p 可以查看选中那步操作与最后一步操作（即有 @ 标识的那步）间的 diff，这对于找回多次编辑操作之前的环境非常有用。

<img src="./images/支持分支的 undo.gif" alt=""/>
（支持分支的 undo）


另外，我对持久保存 undo 历史也有需求，以便让我关闭 vim 后重新启动也能找到先前的所有 undo 历史，这需要你在 .vimrc 中添加：

```
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/
```
你得先自行创建 .undo_history/。具体可参见“6.3 环境恢复”章节。

### 8.3 快速移动

vim 有两类快速移动光标的方式：一类是以单词为单位的移动，比如，w 正向移动到相邻单词的首字符、b 逆向移动到相邻单词的首字符、e 正向移动到相邻单词的尾字符、 ge 逆向移动到相邻单词的尾字符；一类是配合查找字符的方式移动，比如，fa 正向移动到第一个字符 a 处、Fa 逆向移动到第一个字符 a 处。你要在非相邻的单词或字符间移动，你可以配合数字参数，比如，正向移动到相隔八个单词的首字符执行 8w、逆向移动到第四个 a 字符处执行 4Fa。

有如下文本：

>backpage kcal liam jack facebook target luach ajax

假定光标在行首，需要移动到 facebook 的字符 a 处，先来数下前面有 1、2 ... 5 个 a，然后用前面所说的 5fa，唔，怎么在 jack 上呢？等等，好像数错了，再数次 1、2 ... 6，对滴，应该是 6fa，这下对了。我的个天，不能让哥太累，得找个插件帮忙 —— easymotion（https://github.com/Lokaltog/vim-easymotion ）。

easymotion 只做一件事：把满足条件的位置用 [;A~Za~z] 间的标签字符标出来，找到你想去的位置再键入对应标签字符即可快速到达。比如，上面的例子，假设光标在行首，我只需键入 \<leader>\<leader>fa （为避免与其他快捷键冲突，easymotion 采用两次 \<leader> 作为前缀键），所有的字符 a 都被重新标记成 a、b、c、d、e、f 等等标签（原始内容不会改变），f 标签为希望移动去的位置，随即键入 f 即可到达。如下图所示：

<img src="./images/快速移动.gif" alt=""/>
（快速移动）


类似，前面提过的 w、e、b、ge、F、j、k 等命令在 easymotion 作用下也能实现快速移动，其中，j 和 k 可跨行移动。同时，你还可以搭配 v 选中命令、d 删除命令、y 拷贝命令，比如，v\<leader>\<leader>fa，快速选中光标当前位置到指定字符 a 之间的文本，d\<leader>\<leader>fa，快速删除光标当前位置到指定字符 a 之间的文本，下图所示：

<img src="./images/搭配操作命令的快速移动.gif" alt=""/>
（搭配操作命令的快速移动）


### 8.5 中 / 英输入平滑切换

代码中不可能全是英文，即便注释是英文，用户提示信息也多多少少得用中文吧，所以，在 vim 中输入中文是常有的。中 / 英文输入切换本身很简单，但是，如果又与 vim 的插入模式和命令模式一纠缠，那么，这事儿就不太自然了。

比如，我在插入模式下依次输入了中文的一二四三，本意是想输入一二三四，下意识地键入 esc 切换为命令模式，键入 x 剪切三，再键入 P 将三粘贴至四前。谁知，在键入 x 时，由于输入法仍保留在先前的中文状态下，导致 vim 的命令模式无法接收到命令，必须得再次键入 shift 切换至英文状态。如下图所示：

<img src="./images/中文状态让命令模式无效.gif" alt=""/>
（中文状态让命令模式无效）


这很不协调，我希望，在插入模式下输入完中文，切换至命令模式后，即便先前是中文输入状态，也不影响我正常使用命令模式，甚至再次切回插入模式后，能保持先前的输入状态。来了，fcitx.vim（https://github.com/lilydjwg/fcitx.vim ）就是我要的。对，前提是你系统中用的是 fcitx 输入法（为何不用 scim、ibus？https://github.com/yangyangwithgnu/the_new_world_linux#7.4 ）。装好这个插件后，我们再看看刚才的例子，在中文状态下从插入模式切换至命令模式，键入 x、P 调整完四和三顺序后，重新切换至插入模式，输入法状态仍保持中文。如下图所示：

<img src="./images/即便中文状态也不影响命令模式.gif" alt=""/>
（即便中文状态也不影响命令模式）


几乎完美了，唯一问题是，该插件无法保证从其他程序窗口切换至 vim 后仍有效。


## 9 尾声

嗷呼，经过以上调教，你的 vim 已经成为非常舒适的 C/C++ 开发环境呢。等等，重装系统后又得折腾一次？不怕，除了 clang 等等几个需要源码安装的工具外，基本上，vim 的插件和相关配置文件你可以提前备份好，装完系统后恢复到对应目录中即可，丝毫不费脑力。
