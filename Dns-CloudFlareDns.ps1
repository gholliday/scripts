# Set WiFi DNS to '1.1.1.1', '1.0.0.1' (CloudFlare's public DNS servers)
# Useful for when you don't want to use the DNS servers provided by DHCP
Get-NetIPInterface | ? { $_.ConnectionState -eq 'Connected' -and $_.AddressFamily -eq 'IPv4' -and $_.InterfaceAlias -eq 'Wi-Fi' } | Set-DnsClientServerAddress -ServerAddresses @('1.1.1.1', '1.0.0.1')
