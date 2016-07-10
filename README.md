<h1 align="center">我的 vim 配置及插件</h1>
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
........[4.7 声明/定义跳转 ](#4.7)  
................[基于标签的声明/定义跳转 ](#4.7.1)  
................[基于语义的声明/定义跳转 ](#4.7.2)  
........[4.8 内容查找 ](#4.8)  
........[4.9 内容替换 ](#4.9)  
................[快捷替换 ](#4.9.1)  
................[精确替换 ](#4.9.2)  
[5 代码开发 ](#5)  
........[5.1 快速开关注释 ](#5.1)  
........[5.2 模板补全 ](#5.2)  
........[5.3 智能补全 ](#5.4)  
................[基于标签的智能补全 ](#5.3.1)  
................[基于语义的智能补全 ](#5.3.2)  
........[5.4 由接口快速生成实现框架 ](#5.4)  
........[5.5 库信息参考 ](#5.5)  
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
........[8.4 markdown 即时预览 ](#8.4)  
........[8.5 中/英输入平滑切换 ](#8.5)  
[9 尾声](#9)


##【正文】
----

开始前，我假设你：0）具备基本的 vim 操作能力，清楚如何打开/编辑/保存文档、命令与插入模式间切换；1）希望将 vim 打造成 C/C++ 语言的 IDE，而非其他语言。

关于 vim 的优点，你在网上能查到 128+ 项，对我而言，只有两项：0）所思即所得，让手输入的速度跟上大脑思考的速度，1）所需即所获，只有你想不到的功能、没有实现不了的插件。希望获得前者的能力，你需要两本教程深入学习，《Practical Vim: Edit Text at the Speed of Thought》和《vim user manual》；要想拥有后者的能力，通读本文 -。-#。对于 vim 的喜爱，献上湿哥哥以表景仰之情：
<div align="center">
vi 之大道如我心之禅，<br />
  vi 之漫路即为禅修，<br /> 
  vi 之命令禅印于心，<br />
 未得此道者视之怪诞，<br />
 与之为伴者洞其真谛，<br />
 长修此道者巨变人生。<br />
</div>
<div align="right">
作：reddy@lion.austin.com<br />
译：yangyangwithgnu@yeah.net<br />
</div><br />  

言归正传，说说 vim 用于代码编写提供了哪些直接和间接功能支撑。vim 用户手册中，50％ 的例子都是在讲 vim 如何高效编写代码，由此可见，vim 是一款面向于程序员的编辑器，即使某些功能 vim 无法直接完成，借助其丰富的插件资源，必定可以达成目标，这就是所需即所获。

我是个目标驱动的信奉者，本文内容，我会先给出优秀 C/C++ IDE 应具备哪些功能，再去探索如何通过 vim 的操作或插件来达到目标。最终至少要像这个样子：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%9B%BE%E5%BD%A2%E7%8E%AF%E5%A2%83%E4%B8%8B%20IDE%20%E6%80%BB%E6%8F%BD.png" alt=""/><br />
（图形环境下 IDE 总揽）
</div>
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E7%BA%AF%E5%AD%97%E7%AC%A6%E6%A8%A1%E5%BC%8F%E4%B8%8B%E6%80%BB%E8%A7%88.png" alt=""/><br />
（纯字符模式下 IDE 总揽）
</div>

<h2 name="0">0 vim 必知会</h2>

在正式开始前先介绍几个 vim 的必知会，这不是关于如何使用而是如何配置 vim 的要点，这对理解后续相关配置非常有帮助。

<h3 name="0.1">0.1 .vimrc 文件</h3>

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
" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
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

立即生效。全文频繁变更 .vimrc，要让变更内容生效，一般的做法是先保存 .vimrc 再重启 vim，太繁琐了，增加如下设置，可以实现保存 .vimrc 时自动重启加载它：

```
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
```
比如，我可以随时切换配色方案：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E9%85%8D%E7%BD%AE%E5%8F%98%E6%9B%B4%E7%AB%8B%E5%8D%B3%E7%94%9F%E6%95%88.gif" alt=""/><br />
（配置变更立即生效）
</div>

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

<h3 name="0.2">0.2 .vim/ 目录</h3>

.vim/ 目录是存放所有插件的地方。vim 有一套自己的脚本语言 vimscript，通过这种脚本语言可以实现与 vim 交互，达到功能扩展的目的。一组 vimscript 就是一个 vim 插件，vim 的很多功能都由各式插件实现。此外，vim 还支持 perl、python、lua、ruby 等主流脚本语言编写的插件，前提是 vim 源码编译时增加 ---enable-perlinterp、--enable-pythoninterp、--enable-luainterp、--enable-rubyinterp 等选项。vim.org 和 github.com 有丰富的插件资源，任何你想得到的功能，如果 vim 无法直接支持，那一般都有对应的插件为你服务，有需求时可以去逛逛。

vim 插件目前分为 \*.vim 和 \*.vba 两类，前者是传统格式的插件，实际上就是一个文本文件，通常 someplugin.vim（插件脚本）与 someplugin.txt（插件帮助文件）并存在一个打包文件中，解包后将 someplugin.vim 拷贝到 ~/.vim/plugin/ 目录，someplugin.txt 拷贝到 ~/.vim/doc/ 目录即可完成安装，重启 vim 后刚安装的插件就已经生效，但帮助文件需执行 :helptags ~/.vim/doc/ 才能生效，可通过 :h someplugin 查看插件帮助信息。传统格式插件需要解包和两次拷贝才能完成安装，相对较繁琐，所以后来又出现了 \*.vba 格式插件，安装便捷，只需在 shell 中依次执行如下命令即可：

```
vim someplugin.vba
:so %
:q
```
不论是直接拷贝插件到目录，还是通过 \*.vba 安装，都不便于插件卸载、升级，后来又出现了管理插件的插件 vundle。

后面就正式开始了喽，文中前后内容顺序敏感，请依次查阅。

<h2 name="1">1 源码安装编辑器 vim</h2>

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

<h2 name="2">2 插件管理</h2>

既然本文主旨在于讲解如何通过插件将 vim 打造成中意的 C/C++ IDE，那么高效管理插件是首要解决的问题。

vim 自身希望通过在 .vim/ 目录中预定义子目录管理所有插件（比如，子目录 doc/ 存放插件帮助文档、plugin/ 存放通用插件脚本），vim 的各插件打包文档中通常也包含上述两个（甚至更多）子目录，用户将插件打包文档中的对应子目录拷贝至 .vim/ 目录即可完成插件的安装。一般情况下这种方式没问题，但我等重度插件用户，.vim/ 将变得混乱不堪，至少存在如下几个问题：

* 插件名字冲突。所有插件的帮助文档都在 doc/ 子目录、插件脚本都在 plugin/ 子目录，同个名字空间下必然引发名字冲突；
* 插件卸载易误。你需要先知道 doc/ 和 plugin/ 子目录下哪些文件是属于该插件的，再逐一删除，容易多删/漏删。

我希望每个插件在 .vim/ 下都有各自独立子目录，这样需要升级、卸载插件时，直接找到对应插件目录变更即可；另外，我希望所有插件清单能在某个配置文件中集中罗列，通过某种机制实现批量自动安装/更新/升级所有插件。vundle（https://github.com/VundleVim/Vundle.vim ）为此而生，它让管理插件变得更清晰、智能。

vundle 会接管 .vim/ 下的所有原生目录，所以先清空该目录，再通过如下命令安装 vundle：

```
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

```
其中，每项

```
Bundle 'gosukiwi/vim-atom-dark''
```
对应一个插件（这与 go 语言管理不同代码库的机制类似），后续若有新增插件，只需追加至该列表中即可。vundle 支持源码托管在 https://github.com/ 的插件，同时 vim 官网 http://www.vim.org/ 上的所有插件均在 https://github.com/vim-scripts/ 有镜像，所以，基本上主流插件都可以纳入 vundle 管理。具体而言，仍以 ctrlsf.vim 为例，它在 .vimrc 中配置信息为 dyng/ctrlsf.vim，vundle 很容易构造出其真实下载地址 https://github.com/dyng/ctrlsf.vim.git ，然后借助 git 工具进行下载及安装。

此后，需要安装插件，先找到其在 github.com 的地址，再将配置信息其加入 .vimrc 中。


<h2 name="3">3 界面美化</h2>

玉不琢不成器，vim 不配不算美。刚安装好的 vim 朴素得吓人，这是与我同时代的软件么？
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E9%BB%98%E8%AE%A4%20vim%20%E7%95%8C%E9%9D%A2.png" alt=""/><br />
（默认 vim 界面）
</div>
就我的审美观而言，至少有几个问题：语法高亮太单薄、主题风格太简陋、窗口元素太冗余、辅助信息太欠缺。

<h3 name="3.1">3.1 主题风格</h3>

一套好的配色方案绝对会影响你的编码效率，vim 内置了 10 多种配色方案供你选择，GUI 下，可以通过菜单（Edit -> Color Scheme）试用不同方案，字符模式下，需要你手工调整配置信息，再重启 vim 查看效果（csExplorer 插件，可在字符模式下不用重启即可查看效果）。不满意，可以去 http://vimcolorschemetest.googlecode.com/svn/html/index-c.html 慢慢选。我自认为“阅美无数”，目前最夯三甲：
* 素雅 solarized（https://github.com/altercation/vim-colors-solarized ）
* 多彩 molokai（https://github.com/tomasr/molokai ）
* 复古 phd（http://www.vim.org/scripts/script.php?script_id=3139 ）

在 .vimrc 中选用某个主题：

```
" 配色方案
set background=dark
colorscheme atom-dark
"colorscheme solarized
"colorscheme molokai


```
其中，不同主题都有暗/亮色系之分，这样三种主题六种风格，久不久换一换，给你不一样的心情：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/solarized%20%E4%B8%BB%E9%A2%98%E9%A3%8E%E6%A0%BC.png" alt=""/><br />
（solarized 主题风格）
</div>

<h3 name="3.2">3.2 营造专注氛围</h3>

如今的 UX 设计讲究的是内容至上，从 GNOME3 的变化就能看出。编辑器界面展示的应全是代码，不应该有工具条、菜单、滚动条浪费空间的元素，另外，编程是种精神高度集中的脑力劳动，不应出现闪烁光标、花哨鼠标这些分散注意力的东东。配置如下：

```
" 显示/隐藏菜单栏、工具栏、滚动条，可用 F12 切换 
" {{{
if g:isGUI
  set guioptions-=m  " 隐藏菜单
  set guioptions-=T  " 隐藏工具栏
  set guioptions-=r  " 隐藏滚动条
  set guioptions-=l  " 
  set guioptions-=L  " 
  set guioptions-=b  " 
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
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%8E%BB%E9%99%A4%E5%86%97%E4%BD%99%E7%AA%97%E5%8F%A3%E5%85%83%E7%B4%A0.png" alt=""/><br />
（去除冗余窗口元素）
</div>

还容易分神？好吧，我们把 vim 弄成全屏模式。vim 自身无法实现全屏，必须借助第三方工具 gvimtweak，一个控制窗口 XYZ 坐标、窗口尺寸的命令行工具。本vim包已包含 gvimtweak，再在 .vimrc 中增加如下信息：

```
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()
```
上面是一段简单的 vimscript 脚本，外部命令 wmctrl 及其命令行参数控制将指定窗口 windowid（即，vim）全屏，绑定快捷键 F11 实现全屏/窗口模式切换（linux 下各 GUI 软件约定使用 F11 全屏，最好遵守约定），最后配置启动时自动全屏。

<h3 name="3.3">3.3 添加辅助信息</h3>

去除了冗余元素让 vim 界面清爽多了，为那些实用辅助信息腾出了空间。光标当前位置、显示行号、高亮当前行/列等等都很有用：

```
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
```

效果如下：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E6%B7%BB%E5%8A%A0%E8%BE%85%E5%8A%A9%E4%BF%A1%E6%81%AF.png" alt=""/><br />
（添加辅助信息）
</div>

<h3 name="3.4">3.4 其他美化</h3>

默认字体不好看，挑个自己喜欢的，前提是你得先安装好该字体。中文字体，我喜欢饱满方正的（微软雅黑），英文字体喜欢圆润的（Consolas），vim 无法同时使用两种字体，怎么办？有人制作发布了一款中文字体用微软雅黑、英文字体用 Consolas 的混合字体 —— yahei consolas hybrid 字体，号称最适合中国程序员使用的字体，效果非常不错（本文全文采用该字体）。在 .vimrc 中设置下：

```
" 设置 gvim 显示字体
set guifont=Microsoft_YaHei_Mono:h12
```

上面的字体设置方式是在Windows操作系统下，如果是在 Linux 设置方式如下

```
set guifont=Microsoft\ YaHei\ Mono:12
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
```

效果如下：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E7%95%8C%E9%9D%A2%E7%BE%8E%E5%8C%96%E6%9C%80%E7%BB%88%E6%95%88%E6%9E%9C.png" alt=""/><br />
（界面美化最终效果）
</div>
图中，中英文混合字体看着是不是很舒服哈；增强后的状态栏，不仅界面漂亮多了，而且多了好些辅助信息（所在函数名、文件编码格式、文件类型）。

<h2 name="4">4 代码分析</h2>

阅读优秀开源项目源码是提高能力的重要手段，营造舒适、便利的阅读环境至关重要。

<h3 name="4.1">4.1 语法高亮</h3>

代码只有一种颜色的编辑器，就好像红绿灯只有一种颜色的路口，全然无指引。现在已是千禧年后的十年了，早已告别上世纪六、七十年代黑底白字的时代，即使在字符模式下编程（感谢伟大的 fbterm），我也需要语法高亮。所幸 vim 自身支持语法高亮，只需显式打开即可：

```
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
```
效果如下：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E8%AF%AD%E6%B3%95%E9%AB%98%E4%BA%AE.png" alt=""/><br />
（语法高亮）
</div>
上图中 STL 容器模板类 unordered\_multimap 并未高亮，对滴，vim 对 C++ 语法高亮支持不够好（特别是 C++11/14 新增元素），必须借由插件 vim-cpp-enhanced-highlight（https://github.com/octol/vim-cpp-enhanced-highlight ）进行增强。效果如下：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%A2%9E%E5%BC%BA%20C%2B%2B11%20%E5%8F%8A%20STL%20%E7%9A%84%E8%AF%AD%E6%B3%95%E9%AB%98%E4%BA%AE.png" alt=""/><br />
（增强 C++11 及 STL 的语法高亮）
</div>
vim-cpp-enhanced-highlight 主要通过 .vim/bundle/vim-cpp-enhanced-highlight/after/syntax/cpp.vim 控制高亮关键字及规则，所以，当你发现某个 STL 容器类型未高亮，那么将该类型追加进 cpp.vim 即可。如，initializer_list 默认并不会高亮，需要添加

```
syntax keyword cppSTLtype initializer_list
```

<h3 name="4.2">4.2 代码缩进</h3>

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
* softtabstop，如何处理连续多个空格。因为 expandtab 已经把制表符转换为空格，当你要删除制表符时你得连续删除多个空格，该设置就是告诉 vim 把连续数量的空格视为一个制表符，即，只删一个字符即可。通常应将这tabstop、shiftwidth、softtabstop 三个变量设置为相同值；

另外，你总会阅读其他人的代码吧，他们对制表符定义规则与你不同，这时你可以手工执行 vim 的 retab 命令，让 vim 按上述规则重新处理制表符与空格关系。

很多编码规范建议缩进（代码嵌套类似）最多不能超过 4 层，但难免有更多层的情况，缩进一多，我那个晕啊：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%A4%9A%E5%B1%82%E7%BC%A9%E8%BF%9B.png" alt=""/><br />
（多层缩进）
</div>

我希望有种可视化的方式能将相同缩进的代码关联起来，indentLine（https://github.com/Yggdroot/indentLine ）来了。安装好该插件后，增加如下配置信息：

```
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
```

重启 vim 效果如下：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E4%B8%8D%E8%BF%9E%E7%BB%AD%E7%9A%84%E7%BC%A9%E8%BF%9B%E5%8F%AF%E8%A7%86%E5%8C%96.png" alt=""/><br />
（不连续的缩进可视化）
</div>
断节？Indent Guides 通过识别制表符来绘制缩进连接线，断节处是空行，没有制表符，自然绘制不出来，算是个小 bug，但瑕不掩瑜，有个小技巧可以解决，换行-空格-退格：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%AE%8C%E7%BE%8E%E5%8F%AF%E8%A7%86%E5%8C%96%E7%BC%A9%E8%BF%9B.png" alt=""/><br />
（完美可视化缩进）
</div>

<h3 name="4.3">4.3 代码折叠</h3>

有时为了去除干扰，集中精力在某部分代码片段上，我会把不关注部分代码折叠起来。vim 自身支持多种折叠：手动建立折叠（manual）、基于缩进进行折叠（indent）、基于语法进行折叠（syntax）、未更改文本构成折叠（diff）等等，其中，indent、syntax 比较适合编程，按需选用。增加如下配置信息：

```
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
```

操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。效果如下：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E4%BB%A3%E7%A0%81%E6%8A%98%E5%8F%A0.gif" alt=""/><br />
（代码折叠）
</div>

<h3 name="4.4">4.4 接口与实现快速切换</h3>

我习惯把类的接口和实现分在不同文件中，常有在接口文件（MyClass.h）和实现文件（MyClass.cpp）中来回切换的操作。你当然可以先分别打开接口文件和实现文件，再手动切换，但效率不高。我希望，假如在接口文件中，vim 自动帮我找到对应的实现文件，当键入快捷键，在新 buffer 中打开对应实现文件。

vim-fswitch（https://github.com/derekwyatt/vim-fswitch ）来了。安装后增加配置信息：

```
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
```
这样，键入 ;sw 就能在实现文件和接口文件间切换。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E6%8E%A5%E5%8F%A3%E6%96%87%E4%BB%B6%E4%B8%8E%E5%AE%9E%E7%8E%B0%E6%96%87%E4%BB%B6%E5%88%87%E6%8D%A2.gif" alt=""/><br />
（接口文件与实现文件切换）
</div>
上图中，初始状态先打开了接口文件 MyClass.h，键入 ;sw 后，vim 在新 buffer 中打开实现文件 MyClass.cpp，并在当前窗口中显示；再次键入 ;sw 后，当前窗口切回接口文件。

<h3 name="4.5">4.5 代码收藏</h3>

源码分析过程中，常常需要在不同代码间来回跳转，我需要“收藏”分散在不同处的代码行，以便需要查看时能快速跳转过去，这时，vim 的书签（mark）功能派上大用途了。

vim 书签的使用很简单，在你需要收藏的代码行键入 mm，这样就收藏好了，你试试，没反应？不会吧，难道你 linux 内核编译参数有问题，或者，vim 的编译参数没给全，让我想想，别急，喔，对了，你是指看不到书签？好吧，我承认这是 vim 最大的坑，书签所在行与普通行外观上没任何差别，肉眼，你是找不到他滴。这可不行，得来个让书签可视化的插件，vim-signature（https://github.com/kshenoy/vim-signature ）。vim-signature 通过在书签所在行的前面添加字符的形式，以此可视化书签，这就要求你源码安装的 vim 具备 signs 特性，具体可在 vim 命令模式下键入
```
:echo has('signs')
```
若显示 1 则具备该特性，反之 0 则不具备该特性，需参考“1 源码安装编辑器 vim ”重新编译 vim。

vim 的书签分为两类，独立书签和分类书签。独立书签，书签名只能由字母（a-zA-Z）组成，长度最多不超过 2 个字母，并且，同个文件中，不同独立书签名中不能含有相同字母，比如，a 和 bD 可以同时出现在同个文件在，而 Fc 和 c 则不行。分类书签，书签名只能由可打印特殊字符（!@#$%^&\*()）组成，长度只能有 1 个字符，同个文件中，你可以把不同行设置成同名书签，这样，这些行在逻辑上就归类成相同类型的书签了。下图定义了名为 a 和 dF 两个独立书签（分别 259 行和 261 行）、名为 # 的一类分类书签（含 256 行和 264 行）、名为 @ 的一类分类书签（257 行），如下所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E7%8B%AC%E7%AB%8B%E4%B9%A6%E7%AD%BE%E5%92%8C%E5%88%86%E7%B1%BB%E4%B9%A6%E7%AD%BE.png" alt=""/><br />
（独立书签和分类书签）
</div>

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
* 书签设定。mx，设定/取消当前行名为 x 的标签；m,，自动设定下一个可用书签名，前面提说，独立书签名是不能重复的，在你已经有了多个独立书签，当想再设置书签时，需要记住已经设定的所有书签名，否则很可能会将已有的书签冲掉，这可不好，所以，vim-signature 为你提供了 m, 快捷键，自动帮你选定下一个可用独立书签名；mda，删除当前文件中所有独立书签。
* 书签罗列。m?，罗列出当前文件中所有书签，选中后回车可直接跳转；
* 书签跳转。mn，按行号前后顺序，跳转至下个独立书签；mp，按行号前后顺序，跳转至前个独立书签。书签跳转方式很多，除了这里说的行号前后顺序，还可以基于书签名字母顺序跳转、分类书签同类跳转、分类书签不同类间跳转等等。

效果如下：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%8F%AF%E8%A7%86%E5%8C%96%E4%B9%A6%E7%AD%BE.gif" alt=""/><br />
（可视化书签）
</div>

我虽然选用了 vim-signature，但不代表它完美了，对我而言，无法在不同文件的书签间跳转绝对算是硬伤。另外，如果觉得收藏的代码行只有行首符号来表示不够醒目，你可以考虑 BOOKMARKS--Mark-and-Highlight-Full-Lines 这个插件（https://github.com/vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines ），它可以让书签行高亮，如下是它的快捷键：<F1>，高亮所有书签行；<F2>，关闭所有书签行高亮；<SHIFT-F2>，清除 [a-z] 的所有书签；<F5>，收藏当前行；<SHIFT-F5>，取消收藏当前行。


<h3 name="4.6">4.6 标识符列表</h3>

本节之前的内容，虽说与代码开发有些关系，但最多也只能算作用户体验层面的，真正提升生产效率的内容将从此开始。

本文主题是探讨如何将 vim 打造成高效的 C/C++ 开发环境，希望实现标识符列表、定义跳转、声明提示、实时诊断、代码补全等等系列功能，这些都需要 vim 能够很好地理解我们的代码（不论是 vim 自身还是借助插件甚至第三方工具），如何帮助 vim 理解代码？基本上，有两种主流方式：标签系统和语义系统。至于优劣，简单来说，标签系统配置简单，而语义系统效果精准，后者是趋势。目前对于高阶 IDE 功能，部分已经有对应基于语义的插件支撑，而部分仍只能通过基于标签的方式实现，若同个功能既有语义插件又有标签插件，优选语义。

<h4 name="4.6.1">标签系统</h4>

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

<h4 name="4.6.2">语义系统</h4>

通过 ctags 这类标签系统在一定程度上助力 vim 理解我们的代码，对于 C 语言这类简单语言来说，差不多也够了。近几年，随着 C++11/14 的推出，诸如类型推导、lamda 表达式、模版等等新特性，标签系统显得有心无力，这个星球最了解代码的工具非编译器莫属，如果编译器能在语义这个高度帮助 vim 理解代码，那么我们需要的各项 IDE 功能肯定能达到另一个高度。

语义系统，编译器必不可少。GCC 和 clang 两大主流 C/C++ 编译器，作为语义系统的支撑工具，我选择后者，除了 clang 对新标准支持及时、错误诊断信息清晰这些优点之外，更重要的是，它在高内聚、低耦合方面做得非常好，各类插件可以调用 libclang 获取非常完整的代码分析结果，从而轻松且优雅地实现高阶 IDE 功能。你对语义系统肯定还是比较懵懂，紧接着的“基于语义的声明/定义跳转”会让你有更为直观的了解，现在，请跳转至“7.1 编译器/构建工具集成”，一是了解 clang 相较 GCC 的优势，二是安装好最新版 clang 及其标准库，之后再回来。

<h4 name="4.6.3">基于标签的标识符列表</h4>

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
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%9F%BA%E4%BA%8E%E6%A0%87%E7%AD%BE%E7%9A%84%E6%A0%87%E8%AF%86%E7%AC%A6%E5%88%97%E8%A1%A8.gif" alt=""/><br />
（基于标签的标识符列表）
</div>
从上图可知 tagbar 的几个特点：
* 按作用域归类不同标签。按名字空间 n_foo、类 Foo 进行归类，在内部有声明、有定义；
* 显示标签类型。名字空间、类、函数等等；
* 显示完整函数原型；
* 图形化显示共有成员（+）、私有成员（-）、保护成员（#）；

在标识符列表中选中对应标识符后回车即可跳至源码中对应位置；在源码中停顿几秒，tagbar 将高亮对应标识符；每次保存文件时或者切换到不同代码文件时 tagbar 自动调用 ctags 更是标签数据库；tagbar 有两种排序方式，一是按标签名字母先后顺序、一是按标签在源码中出现的先后顺序，在 .vimrc 中我配置选用后者，键入 s 切换不同不同排序方式。

<h3 name="4.7">4.7 声明/定义跳转</h3>

假设你正在分析某个开源项目源码，在 main.cpp 中遇到调用函数 func()，想要查看它如何实现，一种方式：在 main.cpp 中查找 -> 若没有在工程内查找 -> 找到后打开对应文件 -> 文件内查找其所在行 -> 移动光标到该行 -> 分析完后切换会先前文件，不仅效率太低更要命的是影响我的思维连续性。我需要另外高效的方式，就像真正函数调用一样：光标选中调用处的 func() -> 键入某个快捷键自动转换到 func() 实现处 -> 键入某个键又回到 func() 调用处，这就是所谓的定义跳转。

基本上，vim 世界存在两类导航：基于标签的跳转和基于语义的跳转。

<h4 name="4.7.1">基于标签的声明/定义跳转</h4>

继续延用前面接收标签系统的例子文件 main.cpp、my_class.h、my_class.cpp，第二步已经生成好了标签文件，那么要实现声明/定义跳转，需要第三步，引入标签文件。这让 vim 知晓标签文件的路径。在 /data/workplace/example/ 目录下用 vim 打开 main.cpp，在 vim 中执行如下目录引入标签文件 tags：

```
:set tags+=/data/workplace/example/tags
```
既然 vim 有个专门的命令来引入标签，说明 vim 能识别标签。虽然标签文件中并无行号，但已经有标签所在文件，以及标签所在行的完整内容，vim 只需切换至对应文件，再在文件内作内容查找即可找到对应行。换言之，只要有对应的标签文件，vim 就能根据标签跳转至标签定义处。

这时，你可以体验下初级的声明/定义跳转功能。把光标移到 main.cpp 的 one.printMsg() 那行的 printMsg 上，键入快捷键 g]，vim 将罗列出名为 printMsg 的所有标签候选列表，按需选择键入编号即可跳转进入。如下图：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%BE%85%E9%80%89%E6%A0%87%E7%AD%BE.png" alt=""/><br />
（待选标签）
</div>

目前为止，离我预期还有差距。

第一，选择候选列表影响思维连续性。首先得明白为何会出现待选列表。前面说过，vim 做的事情很简单，就是把光标所在单词放到标签文件中查找，如果只有一个，当然你可以直接跳转过去，大部分时候会找到多项匹配标签，比如，函数声明、函数定义、函数调用、函数重载等等都会导致同个函数名出现在多个标签中，vim 无法知道你要查看哪项，只能让你自己选择。其实，因为标签文件中已经包含了函数签名属性，vim 的查找机制如果不是基于关键字，而是基于语义的话，那也可以直接命中，期待后续 vim 有此功能吧。既然无法直接解决，换个思路，我不想选择列表，但可以接受遍历匹配标签。就是说，我不想输入数字选择第几项，但可以接受键入正向快捷键后遍历第一个匹配标签，再次键入快捷键遍历第二个，直到最后一个，键入反向快捷键逆序遍历。这下事情简单了，命令 :tnext 和 :tprevious 分别先后和向前遍历匹配标签，定义两个快捷键搞定：

```
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
```
等等，这还不行，vim 中有个叫标签栈（tags stack）的机制，:tnext、:tprevious 只能遍历已经压入标签栈内的标签，所以，你在遍历前需要通过快捷键 ctrl-] 将光标所在单词匹配的所有标签压入标签栈中，然后才能遍历。不说复杂了，以后你只需先键入 ctrl-]，若没跳转至需要的标签，再键入 <leader>tn 往后或者 <leader>tp 往前遍历即可。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%9F%BA%E4%BA%8E%E6%A0%87%E7%AD%BE%E7%9A%84%E8%B7%B3%E8%BD%AC.gif" alt=""/><br />
（基于标签的跳转）
</div>

第二，如何返回先前位置。当分析完函数实现后，我需要返回先前调用处，可以键入 vim 快捷键 ctrl-t 返回，如果想再次进入，可以用前面介绍的方式，或者键入 ctrl-i。另外，注意，ctrl-o 以是一种返回快捷键，但与 ctrl-t 的返回不同，前者是返回上次光标停留行、后者返回上个标签。

第三，如何自动生成标签并引入。开发时代码不停在变更，每次还要手动执行 ctags 命令生成新的标签文件，太麻烦了，得想个法周期性针对这个工程自动生成标签文件，并通知 vim 引人该标签文件，嘿，还真有这样的插件 —— indexer（https://github.com/vim-scripts/indexer.tar.gz ）。indexer 依赖 DfrankUtil（https://github.com/vim-scripts/DfrankUtil ）、vimprj（https://github.com/vim-scripts/vimprj ）两个插件，请一并安装。请在 .vimrc 中增加：

```
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
```
另外，indexer 还有个自己的配置文件，用于设定各个工程的根目录路径，配置文件位于 ~/.indexer_files，内容可以设定为：

```
 --------------- ~/.indexer_files ---------------  
[foo] 
/data/workplace/foo/src/
[bar] 
/data/workplace/bar/src/
```
上例设定了两个工程的根目录，方括号内是对应工程名，路径为工程的代码目录，不要包含构建目录、文档目录，以避免将产生非代码文件的标签信息。这样，从以上目录打开任何代码文件时，indexer 便对整个目录创建标签文件，若代码文件有更新，那么在文件保存时，indexer 将自动调用 ctags 更新标签文件，indexer 生成的标签文件以工程名命名，位于 ~/.indexer_files_tags/，并自动引入进 vim 中，那么

```
:set tags+=/data/workplace/example/tags
```
一步也省了。好了，解决了这三个问题后，vim 的代码导航基本已经达到我的预期。

<h3 name="4.7">4.7 内容查找</h3>

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
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%86%85%E5%AE%B9%E6%9F%A5%E6%89%BE.gif" alt=""/><br />
（内容查找）
</div>

<h3 name="4.8">4.8 内容替换</h3>

有个名为 iFoo 的全局变量，被工程中 16 个文件引用过，由于你岳母觉得匈牙利命名法严重、异常、绝对以及十分万恶，为讨岳母欢心，不得不将该变量更名为 foo，怎么办？依次打开每个文件，逐一查找后替换？对我而言，内容替换存在两种场景：快捷替换和精确替换。

<h4 name="4.8.1">快捷替换</h4>

前面介绍的 ctrlsf 已经把匹配的字符串汇总在侧边子窗口中显示了，同时，它还允许我们直接在该子窗口中进行编辑操作，在这种环境下，如果我们能快捷选中所有匹配字符串，那么就可以先批量删除再在原位插入新的字符串，这岂不是我们需要的替换功能么？

快捷选中 ctrlsf 子窗口中的多个匹配项，关键还是这些匹配项分散在不同行的不同位置，这就需要多光标编辑功能，vim-multiple-cursors 插件（https://github.com/terryma/vim-multiple-cursors ）为次而生。装好 vim-multiple-cursors 后，你随便编辑个文档，随便输入多个相同的字符串，先在可视化模式下选中其中一个，接着键入 ctrl-n，你会发现第二个该字符串也被选中了，持续键入 ctrl-n，你可以选中所有相同的字符串，把这个功能与 ctrlsf 结合，你来感受下：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%BF%AB%E6%8D%B7%E6%9B%BF%E6%8D%A2.gif" alt=""/><br />
（快捷替换）
</div>
上图中，我想将 prtHelpInfo() 更名为 showHelpInfo()，先通过 ctrlsf 找到工程中所有 prtHelpInfo，然后直接在 ctrlsf 子窗口中选中第一个 ptr，再通过 vim-multiple-cursors 选中第二个 ptr，接着统一删除 ptr 并统一键入 show，最后保存并重新加载替换后的文件。

vim-multiple-cursors 默认快捷键与我系统中其他软件的快捷键冲突，按各自习惯重新设置：

```
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'
```

<h4 name="4.8.2">精确替换</h4>

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
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E4%B8%8D%E7%A1%AE%E8%AE%A4%E4%B8%94%E6%95%B4%E8%AF%8D%E5%8C%B9%E9%85%8D%E6%A8%A1%E5%BC%8F%E7%9A%84%E6%9B%BF%E6%8D%A2.gif" alt=""/><br />
（不确认且整词匹配模式的替换）
</div>
又比如，对当前文件采用需确认且无须整词匹配的模式进行替换，你会看到注释中的关键字也被替换了：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E7%A1%AE%E8%AE%A4%E4%B8%94%E6%97%A0%E9%A1%BB%E6%95%B4%E8%AF%8D%E5%8C%B9%E9%85%8D%E6%A8%A1%E5%BC%8F%E7%9A%84%E6%9B%BF%E6%8D%A2.gif" alt=""/><br />
（确认且无须整词匹配模式的替换）
</div>


<h2 name="5">5 代码开发</h2>

在具体编码过程中，我需要一系列提高生产力的功能：批量开/关注释、快速输入代码模板、代码智能补全、路径智能补全、从接口生成实现、查看参考库信息等等，我们逐一来实现。

<h3 name="5.1">5.1 快速开关注释</h3>

需要注释时，到每行代码前输入 //，取消注释时再删除 //，这种方式不是现代人的行为。IDE 应该支持对选中文本块批量（每行）添加注释符号，反之，可批量取消。本来 vim 通过宏方式可以支持该功能，但每次注释时要自己录制宏，关闭 vim 后宏无法保存，所以有人专门编写了一款插件 NERD Commenter（https://github.com/scrooloose/nerdcommenter ），NERD Commenter 根据编辑文档的扩展名自适应采用何种注释风格，如，文档名 x.cpp 则采用 // 注释风格，而 x.c 则是 /\*\*/ 注释风格；另外，如果选中的代码并非整行，那么该插件将用 /\*\*/ 只注释选中部分。

常用操作：

* \<leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /*、*/；
* \<leader>cu，取消选中文本块的注释。

如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%BF%AB%E9%80%9F%E5%BC%80%E5%85%B3%E6%B3%A8%E9%87%8A.gif" alt=""/><br />
（快速开/关注释）
</div>

<h3 name="5.2">5.2 模板补全</h3>

开发时，我经常要输入相同的代码片断，比如 if-else、switch 语句，如果每个字符全由手工键入，我可吃不了这个苦，我想要简单的键入就能自动帮我完成代码模板的输入，并且光标停留在需要我编辑的位置，比如键入 if，vim 自动完成

```
if (/* condition */) {
    TODO
}
```
而且帮我选中 /* condition */ 部分，不会影响编码连续性 —— UltiSnips（https://github.com/SirVer/ultisnips ），我的选择。

在进行模板补全时，你是先键入模板名（如，if），接着键入补全快捷键（默认 \<tab>），然后 UltiSnips 根据你键入的模板名在代码模板文件中搜索匹配的“模板名-模板”，找到对应模板后，将模板在光标当前位置展开。

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
# C++11风格for循环遍历（可读写） 
snippet F 
for (auto& e : ${1:c}) { 
} 
endsnippet 
# C++11风格for循环遍历（只读） 
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
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E6%A8%A1%E6%9D%BF%E8%A1%A5%E5%85%A8.gif" alt=""/><br />
（模板补全）
</div>


<h3 name="5.3">5.3 智能补全</h3>

真的，这绝对是 G 点。智能补全是提升编码效率的杀手锏。试想下，有个函数叫 getCountAndSizeFromRemotefile()，当你输入 get 后 IDE 自动帮你输入完整的函数名，又如，有个文件 ~/this/is/a/deep/dir/file.txt，就像在 shell 中一样，键入 tab 键自动补全文件路径那是何等惬意！

智能补全有两类实现方式：基于标签的、基于语义的。

<h4 name="5.3.1">基于标签的智能补全</h4>

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

然后，让 OmniCppComplete 成功识别标签文件中的标准库接口。C++ 标准库源码文件中使用了 _GLIBCXX_STD 名字空间（GNU C++ 标准库的实现是这样，如果你使用其他版本的标准库，需要自行查找对应的名字空间名称），标签文件里面的各个标签都嵌套在该名字空间下，所以，要让 OmniCppComplete 正确识别这些标签，必须显式告知 OmniCppComplete 相应的名字空间名称。在.vimrc中增加如下内容：

```
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
```

最后，在 vim 中引入该标签文件。在 .vimrc 中增加如下内容：

```
set tags+=/usr/include/c++/4.8/stdcpp.tags
```
后续你就可以进行 C++ 标准库的代码补全，比如，在某个 string 对象名输入 . 时，vim 自动显示成员列表。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%9F%BA%E4%BA%8E%E6%A0%87%E7%AD%BE%E7%9A%84%20C%2B%2B%20%E6%A0%87%E5%87%86%E5%BA%93%E8%A1%A5%E5%85%A8.png" alt=""/><br />
（基于标签的 C++ 标准库补全）
</div>

没明白？ -。-# 咱再来个例子，看看如何补全 linux 系统 API。与前面的标准库补全类似，唯一需要注意，linux 系统 API 头文件中使用了 GCC 编译器扩展语法，必须告诉 ctags 在生成标签时忽略之，否则将生产错误的标签索引。

首先，获取 linux 系统 API 头文件。openSUSE 可用如下命令：

```
zypper install linux-glibc-devel
```
安装成功后，在 /usr/include/ 中可见相关头文件；

接着，执行 ctags 生成系统 API 的标签文件。linux 内核采用 GCC 编译，为提高内核运行效率，linux 源码文件中大量采用 GCC 扩展语法，这影响 ctags 生成正确的标签，必须借由 ctags 的 -I 命令参数告之忽略某些标签，若有多个忽略字符串之间用逗号分割。比如，在文件 unistd.h 中几乎每个API声明中都会出现 __THROW、__nonnull 关键字，前者目的是告诉 GCC 这些函数不会抛异常，尽量多、尽量深地优化这些函数，后者目的告诉 GCC 凡是发现调用这些函数时第一个实参为 nullptr 指针则将其视为语法错误，的确，使用这些扩展语法方便了我们编码，但却影响了 ctags 正常解析，这时可用 -I __THROW,__nonnull 命令行参数让 ctags 忽略这些语法扩展关键字：

```
cd /usr/include/
ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull -f sys.tags
```

最后，在 vim 中引入该标签文件。在 .vimrc 中增加如下内容：

```
set tags+=/usr/include/sys.tags
```

从以上两个例子来看，不论是 C++ 标准库、boost、ACE这些重量级开发库，还是 linux 系统 API 均可遵循“下载源码（至少包括头文件）-执行 ctags 生产标签文件-引入标签文件”的流程实现基于标签的智能补全，若有异常，唯有如下两种可能：一是源码中使用了名字空间，借助 OmniCppComplete 插件的 OmniCpp_DefaultNamespaces 配置项解决；一是源码中使用了编译器扩展语法，借助 ctags 的 -I 参数解决（上例仅列举了少量 GCC 扩展语法，此外还有 \__attribute_malloc__、__wur 等等大量扩展语法，具体请参见 GCC 手册。以后，如果发现某个系统函数无法自动补全，十有八九是头文件中使用使用了扩展语法，先找到该函数完整声明，再将其使用的扩展语法加入 -I 列表中，最后运行 ctags 重新生产新标签文件即可）。


<h3 name="5.3">5.3 由接口快速生成实现框架</h3>

在 \*.h 中写成员函数的声明，在 \*.cpp 中写成员函数的定义，很麻烦，我希望能根据类声明自动生成类实现的代码框架 —— vim-protodef（https://github.com/derekwyatt/vim-protodef ）。vim-protodef 依赖 FSwitch（https://github.com/derekwyatt/vim-fswitch ），请一并安装。请增加如下设置信息：

```
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
```

protodef 根据文件名进行关联，比如，MyClass.h 与 MyClass.cpp 是一对接口和实现文件，MyClass.h 中接口为：

```
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
```

pullproto.pl 是 protodef 自带的 perl 脚本，默认位于 ~/.vim 目录，由于改用 pathogen 管理插件，所以路径需重新设置。

protodef 根据文件名进行关联，比如，MyClass.h 与 MyClass.cpp 是一对接口和实现文件，MyClass.h 中接口为：

```
class MyClass 
{
    public:
        void printMsg (int = 16);
        virtual int getSize (void) const;
        virtual void doNothing (void) const = 0;
        virtual ~MyClass ();
    private:
        int num_;
};
```
在 MyClass.cpp 中生成成员函数的实现框架，如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E6%8E%A5%E5%8F%A3%E7%94%9F%E6%88%90%E5%AE%9E%E7%8E%B0.gif" alt=""/><br />
（接口生成实现）
</div>
MyClass.cpp 中我键入 protodef 定义的快捷键 \<leader>PP，自动生成了函数框架。

上图既突显了 protodef 的优点：优点一，virtual、默认参数等应在函数声明而不应在函数定义中出现的关键字，protodef 已为你过滤；优点二：doNothing() 这类纯虚函数不应有实现的自动被 protodef 忽略。同时也暴露了 protodef 问题：printMsg(int = 16) 的函数声明变更为 printMsg(unsigned)，protodef 无法自动为你更新，它把更改后的函数声明视为新函数添加在实现文件中，老声明对应的实现仍然保留。

关于缺点，先我计划优化下 protodef 源码再发给原作者，后来想想，protodef 借助 ctags 代码分析实现的，本来就存在某些缺陷，好吧，后续我找个时间写个与 protodef 相同功能但对 C++ 支持更完善的插件，内部当然借助 libclang 啦。

另外，每个人都有自己的代码风格，比如，return 语句我喜欢

```
return(TODO);
```
所以，调整了 protodef.vim 源码，把 239、241、244、246 四行改为

```
call add(full, "    return(TODO);") 
```
比如，函数名与形参列表间习惯添加个空格 

```
void MyClass::getSize (void);
```
所以，把 217 行改为

```
let proto = substitute(proto, '(\_.*$', ' (' . params . Tail, '') 
```

<h3 name="5.4">5.4 库信息参考</h3>

有过 win32 SDK 开发经验的朋友对 MSDN 或多或少有些迷恋吧，对于多达 7、8 个参数的 API，如果没有一套函数功能描述、参数讲解、返回值说明的文档，那么软件开发将是人间炼狱。别急，vim 也能做到。

要使用该功能，系统中必须先安装对应 man。安装 linux 系统函数 man，先下载（https://www.kernel.org/doc/man-pages/download.html ），解压后将 man1/ 至 man8/ 拷贝至 /usr/share/man/，运行 man fork 确认是否安装成功。安装 C++ 标准库 man，先下载（ftp://GCC.gnu.org/pub/GCC/libstdc++/doxygen/ ），选择最新 libstdc++-api-X.X.X.man.tar.bz2，解压后将 man3/ 拷贝至 /usr/share/man/，运行 man std::vector 确认是否安装成功；

vim 内置的 man.vim 插件可以查看已安装的 man，需在 .vimrc 中配置启动时自动加载该插件：

```
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>
```
需要查看时，在 vim 中键入输入 :Man fork 或者 :Man std::vector （注意大小写）即可在新建分割子窗口中查看到函数参考信息，为了方便，我设定了快捷键 \<Leader>man，这样，光标所在单词将被传递给 :Man 命令，不用再手工键入，如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%BA%93%E4%BF%A1%E6%81%AF%E5%8F%82%E8%80%83.gif" alt=""/><br />
（库信息参考）
</div>

另外，我们编码时通常都是先声明使用 std 名字空间，在使用某个标准库中的类时前不会添加 std:: 前缀，所以 vim 取到的当前光标所在单词中也不会含有 std:: 前缀，而，C++ 标准库所有 man 文件名均有 std:: 前缀，所以必须将所有文件的 std:: 前缀去掉才能让 :Man 找到正确的 man 文件。在 libstdc++-api-X.X.X.man/man3/ 执行批量重命名以取消所有 man文件的 std:: 前缀： 

```
rename "std::" "" std::\* 
```
顺便说下，很多人以为 rename 命令只是 mv 命令的简单封装，非也，在重命名方面，rename 太专业了，远非 mv 可触及滴，就拿上例来说，mv 必须结合 sed 才能达到这样的效果。

我认为，好的库信息参考手册不仅有对参数、返回值的描述，还应有使用范例，上面介绍的 linux 系统函数 man 做到了，C++ 标准库 man 还未达到我要求。所以，若有网络条件，我更愿意选择查看在线参考，C++ 推荐 http://www.cplusplus.com/reference/ 、http://en.cppreference.com/w/Cppreference:Archives ，前者范例多、后者更新勤；UNIX 推荐 http://pubs.opengroup.org/onlinepubs/9699919799/functions/contents.html 、http://man7.org/linux/man-pages/dir_all_alphabetic.html ，前者基于最新 SUS（Single UNIX Specification，单一 UNIX 规范）、后者偏重 linux 扩展。

<h2 name="6">6 工程管理</h2>

我虽不要求达不到软件工程的高度，但基本的管理还是有必要的，比如，工程文件的管理、多文档编辑、工程环境的保存与恢复。

<h3 name="6.1">6.1 工程文件浏览</h3>

我通常将工程相关的文档放在同个目录下，通过 NERDtree （https://github.com/scrooloose/nerdtree ）插件可以查看文件列表，要打开哪个文件，光标选中后回车即可在新 buffer 中打开。

安装好 NERDtree 后，请将如下信息加入.vimrc中：

```
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
```

常用操作：回车，打开选中文件；r，刷新工程目录文件列表；I（大写），显示/隐藏隐藏文件；m，出现创建/删除/剪切/拷贝操作列表。键入 \<leader>fl 后，右边子窗口为工程项目文件列表，如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E6%96%87%E4%BB%B6%E5%88%97%E8%A1%A8.gif" alt=""/><br />
（工程文件浏览）
</div>

<h3 name="6.2">6.2 多文档编辑</h3>

vim 的多文档编辑涉及三个概念：buffer、window、tab，这三个事物与我们常规理解意义大相径庭。vim 把加载进内存的文件叫做 buffer，buffer 不一定可见；若要 buffer 要可见，则必须通过 window 作为载体呈现；同个看面上的多个 window 组合成一个 tab。一句话，vim 的 buffer、window、tab 你可以对应理解成视角、布局、工作区。我所用到的多文档编辑场景几乎不会涉及 tab，重点关注 buffer、window。

vim 中每打开一个文件，vim 就对应创建一个 buffer，多个文件就有多个 buffer，但默认你只看得到最后 buffer 对应的 window，通过插件 MiniBufExplorer（https://github.com/fholgado/minibufexpl.vim ，原始版本已停止更新且问题较多，该版本是其他人 fork 的新项目）可以把所有 buffer 罗列出来，并且可以显示多个 buffer 对应的 window。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/buffer%20%E5%88%97%E8%A1%A8.png" alt=""/><br />
（buffer 列表）
</div>
我在 vim 中打开了 main.cpp、CMakeLists.txt、MyClass.cpp、MyClass.h 这四个文件，最上面子窗口（buffer 列表）罗列出的 [1:main.cpp][4:CMakeLists.txt][5:MyClass.cpp][6:MyClass.h] 就是对应的四个 buffer。当前显示了 main.cpp 和 MyClass.h 的两个 buffer，分别对应绿色区域和橙色区域的 window，这下对 buffer 和 window 有概念了吧。图中关于 buffer 列表再说明两点：

* \* 表示当前有 window 的 buffer，换言之，有 * 的 buffer 是可见的；! 表示当前正在编辑的 window；
* 你注意到 buffer 序号 1 和 4 不连续的现象么？只要 vim 打开一个 buffer，序号自动增一，中间不连续有几个可能：可能一，打开了 1、2、3、4 后，用户删除了 2、3 两个 buffer，剩下 1、4；可能二，先打开了其他插件的窗口（如，tagbar）后再打开代码文件；

配置：将如下信息加入 .vimrc 中：

```
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
```

操作：一般通过 NERDtree 查看工程文件列表，选择打开多个代码文件后，MiniBufExplorer 在顶部自动创建 buffer 列表子窗口。通过前面配置，ctrl-tab 正向遍历 buffer，ctrl-shift-tab 逆向遍历（光标必须在 buffer 列表子窗口外）；在某个 buffer 上键入 d 删除光标所在的 buffer（光标必须在 buffer 列表子窗口内）：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%A4%9A%E6%96%87%E6%A1%A3%E7%BC%96%E8%BE%91.gif" alt=""/><br />
（多文档编辑）
</div>

默认时，打开的 window 占据几乎整个 vim 编辑区域，如果你想把多个 window 平铺成多个子窗口可以使用 MiniBufExplorer 的 s 和 v 命令：在某个 buffer 上键入 s 将该 buffer 对应 window 与先前 window 上下排列，键入 v 则左右排列（光标必须在 buffer 列表子窗口内）。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%9C%A8%E5%AD%90%E7%AA%97%E5%8F%A3%E4%B8%AD%E7%BC%96%E8%BE%91%E5%A4%9A%E6%96%87%E6%A1%A3.gif" alt=""/><br />
（在子窗口中编辑多文档）
</div>
图中，通过 vim 自身的 f 名字查找 buffer 序号可快速选择需要的 buffer。另外，编辑单个文档时，不会出现 buffer 列表。

<h3 name="6.3">6.3 环境恢复*</h3>

vim 的编辑环境保存与恢复是我一直想要的功能，我希望每当重新打开 vim 时恢复：已打开文件、光标位置、undo/redo、书签、子窗口、窗口大小、窗口位置、命令历史、buffer 列表、代码折叠。vim 文档说 viminfo 特性可以恢复书签、session 特性可以恢复书签外的其他项，所以，请确保你的 vim 支持这两个特性：

```
vim --version | grep mksession
vim --version | grep viminfo
```
如果编译 vim 时添加了 --with-features=huge 选项那就没问题。

一般说来，保存/恢复环境步骤如下。

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

<h2 name="7">7 工具链集成</h2>

既然我们要把 vim 打造成 IDE，那必须得集成编译器、构建工具、静态分析器、动态调试器，当然，你可能还需要版本控制、重构工具等等，我暂时还好。

<h3 name="7.1">7.1 编译器/构建工具集成</h3>

先说下编译器和构建工具。vim 再强大也只能是个优秀的编辑器而非编译器，它能高效地完成代码编辑工作，但必须通过其他外部命令实现将代码转换为二进制可执行文件；一旦工程上规模，你不可能单个单个文件编译，这时构建工具就派上场了。

<h4 name="7.1.1">代码编译</h4>

GCC 是 linux 上 C/C++ 编译器的事实标准，几乎所有发行套件都默认安装，它很好但不是最好：编译错误提示信息可读性不够（特别对于 C++ 模板错误信息基本就是读天书）、基于 GCC 的二次开发困难重重。我需要更优秀的 C++ 编译器。

Stanley B. Lippman 先生所推荐宇宙最强 C++ 编译器 —— LLVM/clang。Stanley 何许人也？不是吧，你玩 C++ 居然不认识他。C++ 世界二号人物，当年在贝尔实验室，Bjarne Stroustrup 构思了 C++ 功能框架，Stanley Lippman 实现了第一个版本。还无感？好吧，他是《C++ Primer》的作者。说了大神，再说说大神推荐的编译器。

<h4 name="7.1.2">系统构建</h4>

对于只有单个代码文件的项目来说，无非是保存代码文件、shell 中调用 GCC 编译、链接这样的简单方式即可实现；但，对于动辄几十上百个文件的工程项目，采用这种方式只会把自己逼疯，必须借助构建工具管理工程的整个构建过程。

linux 有两类工程构建工具 —— Makefile系 和非 Makefile 系，Makefile 系常见构建工具有 GNU 出品的老牌 autoconf、新生代的 CMake，非 Makefile 系中最著名的要数 SCons。KDE 就是通过 CMake（http://www.cmake.org/cmake/resources/software.html ）构建出来的，易用性灵活性兼备，洒泪推荐。

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

<h4 name="7.1.3">一键编译</h4>

工程项目的构建过程游离于 vim 之外终究不那么方便，前面章节介绍的构建过程是在 shell 中执行的，全在 vim 中执行又是如何操作。第一步的创建 CMakeLists.txt 没问题，vim 这么优秀的编辑器编辑个普通文本文件易如反掌；第二步的生成 Makefile 也没问题，在 vim 内部通过 ! 前缀可以执行 shell 命令，:!cmake CMakeLists.txt 即可；第三步的编译过程更没问题，因为 vim 自身支持 make 命令，直接在 vim 中输入 :make 命令它会调用外部 make 程序读取当前目录中的 Makefile 文件，完成编译、链接操作。当然，一次性编译通过的可能性很小，难免有些语法错误（语义错误只能靠调试器了），vim 将编译器抛出的错误和警告信息输出到 quickfix 中，执行 :cw 命令即可显示 quickfix。说了这么多，概要之，先通过构建工具（CMake 可通过 CMakeLists.txt 文件，autotools 可通过 configure 文件）生成整个工程的 Makefile，再在 vim 中执行 :make，最后显示 quickfix。

要实现一键编译，无非是把这几步映射为 vim 的快捷键，即：

```
nmap <Leader>m :wa<CR>:make<CR><CR>:cw<CR>
```
分解说明下，m 为设定的一键编译快捷键，:wa\<CR> 保存所有调整文档内容，:make\<CR> 调用 make 命令，后面的 \<CR> 消除执行完 make 命令屏幕上“Press ENTER or type command to continue”的输入等待提示，:cw\<CR> 显示 quickfix（仅当有编译错误或警告时）。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E4%B8%80%E9%94%AE%E7%BC%96%E8%AF%91.gif" alt=""/><br />
（一键编译）
</div>
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

<h3 name="7.2">7.2 静态分析器集成</h3>

one take，中意“一次成型”，最早指歌手录歌时一次性通过录制，不存在发现错误-修正错误-重新录制这样的往返动作。one take 在编程环境中，就是一次性通过编译，我个人很享受 one take 带来的快感。当然，要达到 one take，不仅需要扎实的编程功底，还需要工具的辅佐 —— 代码静态分析器。前面介绍的神器 YCM 具备实时语法检查的能力。在它的作用下，编码中、编译前，所有语法错误都将被抓出来并呈现给你。

YCM 的整个静态分析过程分为如下几步：

第一步，发现错误。YCM 内部调用 libclang 分析语法错误，通过管道传递给 YCM 呈现。当你保存代码、vim 普通模式下移动光标或者安静 2 秒，错误检查后台任务将自动启动，若有错误，YCM 将接收到；

第二步，呈现错误。YCM 并不非立马显示错误信息，除非你触发下次击键事件，否则你看不到错误信息，换言之，干等是没结果的，你必须有次击键动作（没办法，vim 内部机制所限，后台任务无法直接更新 GUI，所以才采用变通的击键方式）。对于存在语法错误的代码，在行首有个红色的 >> 高亮显示；

第三步，查看错误。好了，现在已经知道哪行代码有问题，具体问题描述如何查看？两种方式：一种是将光标移至问题行，vim 将在其底部显示简要错误描述；一种是将光标移至问题行，键入 \<leader>d 后，vim 将在其底部显示详细错误描述。 

如下所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E9%9D%99%E6%80%81%E4%BB%A3%E7%A0%81%E5%88%86%E6%9E%90.gif" alt=""/><br />
（静态代码分析）
</div>

<h2 name="8">8 其他辅助</h2>

大家关注的 IDE 核心功能前面都已逐一介绍过了，有些辅助功能我认为也有必要让你知道，不是都在提程序员人文关怀嘛，从我做起！

<h3 name="8.1">8.1 快速编辑结对符</h3>

平时，最让我头痛的字符莫过于 {}、""、[] 等这类结对符，输入它们之所以麻烦，主要因为A）盲打很难找准它们位置，B）还得同时按住shift键。两者再一叠加，非常影响我的思维。要高效输入结对符，应该是输入少量几个字母（对，字母，不是字符）后 vim 自动为你输入完整结对符，而非是我输入一半 vim 输入另一半（不用 delimitMate 的原因）。刚好，这在 UltiSnips 能力范围内，只要定义好模板，可完美地解决这类问题，具体模板见上例中最后的结对符部分。

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
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%BF%AB%E9%80%9F%E8%BE%93%E5%85%A5%E7%BB%93%E5%AF%B9%E7%AC%A6.gif" alt=""/><br />
（快速输入结对符）
</div>

另外，要想高效编辑结对符，你得了解 vim 自身的某些快捷键。比如，有如下字符串且光标在该字符串的任意字符上，这时在命令模式下键入 va) 后将选中包括括号在内的整个字符串：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%BF%AB%E9%80%9F%E9%80%89%E4%B8%AD%E7%BB%93%E5%AF%B9%E7%AC%A6.gif" alt=""/><br />
（快速选中结对符）
</div>
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
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%BF%AB%E9%80%9F%E9%80%89%E4%B8%AD%E7%BB%93%E5%AF%B9%E7%AC%A6%E6%96%87%E6%9C%AC.gif" alt=""/><br />
（快速选中结对符文本）
</div>

<h3 name="8.2">8.2 支持分支的 undo</h3>

undo，编辑器世界中的后悔药，让你有机会撤销最近一步或多步操作，这是任何编辑器都具备的基础功能。比如，第一步输入 A，第二步输入 B，第三步输入 C，当前文本为 ABC，一次 undo 后变成 AB，再次 undo 后变成 A，显然，每次 undo 撤销的均是最后的一步操作，通常采用栈这种数据结构来实现 undo 功能，由于栈具有后进先出的特点，所以，功能实现起来非常自然且便捷，但同时，也引入了致命伤，无法支持分支上的 undo 操作。

还是前面的例子，分三步依次输入完 ABC 后，一次 undo 变成 AB，这时，输入 D，之后，无论你多少次 undo 都不可能再找回 C，究其原因，D 是彻底覆盖了 C，而不是与 C 形成两个分支，如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E4%B8%8D%E6%94%AF%E6%8C%81%E5%88%86%E6%94%AF%E7%9A%84%20undo.gif" alt=""/><br />
（不支持分支的 undo）
</div>

在我的使用场景中，非常需要在我输入 D 后还能找回 C 的 undo 功能，即，支持分支的 undo，gundo.vim （http://sjl.bitbucket.org/gundo.vim/ ）降临。gundo.vim 采用树这种数据结构来实现 undo，每一次编辑操作均放在树的叶子上，每次 undo 后，先回到主干，新建分支继续后续操作，而不是直接覆盖，从而实现支持分支的 undo 功能。gundo.vim 要求 vim 版本不低于 v7.3 且支持 python v2.4 及以上。

如下方式设置好调用 gundo.vim 的快捷方式：

```
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
```
gundo.vim 非常贴心，调用它后，你会在左侧看到一个分割为上下两个区域的子窗口。上半区域以可视化方式显示了整颗 undo 树，同时，用 @ 标识最后一步编辑操作，用序号标识各步编辑操作的先后顺序，用时长显示每步操作距离当前消耗时间。下半区域展示了各个操作间的 diff 信息及其上下文，默认为选中那步操作与前一步操作间的 diff，键入 p 可以查看选中那步操作与最后一步操作（即有 @ 标识的那步）间的 diff，这对于找回多次编辑操作之前的环境非常有用。
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E6%94%AF%E6%8C%81%E5%88%86%E6%94%AF%E7%9A%84%20undo.gif" alt=""/><br />
（支持分支的 undo）
</div>

另外，我对持久保存 undo 历史也有需求，以便让我关闭 vim 后重新启动也能找到先前的所有 undo 历史，这需要你在 .vimrc 中添加：

```
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/
```
你得先自行创建 .undo_history/。具体可参见“6.3 环境恢复”章节。

<h3 name="8.3">8.3 快速移动</h3>

vim 有两类快速移动光标的方式：一类是以单词为单位的移动，比如，w 正向移动到相邻单词的首字符、b 逆向移动到相邻单词的首字符、e 正向移动到相邻单词的尾字符、 ge 逆向移动到相邻单词的尾字符；一类是配合查找字符的方式移动，比如，fa 正向移动到第一个字符 a 处、Fa 逆向移动到第一个字符 a 处。你要在非相邻的单词或字符间移动，你可以配合数字参数，比如，正向移动到相隔八个单词的首字符执行 8w、逆向移动到第四个 a 字符处执行 4Fa。

有如下文本：

>backpage kcal liam jack facebook target luach ajax

假定光标在行首，需要移动到 facebook 的字符 a 处，先来数下前面有 1、2 ... 5 个 a，然后用前面所说的 5fa，唔，怎么在 jack 上呢？等等，好像数错了，再数次 1、2 ... 6，对滴，应该是 6fa，这下对了。我的个天，不能让哥太累，得找个插件帮忙 —— easymotion（https://github.com/Lokaltog/vim-easymotion ）。

easymotion 只做一件事：把满足条件的位置用 [;A~Za~z] 间的标签字符标出来，找到你想去的位置再键入对应标签字符即可快速到达。比如，上面的例子，假设光标在行首，我只需键入 \<leader>\<leader>fa （为避免与其他快捷键冲突，easymotion 采用两次 \<leader> 作为前缀键），所有的字符 a 都被重新标记成 a、b、c、d、e、f 等等标签（原始内容不会改变），f 标签为希望移动去的位置，随即键入 f 即可到达。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%BF%AB%E9%80%9F%E7%A7%BB%E5%8A%A8.gif" alt=""/><br />
（快速移动）
</div>

类似，前面提过的 w、e、b、ge、F、j、k 等命令在 easymotion 作用下也能实现快速移动，其中，j 和 k 可跨行移动。同时，你还可以搭配 v 选中命令、d 删除命令、y 拷贝命令，比如，v\<leader>\<leader>fa，快速选中光标当前位置到指定字符 a 之间的文本，d\<leader>\<leader>fa，快速删除光标当前位置到指定字符 a 之间的文本，下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E6%90%AD%E9%85%8D%E6%93%8D%E4%BD%9C%E5%91%BD%E4%BB%A4%E7%9A%84%E5%BF%AB%E9%80%9F%E7%A7%BB%E5%8A%A8.gif" alt=""/><br />
（搭配操作命令的快速移动）
</div>

<h3 name="8.4">8.4 markdown 即时预览</h3>

作为一枚热衷开源的伪 geek，github.com 与我同在。发布在 github.com 的任何项目你得有个项目简介，README.md，这是一种用 markdown 文书编写语法制作的说明文档。关于 markdown，我有两个需求，一是 vim 要高亮显示 markdown 语法，一是 firefox 要能渲染其语法、即时显示更新结果。

第一个需求不是问题，新版 vim 已经集成了 markdown 语法高亮插件，无须单独配置。

第二个需求，按照一般逻辑，应该通过 firefox 的某款插件来实现，的确，Markdown Viewer 看起来是干这个事儿的，但它响应速度缓慢、中文显示乱码、无法即时渲染等等问题让我无法接受。网上倒是有些即时渲染 markdown 的网站，比如，https://stackedit.io/editor ，左侧编辑右侧显示，所见即所得，但这又无法让我使用 vim，不行。还是回到 vim 身上想办法，vim-instant-markdown 来了。有了这款 vim 插件，一旦你启用 vim 编辑 markdown 文档，vim-instant-markdown 自动开启 firefox 为你显示 markdown 最终效果，如果你在 vim 中变更了文档内容，vim-instant-markdown 即时渲染、firefox 同步更新，太棒了！
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/markdown%20%E5%8D%B3%E6%97%B6%E6%B8%B2%E6%9F%93.gif" alt=""/><br />
（markdown 即时渲染）
</div>

vim-instant-markdown（https://github.com/suan/vim-instant-markdown ） 的安装相比其他插件较为特殊，它由 ruby 开发，所以你的 vim 必须集成 ruby 解释器（见“1 源码安装编辑器 vim ”），并且安装 pygments.rb、redcarpet、instant-markdown-d 三个依赖库：

```
gem install pygments.rb
gem install redcarpet
# 若系统提示无 npm 命令，你需要先执行 zypper --no-refresh install nodejs
npm -g install instant-markdown-d
```
注意，以上三条命令均要翻墙。

对于重内容、轻设计的我这类人来说，markdown 简洁的文书语法太贴心了。推荐三个网站：

* markdown 语法 http://daringfireball.net/projects/markdown/syntax
* github.com 扩展 https://guides.github.com/features/mastering-markdown/
* emoji 符号表情 http://www.emoji-cheat-sheet.com/

<h3 name="8.5">8.5 中/英输入平滑切换</h3>

代码中不可能全是英文，即便注释是英文，用户提示信息也多多少少得用中文吧，所以，在 vim 中输入中文是常有的。中/英文输入切换本身很简单，但是，如果又与 vim 的插入模式和命令模式一纠缠，那么，这事儿就不太自然了。

比如，我在插入模式下依次输入了中文的一二四三，本意是想输入一二三四，下意识地键入 esc 切换为命令模式，键入 x 剪切三，再键入 P 将三粘贴至四前。谁知，在键入 x 时，由于输入法仍保留在先前的中文状态下，导致 vim 的命令模式无法接收到命令，必须得再次键入 shift 切换至英文状态。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E4%B8%AD%E6%96%87%E7%8A%B6%E6%80%81%E8%AE%A9%E5%91%BD%E4%BB%A4%E6%A8%A1%E5%BC%8F%E6%97%A0%E6%95%88.gif" alt=""/><br />
（中文状态让命令模式无效）
</div>

这很不协调，我希望，在插入模式下输入完中文，切换至命令模式后，即便先前是中文输入状态，也不影响我正常使用命令模式，甚至再次切回插入模式后，能保持先前的输入状态。来了，fcitx.vim（https://github.com/lilydjwg/fcitx.vim ）就是我要的。对，前提是你系统中用的是 fcitx 输入法（为何不用 scim、ibus？https://github.com/yangyangwithgnu/the_new_world_linux#7.4 ）。装好这个插件后，我们再看看刚才的例子，在中文状态下从插入模式切换至命令模式，键入 x、P 调整完四和三顺序后，重新切换至插入模式，输入法状态仍保持中文。如下图所示：
<div align="center">
<img src="https://git.oschina.net/liwenhui/LeoVim/blob/master/images/%E5%8D%B3%E4%BE%BF%E4%B8%AD%E6%96%87%E7%8A%B6%E6%80%81%E4%B9%9F%E4%B8%8D%E5%BD%B1%E5%93%8D%E5%91%BD%E4%BB%A4%E6%A8%A1%E5%BC%8F.gif" alt=""/><br />
（即便中文状态也不影响命令模式）
</div>

几乎完美了，唯一问题是，该插件无法保证从其他程序窗口切换至 vim 后仍有效。


<h2 name="9">9 尾声</h2>

嗷呼，经过以上调教，你的 vim 已经成为非常舒适的 C/C++ 开发环境呢。等等，重装系统后又得折腾一次？不怕，除了 clang 等等几个需要源码安装的工具外，基本上，vim 的插件和相关配置文件你可以提前备份好，装完系统后恢复到对应目录中即可，丝毫不费脑力。
