@echo off
setlocal enabledelayedexpansion

echo ��ʼ����Start Processing��

for /R %%i in (*.wav) do (
	set target=%%i
	set target=!target:%CD%=%CD%_transcoded!.aac
	set targe_folder=!target:\%%~nxi.aac=!
	mkdir !targe_folder!
	ffmpeg -hide_banner -i "%%i" -b:a 320k -ar 44100 "!target!"
)

echo . && echo . && echo . && echo ��ɣ�Finished�� && echo . && echo . && echo . 
pause

