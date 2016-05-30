@echo off  
setlocal enabledelayedexpansion
set total_days=200
FOR /F "delims=" %%i IN (out\tags.list) DO (  
	echo Extracting tag: %%i
	generate.vbs %total_days% %%i
	set tagname=%%i
	set tagname=!tagname: =_!
	call !tagname!.bat 
)