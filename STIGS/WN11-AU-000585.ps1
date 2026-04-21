 <#
.SYNOPSIS
    This PowerShell script enables PowerShell Script Block Logging.

.NOTES
    Author          : Maxim Aschenbrenner
    LinkedIn        : linkedin.com/in/aschenbrenner-maxim
    GitHub          : github.com/maximaschenbrenner
    Date Created    : 2026-04-21
    Last Modified   : 2026-04-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000585

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-AU-000585.ps1 
#>

# Set Policy to audit process creation events for both success and failure
auditpol /set /subcategory:"Process Creation" /success:enable /failure:enable

# Output success message
Write-Host "Process creation auditing enabled for both success and failure."
