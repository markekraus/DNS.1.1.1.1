function Resolve-QueryType {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            Position = 0
        )]
        [DnsQueryType[]]
        $QueryType
    )
    process {
        foreach ($type in $QueryType) {
            switch ($type) {
                'All' { '*' }
                'NSAPPTR' { 'NSAP-PTR' }
                Default { "$type"}
            }
        }
    }
}
