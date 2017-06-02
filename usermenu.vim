" vim: set sw=4 :
"
" 自定义VIM菜单
"

" =============================================================================
" 菜单栏项目
an 1100.100.10 自定义.空白操作.去除行首空白<TAB>(\\rsb)  :%s/^\s*//g<CR>:nohl<CR>
an 1100.100.20 自定义.空白操作.去除行尾空白<TAB>(\\rst)  :%s/\s\+$//g<CR>:nohl<CR>
an 1100.100.30 自定义.空白操作.合并空行<TAB>(\\rsj)      :v/./.,/./-j<CR>:nohl<CR>
an 1100.100.40 自定义.空白操作.压缩空行<TAB>(\\rss)      :g/^\s*$/d<CR>:nohl<CR>
an 1100.100.50 自定义.空白操作.去除行尾^M字符<TAB>(\\rm) :%s/<C-v><C-m>//g<CR>

an 1100.200.10 自定义.Tab空格互换.替换Tab为2个空格<TAB>(\\xts2) :%s/\t/\ \ /g<CR>
an 1100.200.10 自定义.Tab空格互换.替换Tab为4个空格<TAB>(\\xts)  :%s/\t/\ \ \ \ /g<CR>
an 1100.200.30 自定义.Tab空格互换.替换Tab为8个空格<TAB>(\\xts8) :%s/\t/\ \ \ \ \ \ \ \ /g<CR>
an 1100.200.40 自定义.Tab空格互换.-SEP211-			<Nop>
an 1100.200.50 自定义.Tab空格互换.替换2个空格为Tab<TAB>(\\x2st) :%s/\ \ /\t/g<CR>
an 1100.200.50 自定义.Tab空格互换.替换4个空格为Tab<TAB>(\\xst)  :%s/\ \ \ \ /\t/g<CR>
an 1100.200.60 自定义.Tab空格互换.替换8个空格为Tab<TAB>(\\x8st) :%s/\ \ \ \ \ \ \ \ /\t/g<CR>

an 1100.300.10 自定义.文件编码.查看文件编码<TAB>   :set fileencoding<CR>
an 1100.300.20 自定义.文件编码.转为ANSI编码<TAB>   :set fileencoding=cp936<CR>
an 1100.300.30 自定义.文件编码.转为UTF-8编码<TAB>  :set fileencoding=utf-8<CR>
an 1100.300.40 自定义.文件编码.转为gb2312编码<TAB> :set fileencoding=gb2312<CR>

an 1100.400 自定义.-SEP1101-			<Nop>
an 1100.400.10 自定义.创建ctags<TAB>(\\tc)		   :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>

" =============================================================================
" 鼠标右键弹出快捷菜单
"
an 1.200 PopUp.-SEP200-			<Nop>
nnoremenu 1.210 PopUp.空白操作.去除行首空白<TAB>(\\rsb)  :%s/^\s*//g<CR>:nohl<CR>
nnoremenu 1.210 PopUp.空白操作.去除行尾空白<TAB>(\\rst)  :%s/\s\+$//g<CR>:nohl<CR>
nnoremenu 1.210 PopUp.空白操作.合并空行<TAB>(\\rsj)      :v/./.,/./-j<CR>:nohl<CR>
nnoremenu 1.210 PopUp.空白操作.压缩空行<TAB>(\\rss)      :g/^\s*$/d<CR>:nohl<CR>
nnoremenu 1.210 PopUp.空白操作.去除行尾^M字符<TAB>(\\rm) :%s/<C-v><C-m>//g<CR>

an        1.210 PopUp.-SEP210-			<Nop>
nnoremenu 1.210 PopUp.Tab空格互换.替换Tab为2个空格<TAB>(\\xts2) :%s/\t/\ \ /g<CR>
nnoremenu 1.210 PopUp.Tab空格互换.替换Tab为4个空格<TAB>(\\xts)  :%s/\t/\ \ \ \ /g<CR>
nnoremenu 1.210 PopUp.Tab空格互换.替换Tab为8个空格<TAB>(\\xts8) :%s/\t/\ \ \ \ \ \ \ \ /g<CR>
an        1.210 PopUp.Tab空格互换.-SEP211-			<Nop>
nnoremenu 1.210 PopUp.Tab空格互换.替换2个空格为Tab<TAB>(\\x2st) :%s/\ \ /\t/g<CR>
nnoremenu 1.210 PopUp.Tab空格互换.替换4个空格为Tab<TAB>(\\xst)  :%s/\ \ \ \ /\t/g<CR>
nnoremenu 1.210 PopUp.Tab空格互换.替换8个空格为Tab<TAB>(\\x8st) :%s/\ \ \ \ \ \ \ \ /\t/g<CR>

an        1.210 PopUp.-SEP220-			<Nop>
nnoremenu 1.210 PopUp.文件编码.查看文件编码<TAB>   :set fileencoding<CR>
nnoremenu 1.210 PopUp.文件编码.转为ANSI编码<TAB>   :set fileencoding=cp936<CR>
nnoremenu 1.210 PopUp.文件编码.转为UTF-8编码<TAB>  :set fileencoding=utf-8<CR>
nnoremenu 1.210 PopUp.文件编码.转为gb2312编码<TAB> :set fileencoding=gb2312<CR>

an        1.210 PopUp.-SEP230-			<Nop>
nnoremenu 1.210 PopUp.创建ctags<TAB>(\\tc)		   :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>
