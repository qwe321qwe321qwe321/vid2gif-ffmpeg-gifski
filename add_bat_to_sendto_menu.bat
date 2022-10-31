@echo off
IF [%1] == [] exit
REM Move to the directory of the batch file

@setlocal
REM d is drive, p is path, n is name, x is extension.
set _filename=%~dpn1
set _extension=%~x1
set _default_name=%~n1
set shortcut_name=%_default_name%
set /p shortcut_name="Shortcut name (default %_default_name%): "

set sendto_directory=%APPDATA%\Microsoft\Windows\SendTo
set shortcut_filename=%sendto_directory%\%shortcut_name%.bat
if exist %shortcut_filename% GOTO FILE_EXIST
GOTO FILE_NOT_EXIST

:FILE_EXIST

:ASK_OVERWRITE
set DELETE_ORIGINAL=Y
set /p DELETE_ORIGINAL="%shortcut_filename% exists, replace it? ([Y]/N): "
IF /i "%DELETE_ORIGINAL%" == "Y" GOTO REPLACE_IT
IF /i "%DELETE_ORIGINAL%" == "N" GOTO NOT_REPALCE_IT
GOTO ASK_OVERWRITE

:REPLACE_IT
del /q %shortcut_filename%
GOTO FILE_NOT_EXIST

:NOT_REPALCE_IT
echo exit.
pause
GOTO :END

:FILE_NOT_EXIST
set intall_directory=%~dp0
echo @"%_filename%%_extension%" %%1 > %shortcut_filename%
echo Added %shortcut_name% to 'Send To' shortcuts.
pause
:END

@endlocal
