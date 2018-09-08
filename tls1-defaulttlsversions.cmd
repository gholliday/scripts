reg add HKLM\SOFTWARE\Microsoft\.NETFramework\v2.0.50727 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:64
reg add HKLM\SOFTWARE\Microsoft\.NETFramework\v2.0.50727 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:32
reg add HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:64
reg add HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:32
pause