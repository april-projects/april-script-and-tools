@echo off
color f4
echo �ر�����! �벻Ҫ�޸�C: !&PAUSE>NUL
COLOR 07
cls
    set/p a=������ԭ�̷�����  
    set/p b=���������̷�����  
    set old=%a%:
    set new=%b%:
    pushd %new% 2>nul && echo %new%���Ѿ�����! && pause && goto :eof
    for /f %%i in ('mountvol %old% /l') do set "vol=%%i"
    mountvol %old% /d
    mountvol %new% %vol%
    popd