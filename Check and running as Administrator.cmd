@echo off
color 3E

echo.
echo.
echo **********************************************
echo     Check Administrators And Running it...
echo **********************************************
net.exe session 1>NUL 2>NUL && (
	goto gotAdmin
) || (
	goto UACPrompt
)

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs" 
"%temp%\getadmin.vbs" 
exit /B  
  
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" ) 

:AnyCommand
echo.
ipconfig /all
::And any command...
::And any command...
::And any command...
::And any command...
::And any command...


:Exit
echo.
set /p "_close= Are you sure you want to exit? (Y/Any)¡G"
if /I "%_close%" == "Y" (
	exit
) else (
	goto AnyCommand
)