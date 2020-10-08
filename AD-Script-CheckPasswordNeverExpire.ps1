#$input = ".\users1.csv"
$inputFilePath = Read-Host "Type file Path"

Import-Csv -Path $inputFilePath | ForEach-Object {
Get-ADUser $_.name -Properties * | Select-Object Name,PasswordNeverExpires,LockedOut,@{n='pwdLastSet';e={[DateTime]::FromFileTime($_.pwdLastSet)}}
}