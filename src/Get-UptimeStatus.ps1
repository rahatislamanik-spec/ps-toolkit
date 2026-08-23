<#
.SYNOPSIS
    Classifies system uptime into a maintenance recommendation.
.DESCRIPTION
    Takes uptime in days and returns a status label. Pure function
    (no system calls) so it is deterministic and easy to test.
.PARAMETER UptimeDays
    The number of days the system has been running (0 or greater).
.EXAMPLE
    Get-UptimeStatus -UptimeDays 45
    Returns: RebootRecommended
#>
function Get-UptimeStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange(0, [int]::MaxValue)]
        [int]$UptimeDays
    )

    if ($UptimeDays -ge 30) {
        return 'RebootRecommended'
    }
    elseif ($UptimeDays -ge 14) {
        return 'Monitor'
    }
    else {
        return 'Healthy'
    }
}
