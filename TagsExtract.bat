:: Copyright 2016 Meir Tseitlin

:: Licensed under the Apache License, Version 2.0 (the "License");
:: you may not use this file except in compliance with the License.
:: You may obtain a copy of the License at

:: <http://www.apache.org/licenses/LICENSE-2.0>

:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS,
:: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
:: See the License for the specific language governing permissions and
:: limitations under the License.

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