Option Explicit

Dim strNumericalKeyID 
 Dim strManageBDE,strManageBDE2 
 Dim oShell 
 Dim StrPath 
 Dim StdOut, strCommand 
 Dim Result, TPM, strLine 
 Dim Flag, NumericalKeyID

Set oShell = CreateObject("WSCript.Shell")

'==================================================================================== 
 'This section looks for the Bitlocker Key Numerical ID

strManageBDE = "Manage-BDE.exe -protectors -get c:" 'Bitlocker command to gather the ID

Flag = False

Set Result = oShell.Exec(strManageBDE)'sees the results and places it in Result

Set TPM = Result.StdOut    'Sets the variable TPM to the output if the strManageBDe command

While Not TPM.AtEndOfStream 
    strLine = TPM.ReadLine  'Sets strLine 
    If InStr(strLine, "Numerical Password:") Then  ' This section looks for the Numerical Password 
     Flag = True 
    End If 
    If Flag = True Then 
      If InStr(strLine, "ID:") Then  'This section looks for the ID 
       NumericalKeyID = Trim(strLine)' This section trims the empty spaces from the ID {} line 
       NumericalKeyID = Right(NumericalKeyID, Len(NumericalKeyID)-4) 
       Flag = False 'Stops the other lines from being collected 
      End If 
    End If 
 Wend

strManageBDE2 = "Manage-BDE.exe -protectors -adbackup C: -ID " & NumericalKeyID 
 oShell.Run strManageBDE2, 0, True 'Runs the Manage-bde command to move the numerical ID to AD.
