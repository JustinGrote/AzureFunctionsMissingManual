using namespace System.Diagnostics.CodeAnalysis
Describe 'TestDefaultSample' -Tag E2E {
    BeforeAll {
        try {
            Get-Process func -ErrorAction stop | Out-Null
        } catch {
            throw 'Azure Functions Tools (func.exe) is not running. Run the task stupid!'
        }
        $baseUri = 'http://localhost:7071/api/'
        $functionName = 'DefaultHttpTriggerSample'
        $functionUri = $baseUri + $functionName
    }
    It 'Works with no parameter' {
        $result = Invoke-RestMethod -Uri $functionUri
        $result | Should -BeLike 'This HTTP Triggered function executed successfully*'
    }
    It 'Works with a query string' {
        $result = Invoke-RestMethod -Uri $functionUri -Method GET -Body @{Name = 'FaintingGoat' }
        $result | Should -BeLike 'Hello, FaintingGoat*'
    }
    It 'Works with a JSON body' {
        $result = Invoke-RestMethod -Uri $functionUri -Method GET -Body (@{Name = 'FaintingGoat' } | ConvertTo-Json)
        $result | Should -BeLike 'Hello, FaintingGoat*'
    }
    It 'Works if the name is PowershellSummit' {
        $result = Invoke-RestMethod -Uri $functionUri -Method GET -Body @{Name = 'PowershellSummit' }
        $result | Should -BeLike 'Hello, PowershellSummit*'
    }
}
