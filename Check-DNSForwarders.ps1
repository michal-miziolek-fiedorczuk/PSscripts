$DNSForwarders = Get-DnsServer -ComputerName scrbdcoaze002
$TotCFNow = $DNSForwarders.ServerForwarder
$TotCFNow