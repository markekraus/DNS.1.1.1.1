function Resolve-1111 {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0
        )]
        [string[]]
        $HostName,

        [Parameter(
            ValueFromPipelineByPropertyName,
            Position = 1
        )]
        [DnsQueryType]
        $Type = 'A',

        [Parameter(DontShow)]
        [string]
        $ApiBaseUri = (Get-ApiBaseUri)
    )

    begin {
        $CtMimeType = Get-CtMimeType
    }

    process {
        foreach ($Lookup in $HostName) {
            Write-Verbose "Processing Name: $Lookup Type: $Type"
            $Uri = '{0}?ct={1}&name={2}&type={3}' -f @(
                $ApiBaseUri
                $CtMimeType
                $Lookup
                $Type
            )
            Write-Verbose "Uri: $Uri"
            Invoke-RestMethod $Uri
        }
    }
}