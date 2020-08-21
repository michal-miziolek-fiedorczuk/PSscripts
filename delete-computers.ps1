
Get-Content .\computers.txt | ForEach-Object {
    $pc = $_
    Try 
        {
            Get-ADComputer $pc | Remove-ADObject -Recursive -Confirm:$false
            Write-Host -ForegroundColor Green "$pc has been deleted succesfully"
        }
    Catch
        {
            Write-Host -ForegroundColor Red "$pc doesn't exist already"
        }
    }