if (!(Get-Process -Name spotify)) {
  Start-Process -FilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Spotify.lnk"
}

wsl code ~/dev/pensiune-leresti/

Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList "http://localhost:3000/"
