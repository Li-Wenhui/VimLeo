@echo off
if not exist "%~dp0AStyle.exe" echo 请把我与AStyle.exe放在同一目录下! &echo 请按任意键退出 &pause>nul &exit

:start
cls
color 0E 
title=代码整理工具,右键菜单安装卸载程序
echo　　　　　　　  ╭═══════════════════╮
echo　　　　　　　  ║　　　　　　　　　　　　　　　　　　  ║
echo　　　　╭═══┤代码整理      安装说明     Win8下测试 ├═══╮
echo　　　　║　　  ║　　　　　　　　　　　　　　　　　　  ║　    ║
echo　　　　║　　  ╰═══════════════════╯　    ║
echo　　　　║　修改文件及目录右键菜单,也可右键发送到SendTo         ║
echo　　　　╟═══════════════════════════╢
echo　　　　║  输入1.安装　                                        ║
echo　　　　║  输入2.卸载　                                        ║
echo　　　　╟═══════════════════════════╢
echo　　　　╰───────────────────────────╯
set xz=
set /p xz=请选择或(1或2)：
if /i "%xz%"=="1" goto :inst
if /i "%xz%"=="2" goto :uninst
echo 输入不正确 请重新开始 & ping -n 3 127.1>nul & goto start

:inst
cd /d %~dp0
copy /y AStyleAll.bat "C:\Users\Default\AppData\Roaming\Microsoft\Windows\SendTo\AStyleAll.bat"
set filePat=%~dp0
reg add "HKEY_CLASSES_ROOT\Directory\shell\AStyle" /v "" /d "&AS代码整理" /f 
reg add "HKEY_CLASSES_ROOT\Directory\shell\AStyle\command" /v "" /d "%filePat%AStyleAll.bat \"%%1%\"" /f
reg add "HKEY_CLASSES_ROOT\*\shell\AStyle" /v "" /d "&AS代码整理" /f 
reg add "HKEY_CLASSES_ROOT\*\shell\AStyle\command" /v "" /d "%filePat%AStyleAll.bat \"%%1%\"" /f
goto end

:uninst
del /q "C:\Users\Default\AppData\Roaming\Microsoft\Windows\SendTo\AStyleAll.bat"
reg delete "HKEY_CLASSES_ROOT\Directory\shell\AStyle" /f
reg delete "HKEY_CLASSES_ROOT\*\shell\AStyle" /f
goto end

:end
echo.
echo.                      看日出
echo.
echo                     ╭⌒╮¤　　　　　　 ╭══╮   牵着手
echo                     ╭╭ ⌒╮ ●╭○╮ ╭╯Diy ║
echo                     ╰ ----╯/█∨█\  ╰⊙═⊙╯       去海边
echo                     ~~~~~~~~~~∏~~∏~~~~~~~~~~~.
ping -n 10 127.1>nul
exit
