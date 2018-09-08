:: Configure a machine for S mode (locked down). Reboot required.
:: https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-codeintegrity-skupolicyrequired 
::
reg add HKLM\System\CurrentControlSet\Control\CI\Policy /v SkuPolicyRequired /t REG_DWORD /d 1 /f
pause