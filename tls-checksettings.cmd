:: Current Ciper Suites Configuration
:: Defaults & supported list for each version of Windows: https://docs.microsoft.com/en-us/windows/desktop/SecAuthN/cipher-suites-in-schannel
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "& Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\Cryptography\Configuration\Local\SSL\00010002\ -Name Functions | Select-Object -ExpandProperty Functions"

:: Cipher Suites configuration - When configured by group policy
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "& Get-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\0010002\ -Name Functions | Select-Object -ExpandProperty Functions"

:: Ensure TLS 1.2 is enabled. It should be "not set" on >Win7. On Win7 it needs to be explicitly enabled
reg query "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v Enabled
reg query "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v DisabledByDefault
reg query "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server" /v Enabled
reg query "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server" /v DisabledByDefault

:: .NET Framework Registry keys to opt-in to SystemDefaultTlsVersions behavior, instead of Ssl3|Tls1
reg query "HKLM\SOFTWARE\Microsoft\.NETFramework\v2.0.50727" /v SystemDefaultTlsVersions /reg:64
reg query "HKLM\SOFTWARE\Microsoft\.NETFramework\v2.0.50727" /v SystemDefaultTlsVersions /reg:32
reg query "HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319" /v SystemDefaultTlsVersions /reg:64
reg query "HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319" /v SystemDefaultTlsVersions /reg:32
reg query "HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319" /v SchUseStrongCrypto /reg:64
reg query "HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319" /v SchUseStrongCrypto /reg:32

:: On Win7, WinHttp will also need to have TLS 1.2 enabled for IE and other apps to be able to use TLS 1.2
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v DefaultSecureProtocols /reg:64
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v DefaultSecureProtocols /reg:32
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings /v SecureProtocols /reg:64
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings /v SecureProtocols /reg:32
