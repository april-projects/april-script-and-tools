@echo off
echo �����û��ʺ�IDΪ��
echo.
for /f "skip=4 tokens=1-3" %%i in ('net user') do (
    if not "%%i"=="����ɹ���ɡ�" echo %%i
    if not "%%j"=="" echo %%j
    if not "%%k"=="" echo %%k
)
echo.
echo ��ǰ�û��ʺ�IDΪ��%username%
pause>nul