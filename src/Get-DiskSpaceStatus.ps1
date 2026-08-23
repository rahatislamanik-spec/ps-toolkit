<#
.SYNOPSIS
    Evaluates free disk space and returns a status label.
.DESCRIPTION
    Takes a free-space percentage and classifies it as OK, Warning, or Critical.
    Pure function (no system calls) so it is deterministic and easy to test.
.PARAMETER FreePercent
    The percentage of free disk space (0-100).
.EXAMPLE
    Get-DiskSpaceStatus -FreePercent 45
    Returns: OK
#>
function Get-DiskSpaceStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange(0, 100)]
        [int]$FreePercent
    )

    if ($FreePercent -lt 10) {
        return 'Critical'
    }
    elseif ($FreePercent -lt 25) {
        return 'Warning'
    }
    else {
        return 'OK'
    }
}
