BeforeAll {
    . "$PSScriptRoot/../src/Get-DiskSpaceStatus.ps1"
}

Describe 'Get-DiskSpaceStatus' {
    It 'returns Critical when free space is below 10%' {
        Get-DiskSpaceStatus -FreePercent 5 | Should -Be 'Critical'
    }

    It 'returns Warning when free space is between 10% and 24%' {
        Get-DiskSpaceStatus -FreePercent 20 | Should -Be 'Warning'
    }

    It 'returns OK when free space is 25% or above' {
        Get-DiskSpaceStatus -FreePercent 60 | Should -Be 'OK'
    }

    It 'treats the boundary at 10 as Warning' {
        Get-DiskSpaceStatus -FreePercent 10 | Should -Be 'Warning'
    }
}
