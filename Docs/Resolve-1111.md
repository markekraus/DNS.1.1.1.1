---
external help file: DNS.1.1.1.1-help.xml
Module Name: DNS.1.1.1.1
online version:
schema: 2.0.0
---

# Resolve-1111

## SYNOPSIS
Resolves a HostName against Cloudflare's 1.1.1.1 DNS over HTTPS (DoH) Web Service

## SYNTAX

```
Resolve-1111 [-HostName] <String[]> [[-Type] <DnsQueryType>] [-ApiBaseUri <String>] [<CommonParameters>]
```

## DESCRIPTION
Cerates and submits a query to Cloudflare's 1.1.1.1 DNS over HTTPS (DoH) Web Service.
Returns the result object

## EXAMPLES

### Example 1
```powershell
Resolve-1111 google.com
```

This example resolves the hostname `google.com`.

## PARAMETERS

### -ApiBaseUri
Base URI of the Cloudflare DNS API.
The default is https://cloudflare-dns.com/dns-query
This can be overridden using the configuration module.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: https://cloudflare-dns.com/dns-query
Accept pipeline input: False
Accept wildcard characters: False
```

### -HostName
The DNS hostname to query.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Type
The type of DNS query.
Common types are A, AAAA, CNAME, MX, TXT and SOA.
The default is A.
See [iana.org](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4) for more details.

```yaml
Type: DnsQueryType
Parameter Sets: (All)
Aliases:
Accepted values: A, NS, MD, MF, CNAME, SOA, MB, MG, MR, NULL, WKS, PTR, HINFO, MINFO, MX, TXT, RP, AFSDB, X25, ISDN, RT, NSAP, NSAPPTR, SIG, KEY, PX, GPOS, AAAA, LOC, NXT, EID, NIMLOC, SRV, ATMA, NAPTR, KX, CERT, A6, DNAME, SINK, OPT, APL, DS, SSHFP, IPSECKEY, RRSIG, NSEC, DNSKEY, DHCID, NSEC3, NSEC3PARAM, TLSA, SMIMEA, Unassigned, HIP, NINFO, RKEY, TALINK, CDS, CDNSKEY, OPENPGPKEY, CSYNC, SPF, UINFO, UID, GID, UNSPEC, NID, L32, L64, LP, EUI48, EUI64, TKEY, TSIG, IXFR, AXFR, MAILB, MAILA, All, URI, CAA, AVC, DOA, TA, DLV

Required: False
Position: 1
Default value: A
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]
DnsQueryType

## OUTPUTS

### System.Object

## NOTES
In future versions the output will be strongly typed.

## RELATED LINKS

[https://github.com/markekraus/DNS.1.1.1.1/blob/master/Docs/Resolve-1111.md](https://github.com/markekraus/DNS.1.1.1.1/blob/master/Docs/Resolve-1111.md)

[1.1.1.1](https://1.1.1.1/)

[Cloudflare DNS over HTTPS (DoH)](https://developers.cloudflare.com/1.1.1.1/dns-over-https/)

[DoH using JSON](https://developers.cloudflare.com/1.1.1.1/dns-over-https/json-format/)

[iana.org](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4)