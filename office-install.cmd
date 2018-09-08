:: This configuration will install Office and configure updates for 'Monthly Channel (Targeted)'
:: This update channel provides an early look at the upcoming Monthly Channel release.
:: It is a supported update channel, and usually is available at least one week ahead of time
:: when it's a Monthly Channel release that contains new features.
:: https://docs.microsoft.com/en-us/deployoffice/overview-of-update-channels-for-office-365-proplus
::
:: You'll need to download the Office Deployment Tool from https://go.microsoft.com/fwlink/p/?LinkID=626065
:: And put setup.exe in the same folder as this script, renamed to office-setup.exe
"%~dp0office-setup.exe" /configure "%~dp0office-configuration.xml"

pause