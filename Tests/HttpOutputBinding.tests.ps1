Describe 'TestHttpOutputBinding' {
    BeforeAll {
        $baseUri = 'http://localhost:7071/api/'
    }
    It 'Works with no parameter' {
        $result = Invoke-RestMethod -Uri ($baseUri + 'PushHttpOutputBindingDemo')
        $result | Should -BeLike 'This HTTP Triggered function executed successfully*'
    }
    It 'Works with a parameter' {
        $result = Invoke-RestMethod -Uri ($baseUri + 'PushHttpOutputBindingDemo') -Method GET -Body '{"name":"FaintingGoat"}'
        $result | Should -BeLike 'Hello, FaintingGoat*'
    }
}
