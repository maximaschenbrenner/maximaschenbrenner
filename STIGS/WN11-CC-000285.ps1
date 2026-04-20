 <#
.SYNOPSIS
    This PowerShell script ensures that the The Remote Desktop Session Host requires secure RPC communications.

.NOTES
    Author          : Maxim Aschenbrenner
    LinkedIn        : linkedin.com/in/aschenbrenner-maxim
    GitHub          : github.com/maximaschenbrenner
    Date Created    : 2026-04-20
    Last Modified   : 2026-04-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000285

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000285.ps1 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\"
$valueName = "fEncryptRPCTraffic"
$valueData = 1  # 0x00000001 in hexadecimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the fEncryptRPCTraffic value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."