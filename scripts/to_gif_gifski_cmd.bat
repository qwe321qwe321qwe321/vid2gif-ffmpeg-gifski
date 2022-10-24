@echo off
pushd "%~dp0"
setlocal
set input=%1
set output=%2
set width=%3
set fps=%4
set quality=%5

@echo on
call .\video_to_sequence.bat %input% %width% %fps%
call .\sequence_to_gifski.bat %output% %fps% %quality%

@echo off
endlocal
popd