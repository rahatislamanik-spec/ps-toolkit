BeforeAll {
    . "$PSScriptRoot/../src/Get-UptimeStatus.ps1"
}

Describe 'Get-UptimeStatus' {
    It 'returns Healthy below 14 days' {
        Get-UptimeStatus -UptimeDays 5 | Should -Be 'Healthy'
    }

    It 'returns Monitor between 14 and 29 days' {
        Get-UptimeStatus -UptimeDays 20 | Should -Be 'Monitor'
    }

    It 'returns RebootRecommended at 30 days or more' {
        Get-UptimeStatus -UptimeDays 45 | Should -Be 'RebootRecommended'
    }
}
