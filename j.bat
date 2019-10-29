@echo off
SET p1=%1

for /f "tokens=*" %%a in (%Jump_Map%) do (call :CheckForMatch %%a)
exit /b

:CheckForMatch
if %p1%==%1 ( cd %2 )
exit /b

:navigate
cd %1
exit /b
