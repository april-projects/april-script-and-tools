@echo off
echo "��ʼ����..."

for /R %%i in (*.gif) do (
  gifsicle --batch --resize-width 480 -i "%%i"
  echo "�ɹ�"
)