@echo off

setlocal enabledelayedexpansion

set b=/-\ /-\ **

set �ٶ�=1

set �˸�=

set n=0



for %%i in (%SystemRoot%\*.*) do (call :a !n!&copy %%i>nul 2>nul&set /a n+=1)

goto :eof



:a

set/a a=%1%%10

set/a c=%a%%%4

if %a% EQU 0 set/p=��<nul

if %c% EQU 3 (set/p=^|<nul) else (set/p=!b:~%a%,1!<nul)

ping/n %�ٶ�% 127.1>nul

set/p=%�˸�%<nul

goto :eof

  