Describe 'CreateUser' -Tag Integration {
    BeforeAll {
        Import-Module $PSScriptRoot/../AzureFunctionsMissingManual.psm1 -Force
    }
    It 'Works with <Name>' {
        CreateUser -Name $Name
        | Select-Object -Last 1
        | Should -BeLike "$Name completed!*"
    } -TestCases @(
        @{Name = '$(Arbitrary Code Injection)' }
        @{Name = 'Pester' }
        @{Name = 'Test1' }
        @{Name = 'Test@#$)(*@#$J)(1' }
    )
}
