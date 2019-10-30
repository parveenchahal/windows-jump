@echo off
SET p1=%1

for /f "tokens=*" %%a in (%Jump_Map%) do (call :CheckForMatch %%a)
exit /b

:CheckForMatch
if %p1%==%1 ( for /f "tokens=1,2 delims=:" %%a in ("%2") do ( call :navigate %%a %%b ) )
exit /b

:navigate
%1:
cd %2
exit /b
