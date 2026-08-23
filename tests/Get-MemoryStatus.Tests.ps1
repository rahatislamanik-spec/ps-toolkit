BeforeAll {
    . "$PSScriptRoot/../src/Get-MemoryStatus.ps1"
}

Describe 'Get-MemoryStatus' {
    It 'returns OK below 70 percent' {
        Get-MemoryStatus -UsedPercent 50 | Should -Be 'OK'
    }

    It 'returns Critical at 90 percent or above' {
        Get-MemoryStatus -UsedPercent 95 | Should -Be 'Critical'
    }

    It 'returns Warning at 75 percent' {
        Get-MemoryStatus -UsedPercent 75 | Should -Be 'Warning'
    }
}
