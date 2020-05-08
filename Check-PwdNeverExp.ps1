#$input = ".\users1.csv"
$input = Read-Host "File Path"

Import-Csv -Path $input | ForEach-Object {
Get-ADUser $_.name -Properties * | Select-Object Name,PasswordNeverExpires,LockedOut,@{n='pwdLastSet';e={[DateTime]::FromFileTime($_.pwdLastSet)}}
}