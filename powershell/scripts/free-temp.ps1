Write-Host ">> Cleaning temp files" -ForegroundColor darkcyan

$paths = @('C:\Windows\Temp\*', 
          'C:\Users\THEANC~1\AppData\Local\Temp\*');

Foreach ($path in $paths)
{
  Remove-Item -Path $path -Force -Recurse -ErrorAction SilentlyContinue
}

Write-Host ">> Temp files cleaned" -ForegroundColor green