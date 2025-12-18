@echo off
chcp 65001
set "SEVENZIP_PATH=C:\Program Files\7-Zip\7z.exe"
set "PREFIX=sai2-20241123-64bit-"

:: 简体
call:Pack "zh-CN"

:: 繁体
copy ".\zh-CN\init\blotmap\渗色.bmp" ".\zh-TW\init\blotmap\滲色.bmp"
copy ".\zh-CN\init\blotmap\渗色与噪点.bmp" ".\zh-TW\init\blotmap\滲色與噪點.bmp"
copy ".\zh-CN\init\bristle\圆笔.bmp" ".\zh-TW\init\bristle\圓筆.bmp"
copy ".\zh-CN\init\bristle\平笔.bmp" ".\zh-TW\init\bristle\平筆.bmp"
copy ".\zh-CN\init\bristle\平面.bmp" ".\zh-TW\init\bristle\平面.bmp"
copy ".\zh-CN\init\brshape\水彩晕染.bmp" ".\zh-TW\init\brshape\水彩暈染.bmp"
copy ".\zh-CN\init\brushtex\画布.bmp" ".\zh-TW\init\brushtex\畫布.bmp"
copy ".\zh-CN\init\brushtex\绘图纸.bmp" ".\zh-TW\init\brushtex\繪圖紙.bmp"
copy ".\zh-CN\init\papertex\水彩１.bmp" ".\zh-TW\init\papertex\水彩１.bmp"
copy ".\zh-CN\init\papertex\水彩２.bmp" ".\zh-TW\init\papertex\水彩２.bmp"
copy ".\zh-CN\init\papertex\画布.bmp" ".\zh-TW\init\papertex\畫布.bmp"
copy ".\zh-CN\init\papertex\绘图纸.bmp" ".\zh-TW\init\papertex\繪圖紙.bmp"
copy ".\zh-CN\init\scatter\星.bmp" ".\zh-TW\init\scatter\星.bmp"
call:Pack "zh-TW"
del /s /q "%~dp0\zh-TW\init\*.bmp"

pause
exit

:Pack
".\Patcher.exe" "..\sai2.exe.bak" ".\%~1"
set "SOURCE_PATH=".\%~1\init\" ".\%~1\sai2.exe" ".\%~1\sai2.ini" ".\%~1\history.txt""
set "OUTPUT_ARCHIVE=%~dp0%PREFIX%%~1.zip"
"%SEVENZIP_PATH%" a -tzip "%OUTPUT_ARCHIVE%" %SOURCE_PATH%
del /s /q ".\%~1\sai2.exe"
goto:eof
