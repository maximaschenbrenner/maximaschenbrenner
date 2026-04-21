 <#
.SYNOPSIS
    This PowerShell script disables "Always install with elevated privileges" feature.
.NOTES
    Author          : Maxim Aschenbrenner
    LinkedIn        : linkedin.com/in/aschenbrenner-maxim
    GitHub          : github.com/maximaschenbrenner
    Date Created    : 2026-04-21
    Last Modified   : 2026-04-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000315.ps1 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer\"
$valueName = "AlwaysInstallElevated"
$valueData = 0  # 0x00000000 in hexadecimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the AlwaysInstallElevated value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."