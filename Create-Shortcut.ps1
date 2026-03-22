# Create-Shortcut.ps1
# Creates a desktop shortcut for Toggle-Resolution.ps1 with customizable hotkey

param(
    [string]$HotKey = "Ctrl+Alt+R"
)

$ErrorActionPreference = 'Stop'

# Get paths
$scriptPath = "$PSScriptRoot\Toggle-Resolution.ps1"

if (-not (Test-Path $scriptPath)) {
    throw "Toggle-Resolution.ps1 not found at '$scriptPath'."
}
$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$shortcutPath = "$desktopPath\Toggle-Resolution.lnk"

# Create WScript.Shell COM object
$shell = New-Object -ComObject WScript.Shell

# Create the shortcut
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$scriptPath`""
$shortcut.WorkingDirectory = $PSScriptRoot
$shortcut.Description = "Toggle between high and low resolution"
$shortcut.HotKey = $HotKey
$shortcut.IconLocation = "powershell.exe,0"

# Save the shortcut
$shortcut.Save()

Write-Host "Desktop shortcut created: $shortcutPath"
Write-Host "Hotkey: $HotKey"