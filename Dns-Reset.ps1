# Reset DNS Servers to the DHCP-provided ones
Get-NetIPInterface | ? { $_.ConnectionState -eq 'Connected' -and $_.AddressFamily -eq 'IPv4' -and $_.InterfaceAlias -eq 'Wi-Fi' } | Set-DnsClientServerAddress -ResetServerAddresses

