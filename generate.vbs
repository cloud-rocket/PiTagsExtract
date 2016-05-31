' Copyright 2016 Meir Tseitlin

' Licensed under the Apache License, Version 2.0 (the "License");
' you may not use this file except in compliance with the License.
' You may obtain a copy of the License at

' <http://www.apache.org/licenses/LICENSE-2.0>

' Unless required by applicable law or agreed to in writing, software
' distributed under the License is distributed on an "AS IS" BASIS,
' WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
' See the License for the specific language governing permissions and
' limitations under the License.

if WScript.Arguments.Count < 2 then  
    WScript.Echo "Missing parameters"  
  
else  
  
' Define Constants  
  
  Const ForWriting = 2  
  Const ForReading = 1  
  
' Filesystem Objects  
  
  Set objShell = CreateObject("WScript.shell")  
  strCurrDir = objShell.CurrentDirectory  
  
  Dim objFSO, objFSOText, objFolder, batFile, outFile  
  
  Set objFSO = CreateObject("Scripting.FileSystemObject")  
  
  totalDays = WScript.Arguments(0)
  
' Tags  
  tagName = WScript.Arguments(1)
  tagSymbol = WScript.Arguments(1)
  for arg = 2 to WScript.Arguments.Count - 1
	tagName = tagName + " " + WScript.Arguments(arg)  
	tagSymbol = tagSymbol + "_" + WScript.Arguments(arg)  
  next
  
  Set batFile = objFSO.OpentextFile(strCurrDir & "\" & tagSymbol & ".bat", ForWriting, True)  
  
  Set outFile = objFSO.OpentextFile(strCurrDir & "\" & tagSymbol & "_" & strDate & ".params", ForWriting, True)  
  
  outFile.Writeline "@table piarc"  
  outFile.Writeline "@mode list"  
  outFile.Writeline "@output out\" & tagSymbol & ".csv"  
  outFile.Writeline "@timf 9"  
  outFile.Writeline "@sigd 9"  
  outFile.Writeline "@istru tag, starttime, endtime"  
  outFile.Writeline "@ostru time, value"  
  outFile.Writeline "@echo none"  
  outFile.Writeline "@ostru ..."  
  outFile.Writeline tagName & "," & "-"& totalDays &"d, "
  outFile.Writeline "@ends"  
  
  outFile.Close  
  
  ' batFile.WriteLine "c:\Progra~1\PI\adm\piconfig < " & tagSymbol & "_" & strDate & ".params"  
  batFile.WriteLine """%piserver%adm\piconfig.exe"" < " & tagSymbol & "_" & strDate & ".params"  
  
  ' I ZIP THE FILES AFTER EXTRACTING DATA, MAKE SURE WZZIP EXISTS AND IS IN PATH VARIABLES  
  
  ' batFile.WriteLine "wzzip " & tagSymbol & ".zip" & " *.CSV"  
  batFile.WriteLine "del *.params /f"  
  ' batFile.WriteLine "del *.csv /f"  
  batFile.WriteLine "del " & tagSymbol & ".bat"  
  
  batFile.Close  
  
end if  