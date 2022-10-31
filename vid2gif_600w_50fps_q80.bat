@echo off
IF [%1] == [] exit
REM Move to the directory of the batch file
pushd "%~dp0"
setlocal
set _filename=%~dpn1
set _extension=%~x1
set width=600
set fps=50
set quality=80

call .\scripts\to_gif_gifski_cmd.bat "%_filename%%_extension%" "%_filename%_%width%w_%fps%f_%quality%q.gif" %width% %fps% %quality%
endlocal
popd
