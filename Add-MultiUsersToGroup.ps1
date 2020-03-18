$inputfile =  ".\users.csv"

Import-Csv -Path $inputfile | ForEach-Object { 
Try {
    Add-ADGroupMember -Identity GROUPNAME -Members $_.name

} Catch { 
    Write-Host $_
}
}