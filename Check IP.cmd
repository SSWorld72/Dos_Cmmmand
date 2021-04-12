@echo off
color 3E
:ReStart
echo.
echo.
echo ******************************************
echo     Get Computer Name ^& IP Address...
echo ******************************************
echo.

for /f "tokens=1 delims==" %%i in ('hostname') do (
	set CName=%%i
)

for /f "tokens=2 delims=:" %%i in ('ipconfig ^| find /I "IPv4 ¦ì§}"') do (
	for /f "tokens=1 delims= " %%j in ("%%i") do (
		set IP_ALL=%%j
	)
)
echo.
echo Your Computer Name is "%CName%" and IP Address is "%IP_ALL%"¡C
echo.


:Exit
echo.
set /p "_close= Are you sure you want to exit? (Y/Any)¡G"
if /I "%_close%" == "Y" (
	exit
) else (
	goto ReStart
)