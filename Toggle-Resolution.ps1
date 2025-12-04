
# ToggleResolution-NirCmd.ps1
# Requires NirCmd (https://www.nirsoft.net/utils/nircmd.html)

param(
    [int]$HighWidth = 5120,
    [int]$HighHeight = 1440,
    [int]$LowWidth = 2560,
    [int]$LowHeight = 1440,
    [int]$ColorDepth = 32
)

# Path to NirCmd executable
$nircmdPath = "$PSScriptRoot\nircmd-x64\nircmd.exe"

# Define target resolutions
$resHigh = @{ Width = $HighWidth; Height = $HighHeight; ColorDepth = $ColorDepth }
$resLow  = @{ Width = $LowWidth; Height = $LowHeight; ColorDepth = $ColorDepth }

# Get current resolution using Win32_VideoController
# Filter for controllers with valid resolution data (active displays)
$video = Get-CimInstance Win32_VideoController | 
    Where-Object { $_.CurrentHorizontalResolution -ne $null -and $_.CurrentVerticalResolution -ne $null } | 
    Select-Object -First 1
$currentWidth = $video.CurrentHorizontalResolution
$currentHeight = $video.CurrentVerticalResolution

Write-Host "Current resolution: $currentWidth x $currentHeight"

# Toggle logic
if ($currentWidth -eq $resHigh.Width -and $currentHeight -eq $resHigh.Height) {
    Write-Host "Switching to $($resLow.Width) x $($resLow.Height)..."
    Start-Process $nircmdPath -ArgumentList "setdisplay $($resLow.Width) $($resLow.Height) $($resLow.ColorDepth)"
} else {
    Write-Host "Switching to $($resHigh.Width) x $($resHigh.Height)..."
    Start-Process $nircmdPath -ArgumentList "setdisplay $($resHigh.Width) $($resHigh.Height) $($resHigh.ColorDepth)"
}
