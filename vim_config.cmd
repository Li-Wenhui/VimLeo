@rem ==================================================================
@rem
@rem Latest compiled vim: https://tuxproject.de/projects/vim/
@rem
@rem ==================================================================


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
echo　　　　║    1 : 配置为32位gvim　                              ║
echo　　　　║    2 : 配置为64位gvim　                              ║
echo　　　　║    3 : 添加右键快捷菜单                              ║
echo　　　　║    4 : 删除右键快捷菜单                              ║
echo　　　　║    5 : 字库安装                                      ║
echo　　　　║    0 : 退出　                                        ║
echo　　　　╟═══════════════════════════╢
echo　　　　║　         WIN8/WIN10下需要以管理员身份运行此批处理!  ║
echo　　　　╰───────────────────────────╯
echo.

set xz=
set /p xz=请选择或(1、2、3、4、5或0)：
if /i "%xz%"=="1" goto :inst32
if /i "%xz%"=="2" goto :inst64
if /i "%xz%"=="3" goto :addreg
if /i "%xz%"=="4" goto :delreg
if /i "%xz%"=="5" goto :instfont
if /i "%xz%"=="0" goto :end
echo 输入不正确 请重新开始... & goto start

:inst32
if not exist "%filePath%vim74\complete-x86.7z" echo. &echo 没有找到vim74_x86.zip! 请按任意键回到主菜单... &pause>nul &goto start
cd "%filePath%vim74"
7z x -y complete-x86.7z
echo 任务完成，请按任意键回到主菜单... &pause>nul
goto start

:inst64
if not exist "%filePath%vim74\complete-x64.7z" echo. &echo 没有找到vim74_x64.zip! 请按任意键回到主菜单... &pause>nul &goto start
cd "%filePath%vim74"
7z x -y complete-x64.7z
echo 任务完成，请按任意键回到主菜单... &pause>nul
goto start

:addreg
reg add "HKEY_CLASSES_ROOT\*\shell\Edit with &Vim"
reg add "HKEY_CLASSES_ROOT\*\shell\Edit with &Vim\command" /v "" /t "REG_SZ" /d "\"%filePath%vim74\gvim.exe\" -p --remote-tab-silent \"%%1%\"" /f
echo 任务完成，请按任意键回到主菜单... &pause>nul
goto start

:delreg
reg delete "HKEY_CLASSES_ROOT\*\shell\Edit with &Vim" /f
echo 任务完成，请按任意键回到主菜单... &pause>nul
goto start

:instfont
if not exist "%filePath%fonts\DejaVuSansMonoforPowerline_NF.ttf" echo. &echo 没有找到fonts文件夹! 请按任意键退出... &pause>nul &exit
copy /y %filePath%fonts\*.* %fontsdir%*.* 
echo 任务完成，请按任意键回到主菜单... &pause>nul
goto start

:end
echo.
echo.
echo                看日出
echo.
echo               ╭⌒╮¤　　　　　　 ╭══╮   牵着手
echo               ╭╭ ⌒╮ ●╭○╮ ╭╯Leo ║
echo               ╰ ----╯/█∨█\  ╰⊙═⊙╯       去海边
echo               ~~~~~~~~~~∏~~∏~~~~~~~~~~~.
echo.
echo.
echo 任务完成，请按任意键退出... &pause>nul &exit
