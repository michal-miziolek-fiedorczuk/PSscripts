#This script used to delete existing DNS records or computer object in AD

function deleteDnsRecord {
    Param([string]$inputPath,[string]$dnsServer,[string]$zoneName)
     
    Import-Csv -Path $inputPath| foreach-object { 
        Try {
                Remove-DnsServerResourceRecord -computername $dnsServer -ZoneName $zoneName -RRType "A" -Name $_.name -RecordData $_.IP -Force
                Write-Host -ForegroundColor Green "Record" $_.name "has been deleted succesfully" 
            } 
         Catch {
                Write-Host -ForegroundColor Red "Record" $_.name "hasn't been deleted"
                Write-Host $_
            }
        }
    }
    
    function deleteComputer {
    Param ([string]$inputPath)
    
    Import-Csv -Path $inputPath | ForEach-Object {
        Try {
                Get-ADComputer $_.name | Remove-ADObject -Recursive -Confirm:$false
                Write-Host -ForegroundColor Green $_.name "has been deleted succesfully"
            } 
            Catch {
                    Write-Host -ForegroundColor Red $_.name "doesn't exist already"
            }
        }
    }