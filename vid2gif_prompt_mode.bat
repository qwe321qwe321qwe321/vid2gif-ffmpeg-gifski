@echo off
IF [%1] == [] exit
REM Move to the directory of the batch file
pushd "%~dp0"

@setlocal
REM d is drive, p is path, n is name, x is extension.
set _filename=%~dpn1
set _extension=%~x1
set width=600
set fps=20
set /p width="Output Width(default 600): "
set /p fps="Output Frame Rate(default 20): "

:ASK_GIFSKI
set USE_GIFSKI=Y
set /p USE_GIFSKI="Use gifski? ([Y]/N): "
REM /i for case insensitive
IF /i "%USE_GIFSKI%" == "Y" GOTO GIFSKI_CALL
IF /i "%USE_GIFSKI%" == "N" GOTO FFMPEG_CALL
GOTO ASK_GIFSKI

:GIFSKI_CALL
set quality=90
set /p quality="Quality [0 - 100] (default 90): "
call .\scripts\to_gif_gifski_cmd.bat "%_filename%%_extension%" "%_filename%.gif" %width% %fps% %quality%
GOTO END

:FFMPEG_CALL
call .\scripts\to_gif_ffmpeg_cmd.bat "%_filename%%_extension%" "%_filename%.gif" %width% %fps%
GOTO END

:END
@endlocal
popd