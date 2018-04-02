function Get-CtMimeType {
    [CmdletBinding()]
    param ()
    end {
        $Config = Import-Configuration
        $Config.CtMimeType
    }
}