Import-Module oh-my-posh
Set-PoshPrompt -Theme the-ancient-owl

Import-Module PSColor

Set-PSReadLineOption -PredictionSource History

Set-Alias -Name touch -Value New-Item

Set-Alias -Name python -Value py
Set-Alias -Name winget -Value winget.exe