function Get-ApiBaseUri {
    [CmdletBinding()]
    param ()
    end {
        $Config = Import-Configuration
        $Config.CloudflareDnsApiBaseUri
    }
}