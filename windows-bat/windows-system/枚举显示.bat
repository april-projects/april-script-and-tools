@echo off
mode con:cols=80 lines=8
title ö����ʾ
set tgt=%windir%
for /F "tokens=*" %%i in ('dir %tgt% /A- /B /S') do @(cls && echo %%i && for /L %%k in (1,1,100) do @ver>nul)