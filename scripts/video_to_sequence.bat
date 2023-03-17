@echo off
setlocal
set input=%1
set width=%2
set fps=%3
set aspect=%4


if "%aspect%"=="" (
    goto NON_ASPECT_RATIO
) else if %aspect% lss 0 (
    goto NON_ASPECT_RATIO
)

:ASPECT_RATIO
set crop_width=min^(iw\,ih*^(%aspect%^)^)
set pad_width=max^(iw\,ih*^(%aspect%^)^)
set pad_size=max^(0\,^(ih*^(%aspect%^)-iw^)/2^)
@REM crop=width:height
set crop_command=crop=%crop_width%^:ih,
@REM pad=width:height:pad_width:pad_height:color
set pad_command=pad=%pad_width%^:ih^:%pad_size%^:0^:black,

:NON_ASPECT_RATIO


@echo on
if not exist "..\frames" mkdir "..\frames"
if exist "..\frames\out*.png" del /q "..\frames\out*.png"
..\dependencies\ffmpeg.exe -i %input% -vf "fps=%fps%,%pad_command%%crop_command%scale=%width%:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "..\frames\out%%d.png"
@echo off
endlocal