Write-Host ">> Removing bloat apps" -ForegroundColor darkcyan

Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage -AllUsers
Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage -AllUsers
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *officehub* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
Get-AppxPackage *solitairecollection* | Remove-AppxPackage
Get-AppxPackage *bingfinance* | Remove-AppxPackage
Get-AppxPackage *people* | Remove-AppxPackage
Get-AppxPackage *windowsphone* | Remove-AppxPackage
Get-AppxPackage *xboxapp* | Remove-AppxPackage

Write-Host ">> Bloat apps removed" -ForegroundColor green
