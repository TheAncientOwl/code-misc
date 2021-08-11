Write-Host ">> Fixing wifi" -ForegroundColor darkcyan

Write-Host ">> release" -ForegroundColor green
ipconfig /release

Write-Host ">> flush" -ForegroundColor green
ipconfig /flushdns

Write-Host ">> renew" -ForegroundColor green
ipconfig /renew

Write-Host ">> Wifi fixed" -ForegroundColor green