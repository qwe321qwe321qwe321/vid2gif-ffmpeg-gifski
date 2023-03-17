@echo off
pushd "%~dp0"
setlocal
set input=%1
set output=%2
set width=%3
set fps=%4
set aspect=%5
set quality=%6

@echo on
call .\video_to_sequence.bat %input% %width% %fps% %aspect%
call .\sequence_to_gifski.bat %output% %fps% %quality%

@echo off
endlocal
popd