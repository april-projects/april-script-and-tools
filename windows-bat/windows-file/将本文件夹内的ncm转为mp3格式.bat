@echo off
setlocal enabledelayedexpansion

:: ���ߣ�Haujet Zhao
:: ���ڣ�2021 �� 2 �� 14 ��
:: ���ã������ļ����ڵ� ncm �ļ�תΪ mp3 ��Ƶ
::       ��ת����ɺ�ԭ�е� ncm �ļ��ᱻɾ��

:: ���д˽ű���Ҫ��ȷ����װ�У�Python��ncmdump

:: ncmdump Դ���ַ��https://github.com/anonymous5l/ncmdump
:: ncmdump Python ʵ�ֵ�Դ��ֿ⣺https://github.com/nondanee/ncmdump

:: pip ��װ ncmdump ���pip install git+https://github.com/anonymous5l/ncmdump.git

:: ��ʵ�ǿ���ʹ�� ncmdump �� -d ѡ��ɾ�������ļ���
:: ����Ϊ�˷����д�ű���Ӧ��������
:: ����ʹ���ֶ�ɾ�������ļ��ķ�ʽ

set ת����ɺ�ɾ��ԭ�ļ�=True

for /R %%i in (*.ncm) do (
	set �����ļ�·��=%%~dpi
	set �����ļ���=%%~ni
	set �����ļ���չ��=%%~xi
	
	set ȫ��ѡ��=
	
	set �����ļ�="%%~i"
	
	set ����=ncmdump !ȫ��ѡ��! !�����ļ�! 
	
	echo=
	echo !����!
	
	!����!
	
	if %ת����ɺ�ɾ��ԭ�ļ�% == True (
		echo ɾ�� !�����ļ�!
		del !�����ļ�!
	)
)

echo Mission complete! 

pause
