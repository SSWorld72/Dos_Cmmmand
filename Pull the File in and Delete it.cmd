@echo off
color 3E

echo.
echo.
echo *****************************************
echo     Pull the File in and Delete it...
echo *****************************************
echo.

:Select
set /p choose=Are you sure want to delete these Files or Directory " %1 " (Y/N)?
if /I "%choose%" == "Y" goto Select_Y
if /I "%choose%" == "N" goto Select_N
echo.
echo Error! The button " [%choose%] " is Invalid, Please Re-Enter...
echo.
goto Select

:Select_Y
echo.
echo Delete " %1 " Files...
DEL /F /A /Q \\?\%1
echo.
echo Delete " %1 " Directory...
RD /S /Q \\?\%1
echo.
echo  " %1 " Has been removed (deleted) completed...
echo.
goto Exit

:Select_N
echo.
echo Job Canceled...
echo.
goto Exit

:Exit
echo.
set /p "_close= Are you sure you want to exit? (Y/Any)¡G"
if /I "%_close%" == "Y" (
	exit
) else (
	goto Select
)