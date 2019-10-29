$currentLocation = (Get-Location).Path
if ([bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544") -eq $false) {
    Start-Process powershell.exe "cd '$currentLocation';.\setup.ps1" -Verb RunAs
    return
}

$osDisk = "C:"
$windowsJumpDir = $osDisk + "\windows-jump"
$jumpMapPath = $windowsJumpDir + "\jumpmap"

if((Test-Path $windowsJumpDir) -eq $false) {
    mkdir $windowsJumpDir
}

cp j.bat $windowsJumpDir
cp jp.ps1 $windowsJumpDir

if((Test-Path $jumpMapPath) -eq $false) {
    cp jumpmap $windowsJumpDir
}

$path = (Get-ChildItem Env:Path).Value + "$windowsJumpDir;"
[System.Environment]::SetEnvironmentVariable("Jump_Map", $jumpMapPath, [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable("Path", $path, [System.EnvironmentVariableTarget]::Machine)
