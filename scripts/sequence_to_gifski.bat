@echo off
setlocal
set output=%1
set fps=%2
set quality=%3

@echo on
..\dependencies\gifski.exe -r %fps% -Q %quality% -o %output% ..\frames\out*.png

@echo off
endlocal