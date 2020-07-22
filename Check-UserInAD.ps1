$inputfile = Read-Host "Type file path"

Import-Csv -Path $inputfile | ForEach-Object {
Try {
        Get-ADUser $_.name
    } Catch {
        Write-Host $_
    }
}