@echo off
set pypath=home = %~dp0python
set venvpath=_ENV=%~dp0venv
if exist venv (powershell -command "$text = (gc venv\pyvenv.cfg) -replace 'home = .*', $env:pypath; $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False);[System.IO.File]::WriteAllLines('venv\pyvenv.cfg', $text, $Utf8NoBomEncoding);$text = (gc venv\scripts\activate.bat) -replace '_ENV=.*', $env:venvpath; $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False);[System.IO.File]::WriteAllLines('venv\scripts\activate.bat', $text, $Utf8NoBomEncoding);")

del /q "tmp\tmp*" >nul 2>nul & del /q "tmp\gradio\*.*" >nul 2>nul & del /q "temp\*.*" >nul 2>nul & del /q "temp\temp\*.*" >nul 2>nul & del /q "temp\audio\*.*" >nul 2>nul & del /q "temp\video\*.*" >nul 2>nul & rd /s /q "pip\cache" >nul 2>nul & for /d %%x in (tmp\tmp*,tmp\pip*,tmp\gradio\*) do (rd /s /q "%%x" 2>nul || ("%%x" && exit /b 1))

set appdata=tmp
set userprofile=tmp
set temp=tmp
set path=venv\scripts;ffmpeg
call venv\scripts\activate.bat

python inference.py --face 1--1.mp4 --audio 1--1.wav --outfile results\1--2.mp4

copy "results\1--2.mp4" "..\output"
del results\1--2.mp4
del 1--1.mp4
del 1--1.wav
pause
