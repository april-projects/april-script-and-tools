@echo off
setlocal enabledelayedexpansion

echo ��ʼ����Start Processing��

for /R %%i in (*.mp4) do (
	set ext=_transcoded.mp4
	ffmpeg -hide_banner -i "%%~fi" -c copy -metadata:s:v:0 rotate=90 "%%~di%%~pi%%~ni!ext!"
)

echo . && echo . && echo . && echo ��ɣ�Finished�� && echo . && echo . && echo . 
pause

