$name = Read-Host "Input Name"
$surname = Read-Host "Input Surname"
$displayname = Read-Host "Input DisplayName"
$samaccountname = Read-Host "Input SamAccountName"
$pwd = Read-Host -AsSecureString "Type Password"

New-AdUser -Name $name -Surname $surname -DisplayName $displayname -SamAccountName $samaccountname -AccountPassword $pwd -Enabled $true
