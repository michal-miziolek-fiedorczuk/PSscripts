$inputfile = ".\users.csv"

Import-Csv -Path $inputfile | ForEach-Object {
Try {
        Get-ADUser $_.name
    } Catch {
        Write-Host $_
    }
}