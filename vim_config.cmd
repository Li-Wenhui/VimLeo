@echo off
set filePath=%~dp0
set fontsdir=%SystemRoot%\Fonts\
if not exist "%filePath%undodir" mkdir undodir

:start
cls
@rem color 0E 
title=gvim设置工具
echo.
echo　　　　　　　   ╭══════════════════╮
echo　　　　　　　  ║　　　　　　　　　　　　　　　　　　  ║
echo　　　　 ╭══=┤ gvim x86/x64 配置确认    Win10下测试 ├=══╮
echo　　　　║　　  ║　　　　　　　　　　　　　　　　　　  ║　    ║
echo　　　　║　　  ╰═══════════════════╯　    ║
echo　　　　╟═══════════════════════════╢
echo　　　　║  输入选择:　                                         ║
echo　　　　║    1 : 添加右键快捷菜单                              ║
echo　　　　║    2 : 删除右键快捷菜单                              ║
echo　　　　║    3 : 字库安装                                      ║
echo　　　　║    0 : 退出　                                        ║
echo　　　　╟═══════════════════════════╢
echo　　　　║　     WIN8/WIN10下可能需要以管理员身份运行此批处理!  ║
echo　　　　╰───────────────────────────╯
echo.

set xz=
set /p xz=请选择或(1、2、3或0)：
if /i "%xz%"=="1" goto :addreg
if /i "%xz%"=="2" goto :delreg
if /i "%xz%"=="3" goto :instfont
if /i "%xz%"=="0" goto :end
echo 输入不正确 请重新开始... & goto start

:addreg
reg add "HKEY_CLASSES_ROOT\*\shell\Edit with &gVim"
reg add "HKEY_CLASSES_ROOT\*\shell\Edit with &gVim\command" /v "" /t "REG_SZ" /d "\"%filePath%vim80\gvim.exe\" -p --remote-tab-silent \"%%1%\"" /f
echo 任务完成，请按任意键回到主菜单... &pause>nul
goto start

:delreg
reg delete "HKEY_CLASSES_ROOT\*\shell\Edit with &gVim" /f
echo 任务完成，请按任意键回到主菜单... &pause>nul
goto start

:instfont
if not exist "%filePath%fonts\Microsoft YaHei Mono.ttf" echo. &echo 没有找到fonts文件夹! 请按任意键退出... &pause>nul &exit
copy /y %filePath%fonts\*.ttf %fontsdir%*.ttf 
echo 任务完成，请按任意键回到主菜单... &pause>nul
goto start

:end
echo.
echo                      看日出
echo.
echo                     ╭⌒╮¤　　　　　　 ╭══╮   牵着手
echo                     ╭╭ ⌒╮ ●╭○╮ ╭╯Leo ║
echo                     ╰ ----╯/█∨█\  ╰⊙═⊙╯       去海边
echo                     ~~~~~~~~~~∏~~∏~~~~~~~~~~~.
echo.
echo 正在退出，请稍候(Waiting to exit) ...
ping -n 2 127.1>nul
exit
