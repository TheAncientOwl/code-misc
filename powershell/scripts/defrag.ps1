Write-Host ">> Defrag started" -ForegroundColor darkcyan

Optimize-Volume -DriveLetter C -ReTrim

Write-Host ">> Defrag finished" -ForegroundColor green