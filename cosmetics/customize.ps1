function Start-App {
  param (
    $AppName,
    $AppPath
  )
  
  if (!(Get-Process -Name $AppName -ErrorAction SilentlyContinue)) {
    Start-Process -FilePath $AppPath
  }  
  
}

Start-App -AppName "Rainmeter" -AppPath "C:\Users\TheAncientOwl\Code\powershell\code-misc\cosmetics\Rainmeter.lnk"
Start-App -AppName "ModernFlyoutsHost" -AppPath "C:\Users\TheAncientOwl\Code\powershell\code-misc\cosmetics\ModernFlyouts.lnk"

function Restart-App {
  param (
    $AppName,
    $AppPath
  )
  
  if (Get-Process -Name $AppName -ErrorAction SilentlyContinue) {
    Stop-Process -Name $AppName  
  }  
  
  Start-Process -FilePath $AppPath
}

Restart-App -AppName "TranslucentTB" -AppPath "C:\Users\TheAncientOwl\Code\powershell\code-misc\cosmetics\TranslucentTB.lnk"
