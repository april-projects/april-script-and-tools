::ʹ��WMI������ȡPC��Ҫ��Ϣ.bat
::ʹ��WMI������ȡ��Ҫ��Ϣ,���Ϊ��ҳ��ʽ
::--------by MOBO[ī��] at 2006-09-16:
wmic baseboard list brief /format:hform >MyPC.htm
wmic cpu list full /format:hform >>MyPC.htm
wmic bios list brief /format:hform >>MyPC.htm
MyPC.htm