Import-Module oh-my-posh
Set-PoshPrompt -Theme the-ancient-owl-blue-lightning

# Import-Module PSColor
Import-Module Terminal-Icons

Set-PSReadLineOption -PredictionSource History

Set-Alias -Name touch -Value New-Item

Set-Alias -Name python -Value py
Set-Alias -Name winget -Value winget.exe
