# Toggle Resolution

A PowerShell utility to quickly toggle between high and low display resolutions using keyboard shortcuts.

## Features

- Toggle between 5120x1440 and 2560x1440 resolutions
- Customizable keyboard shortcuts (default: Ctrl+Alt+R)
- Hidden execution window for seamless operation
- Desktop shortcut creation with hotkey support

## Requirements

- Windows PowerShell
- [NirCmd](https://www.nirsoft.net/utils/nircmd.html) (included in `nircmd-x64` folder)

## Installation

1. Clone or download this repository
2. Run the shortcut creation script:
   ```powershell
   .\Create-Shortcut.ps1
   ```
3. A desktop shortcut will be created with the default Ctrl+Alt+R hotkey

## Usage

### Creating a Shortcut
```powershell
# Default hotkey (Ctrl+Alt+R)
.\Create-Shortcut.ps1

# Custom hotkey
.\Create-Shortcut.ps1 -HotKey "Ctrl+Shift+T"
```

### Manual Execution
```powershell
# Default resolutions (5120x1440 ↔ 2560x1440)
.\Toggle-Resolution.ps1

# Custom resolutions
.\Toggle-Resolution.ps1 -HighWidth 3840 -HighHeight 2160 -LowWidth 1920 -LowHeight 1080

# Custom color depth
.\Toggle-Resolution.ps1 -ColorDepth 24
```

## Configuration

The script accepts the following parameters:
- `-HighWidth` (default: 5120) - High resolution width
- `-HighHeight` (default: 1440) - High resolution height  
- `-LowWidth` (default: 2560) - Low resolution width
- `-LowHeight` (default: 1440) - Low resolution height
- `-ColorDepth` (default: 32) - Color depth for both resolutions

## Files

- `Toggle-Resolution.ps1` - Main resolution toggle script
- `Create-Shortcut.ps1` - Creates desktop shortcut with hotkey
- `nircmd-x64/` - NirCmd utility folder

## License

This project is released under the MIT License.