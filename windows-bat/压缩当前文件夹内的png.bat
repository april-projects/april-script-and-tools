@echo off
echo "��ʼ����..."

for /R %%i in (*.png) do (
  move "%%i" "%temp%\temp.png"
  pngquant  - < "%temp%\temp.png" > "%%i"
  echo "�ɹ�"
)

pause