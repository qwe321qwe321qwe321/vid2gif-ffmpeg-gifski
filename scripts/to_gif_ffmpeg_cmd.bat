@echo off
pushd "%~dp0"

setlocal
set input=%1
set output=%2
set width=%3
set fps=%4

call ..\dependencies\ffmpeg.exe -i %input% -vf "fps=%fps%,scale=%width%:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 %output%
endlocal
popd