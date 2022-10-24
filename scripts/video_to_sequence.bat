@echo off
setlocal
set input=%1
set width=%2
set fps=%3

@echo on
if not exist "..\frames" mkdir "..\frames"
if exist "..\frames\out*.png" del /q "..\frames\out*.png"
..\dependencies\ffmpeg.exe -i %input% -vf "fps=%fps%,scale=%width%:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "..\frames\out%%d.png"
@echo off
endlocal