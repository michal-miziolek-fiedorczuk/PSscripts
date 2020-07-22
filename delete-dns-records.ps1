$inputfile = Read-Host "Type file path"
 
Import-Csv -Path $inputfile| foreach-object { 
    Try {
        Remove-DnsServerResourceRecord -computername DNSSERVER -ZoneName ZONE -RRType "A" -Name $_.name -RecordData $_.IP -Force
        Write-Host -ForegroundColor Green "Record" $_.name "has been deleted succesfully" 
     } 
    Catch {
        Write-Host -ForegroundColor Red "Record" $_.name "hasn't been deleted"
        Write-Host $_
    }
}