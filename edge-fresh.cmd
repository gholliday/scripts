:: There are two types of people in this world:
::   A) Those who never want to lose a tab
::   B) Those who like a clean slate every time they open a browser
::
:: I'm a (B) person, so when Edge crashes and it wants to helpfully restore all my tabs,
:: this script gives me a fresh edge.
rmdir /s/q %localappdata%\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\User\Default\Recovery\Active
start shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge