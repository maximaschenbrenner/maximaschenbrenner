 <#
.SYNOPSIS
    This PowerShell script renames the guest user account. (Requires elevated privileges to run.)

.NOTES
    Author          : Maxim Aschenbrenner
    LinkedIn        : linkedin.com/in/aschenbrenner-maxim
    GitHub          : github.com/maximaschenbrenner
    Date Created    : 2026-04-21
    Last Modified   : 2026-04-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000025

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-SO-000025.ps1 
#>
# Define the new name for the guest account
$NewName = "SvcGuestDisabled"

# Check for elevated privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script must be run with elevated privileges. Please run as administrator." -ForegroundColor Red
    exit
}

# Get the guest account and check if it exists and is not already renamed
$guest = Get-LocalUser | Where-Object { $_.SID.Value -match '-501$' }

if (-not $guest) {
    Write-Error "Built-in Guest account not found."
    exit 1
}

if ($guest.Name -ieq $NewName) {
    Write-Host "Guest account is already renamed to $NewName"
    exit 0
}

# Rename the guest account and output success message
Rename-LocalUser -SID $guest.SID -NewName $NewName
Write-Host "Renamed built-in Guest account from '$($guest.Name)' to '$NewName'"