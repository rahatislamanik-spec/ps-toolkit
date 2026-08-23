<#
.SYNOPSIS
    Classifies memory usage into a status label.
.DESCRIPTION
    Takes a used-memory percentage and returns OK, Warning, or Critical.
    Pure function, deterministic, easy to test.
.PARAMETER UsedPercent
    Percentage of memory in use (0-100).
.EXAMPLE
    Get-MemoryStatus -UsedPercent 75
    Returns: Warning
#>
function Get-MemoryStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange(0, 100)]
        [int]$UsedPercent
    )

    if ($UsedPercent -ge 90) {
        return 'Critical'
    }
    elseif ($UsedPercent -ge 70) {
        return 'Warning'
    }
    else {
        return 'OK'
    }
}
