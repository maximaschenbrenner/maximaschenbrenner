 <#
.SYNOPSIS
    This PowerShell script ensures that the number of allowed bad logon attempts is configured to three. Requires elevated privileges to run.

.NOTES
    Author          : Maxim Aschenbrenner
    LinkedIn        : linkedin.com/in/aschenbrenner-maxim
    GitHub          : github.com/maximaschenbrenner
    Date Created    : 2026-04-20
    Last Modified   : 2026-04-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-AC-000010.ps1 
#>

# Define the bad logon threshold
$threshold = 3

# Check for elevated privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script must be run with elevated privileges. Please run as administrator." -ForegroundColor Red
    exit
}

# Set the fEncryptRPCTraffic value
net accounts /lockoutthreshold:$threshold

# Output success message
Write-Host "Bad logon threshold set to $threshold."