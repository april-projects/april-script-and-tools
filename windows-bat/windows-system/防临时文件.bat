echo y| cacls "C:\Documents and Settings\All Users\����ʼ���˵�\����\����" /c /p Everyone:r
echo y| cacls "%USERPROFILE%\����ʼ���˵�\����\����" /c /p Everyone:r

if not exist %systemroot%\system32\drivers\pcihdd2.sys md %systemroot%\system32\drivers\pcihdd2.sys  
echo y|cacls %systemroot%\system32\drivers\pcihdd2.sys /d everyone

if not exist %systemroot%\system32\drivers\ati32srv.sys md %systemroot%\system32\drivers\ati32srv.sys 
echo y|cacls %systemroot%\system32\drivers\ati32srv.sys /d everyone
