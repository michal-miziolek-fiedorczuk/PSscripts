$pathToFile = Read-Host "Please provide path to the file."

Import-Csv -Path $pathToFile -Delimiter ";" | ForEach-Object {
$Group = $_.group
$UserToAdd = $_.username     
Try {
        Add-ADGroupMember -Identity $Group -Members $UserToAdd
        Write-Host -ForegroundColor Green "$UserToAdd has been added to the group $Group"
    } 
Catch {
        Write-Host $_       
    }
}