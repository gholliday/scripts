# Uses Microsoft.Update.Searcher COM to 'Check for Windows Updates' and install them in one step
#
# Also displays the pending updates in an Out-GridView so you can see what's going to be downloaded and installed
#
# I've found this useful in two situations:
#   1) There's a critical vulnerability (e.g. WannaCry) and you want a simple way to install all available updates
#   2) On brand new VMs that have lots of updates to install. Avoiding waiting for 'Checking for updates' before clicking 'Install updates'
#
$ErrorActionPreference = "Stop"
try {
	Set-PSDebug -Trace 1
	$Criteria = "IsInstalled=0 and Type='Software'";
	$Searcher = New-Object -ComObject Microsoft.Update.Searcher;
	$SearchResult = $Searcher.Search($Criteria).Updates;
	$SearchResult | Sort-Object MsrcSeverity, MaxDownloadSize -Descending | Select-Object Title, MsrcSeverity, MaxDownloadSize, SupportUrl, Description | Out-GridView
	$Session = New-Object -ComObject Microsoft.Update.Session;
	$Downloader = $Session.CreateUpdateDownloader();
	$Downloader.Updates = $SearchResult;
	$Downloader.Download();
	$Installer = New-Object -ComObject Microsoft.Update.Installer;
	$Installer.Updates = $SearchResult;
	$Result = $Installer.Install();
}
finally
{
	Set-PSDebug -Trace 0
}