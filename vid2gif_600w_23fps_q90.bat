@echo off
IF [%1] == [] exit
REM Move to the directory of the batch file
pushd "%~dp0"
setlocal
set _filename=%~dpn1
set _extension=%~x1

call .\scripts\to_gif_gifski_cmd.bat "%_filename%%_extension%" "%_filename%.gif" 600 23 90
endlocal
popd
pause
