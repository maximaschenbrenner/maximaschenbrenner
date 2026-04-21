 <#
.SYNOPSIS
    This PowerShell script disables Internet Explorer 11 as a standalone browser.

.NOTES
    Author          : Maxim Aschenbrenner
    LinkedIn        : linkedin.com/in/aschenbrenner-maxim
    GitHub          : github.com/maximaschenbrenner
    Date Created    : 2026-04-21
    Last Modified   : 2026-04-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000391

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000391.ps1 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main"
$valueName = "NotifyDisableIEOptions"
$valueData = 0  # 0x00000000 in hexadecimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the NotifyDisableIEOptions value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."