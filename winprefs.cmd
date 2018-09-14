:: This is a script that I use to configure my machines just the way that I like them.
:: https://github.com/gholliday/scripts/
::
:: Many of these settings originate from Aaron Horler's work at
:: https://github.com/aghorler/Windows-10-Hardening/blob/master/components/group_policy.bat
::
:: Disclaimers:
::   * Don't run scripts from strangers without taking the time to understand what they do.
::   * You need to run most of these as admin.
::   * These are my personal preferences. They don't reflect a recommendation from myself or my employer.
::   * Things may break if you use these settings, be prepared for that. (e.g. I like to disable TLS 1.0/1.1)
::

:: General - Hide "People" bar in File Explorer. I don't use it.
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d 1 /f

:: Disable ad customization. Apps can't use the ID for experiences across apps.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f

:: Disable web search in search bar. I use a browser to search the web instead.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /t REG_DWORD /d 1 /f

:: Disable search web when searching pc
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f

:: Disable search indexing of encrypted files
:: https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-search#search-allowindexingencryptedstoresoritems
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowIndexingEncryptedStoresOrItems /t REG_DWORD /d 0 /f

:: Disable location based info in searches
:: https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-search#search-allowsearchtouselocation
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f

:: Disable language detection
:: https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-search#search-alwaysuseautolangdetection
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AlwaysUseAutoLangDetection /t REG_DWORD /d 0 /f

:: Privacy - Disable lockscreen app notifications.
:: App notifications that are displayed on the lock screen could display sensitive information
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLockScreenAppNotifications" /t REG_DWORD /d 1 /f

:: Security - Disable Autorun
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f

:: Privacy - Disable location and sensors.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d 1 /f

:: Edge - Privacy - Prevent data collection in Edge, and generally improve privacy
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "PreventLiveTileDataCollection" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableMFUTracking" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableRecentApps" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v "TurnOffBackstack" /t REG_DWORD /d 1 /f

:: Edge - Security option - Enable Edge phising filter.
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 1 /f

:: Edge - General - Disable help prompt in Edge UI.
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableHelpSticker" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /v "DisableHelpSticker" /t REG_DWORD /d 1 /f

:: Edge - Privacy - Disable search suggestions in Edge.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" /v "ShowSearchSuggestionsGlobal" /t REG_DWORD /d 0 /f

:: Disable system restore. I don't use it. If my machine is broken enough that I need it, I'll rebuild.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableConfig" /t "REG_DWORD" /d "1" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR " /t "REG_DWORD" /d "1" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableConfig" /t "REG_DWORD" /d "1" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableSR " /t "REG_DWORD" /d "1" /f

:: Disable xbox game bar. I don't use it, and I don't want it showing when I accidentally hit Win+G
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t "REG_DWORD" /d "0" /f
REG ADD "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t "REG_DWORD" /d "0" /f

:: Disable Windows Tips.
REG ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t "REG_DWORD" /d "1" /f
REG ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t "REG_DWORD" /d "1" /f
REG ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t "REG_DWORD" /d "1" /f
REG ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t "REG_DWORD" /d "1" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoNewAppAlert" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d 1 /f 

:: Disabling Ads and Suggestions
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "SystemPaneSuggestionsEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "SoftLandingEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "RotatingLockScreenEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "RotatingLockScreenOverlayEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "SystemPaneSuggestionsEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "PreInstalledAppsEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "PreInstalledAppsEverEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "OEMPreInstalledAppsEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v "ShowSyncProviderNotifications" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "SilentInstalledAppsEnabled" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "ContentDeliveryAllowed" /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /t REG_DWORD /v "SubscribedContentEnabled" /d 0 /f

:: Open pictures with photo viewer
REG ADD "HKEY_CURRENT_USER\Software\Classes\.jpg" /ve /t "REG_SZ" /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\.jpeg" /ve /t "REG_SZ" /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\.gif" /ve /t "REG_SZ" /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\.png" /ve /t "REG_SZ" /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\.bmp" /ve /t "REG_SZ" /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\.tiff" /ve /t "REG_SZ" /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKEY_CURRENT_USER\Software\Classes\.ico" /ve /t "REG_SZ" /d "PhotoViewer.FileAssoc.Tiff" /f

:: Security - Do not hide extensions for know file types.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt" /v "CheckedValue" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

:: File Explorer - This PC instead of Quick Access
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

:: Privacy - Do not show recently or frequently accessed files in Quick access (Explorer).
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f

:: Privacy - Disable tailored experiences with diagnostic data.
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f

:: Remove all AppX Programs except the ones that I use
start /wait C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& Get-AppxPackage | ? { $_.Name -ne 'PaloAltoNetworks.GlobalProtect' -and $_.Name -ne 'Microsoft.Office.OneNote' -and $_.Name -ne 'Microsoft.Windows.Photos' -and $_.Name -ne 'Microsoft.WindowsCalculator' -and $_.Name -ne 'Microsoft.WindowsStore' -and $_.Name -ne '37833NikRolls.uBlockOrigin' -and $_.Name -ne '22324SteveMiller.PureText' } | Remove-AppxPackage"

:: Keep them removed during upgrades
:: https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingWeather_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.GetHelp_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Getstarted_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Microsoft3DViewer_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MSPaint_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.OneConnect_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.People_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Print3D_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.SkypeApp_kzf8qxf38zg5c" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.StorePurchaseApp_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Wallet_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsAlarms_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsCamera_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\microsoft.windowscommunicationsapps_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsMaps_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Xbox.TCUI_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxApp_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxGameOverlay_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ZuneMusic_8wekyb3d8bbwe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ZuneVideo_8wekyb3d8bbwe" /f

:: Unpin everything from start menu
start /wait C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{1}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from Start'} | %{$_.DoIt()}"

:: Sync your settings: Language preferences. mm/dd/yyyy is evil.
:: Date, Time, and Region: 24-hour clock, time zone, region format, etc
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v Enabled /t REG_DWORD /d 1 /f

:: IE - Set home page to about:blank for faster loading
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "about:blank" /f
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Geolocation" /v "PolicyDisableGeolocation" /t REG_DWORD /d 1 /f

:: General - Force enable HTTP/2 in Internet Explorer.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnableHTTP2" /t REG_DWORD /d 1 /f

:: IE - Disable 'Default Browser' check
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main" /v Check_Associations /t REG_SZ /d "no" /f

:: IE - Disable Password Caching [Disable Remember Password]
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v DisablePasswordCaching /t REG_DWORD /d 1 /f

:: Snap - Disable "Window Snap" Automatic Window Arrangement
REG DELETE "HKEY_CURRENT_USER\Control Panel\Desktop" /v WindowArrangementActive /f

:: Snap - Disable automatic fill to space on Window Snap
::REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SnapFill /t REG_DWORD /d 0 /f
REG DELETE "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SnapFill /f

:: Snap - Disable showing what can be snapped next to a window
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SnapAssist /t REG_DWORD /d 0 /f

:: Snap - Disable automatic resize of adjacent windows on snap
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v JointResize /t REG_DWORD /d 0 /f

:: Disable auto-correct
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\TabletTip\1.7" /v EnableAutocorrection /t REG_DWORD /d 0 /f

:: Install Telnet client
pkgmgr /iu:"TelnetClient"

:: Skype for Business options
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\Lync /t REG_DWORD /v EnableSIPHighSecurityMode /d 0 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\Lync /t REG_DWORD /v EnableAppearOffline /d 1 /f

:: Outlook - Open replies and forwards in a new window
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Message /v DisableReadingPaneCompose /t REG_DWORD /d 1 /f

:: Disable Office apps Start screen & What's new popups
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\General /v DisableBootToOfficeStart /t REG_DWORD /d 1 /f
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\Common\WhatsNew /v SuppressForAutomation /t REG_DWORD /d 1 /f

:: Disable AutoSave to OneDrive/Sharepoint on by default
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Word /v DontAutoSave /t REG_DWORD /d 1 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Excel /v DontAutoSave /t REG_DWORD /d 1 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Powerpoint /v DontAutoSave /t REG_DWORD /d 1 /f

:: Enable Outlook QueryBuilder so I can use "OR" in Outlook Rules.
:: https://www.slipstick.com/outlook/using-query-builder/
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook\QueryBuilder /f

:: Disable Outlook notifications/interruptions. Why don't these settings roam yet?
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Preferences /v ChangePointer /t REG_DWORD /d 0 /f
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Preferences /v NewmailDesktopAlerts /t REG_DWORD /d 0 /f
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Preferences /v PlaySound /t REG_DWORD /d 0 /f
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Preferences /v ShowEnvelope /t REG_DWORD /d 0 /f

:: Copy PowerShell Profile
xcopy /s /y %~dp0Microsoft.PowerShell_profile.ps1 "%USERPROFILE%\Documents\WindowsPowerShell\"

:: Enable Credential Guard
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LsaCfgFlags /t REG_DWORD /d 1 /f

:: Disable TLS 1.0 & TLS 1.1.
:::::::::::::::::::::::::::::::: Warning ::::::::::::::::::::::::::::::::
:: This will break anything that does not support TLS 1.2. Mostly .NET apps. See SystemDefaultTlsVersions
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" /v Enabled /f /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" /v Enabled /f /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client" /v Enabled /f /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" /v Enabled /f /t REG_DWORD /d 0

:: Add .NET SystemDefaultTlsVersions back compat flag so that .NET <4.7 apps can use TLS 1.2
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v2.0.50727 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:64
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v2.0.50727 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:32
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:64
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319 /v SystemDefaultTlsVersions /t REG_DWORD /d 1 /f /reg:32

pause
