$folderNames = Read-Host "Enter the path to the file where stored names of newly created folders"
$path = Read-Host "Enter the path where folders will be created"

Get-Content $folderNames | ForEach-Object {
    $names = $_
    Try {
        New-Item -Path $path -Name $names -ItemType Directory -ErrorAction Stop
        Write-Host -ForegroundColor Green "$names succesfully created"
    }
    Catch [System.Management.Automation.DriveNotFoundException] {
        Write-Output "Drive not found."

    }
    Catch [System.IO.IOException] {
        Write-Warning "Item with $names already exist"
    }
    #catch [System.Management.Automation.ActionPreferenceStopException] {
     #   Write-Output "Stop Exception."
      #  write-host "Caught an exception:" -ForegroundColor Red
       # write-host "Exception Type: $($_.Exception.GetType().FullName)" -ForegroundColor Red
       # write-host "Exception Message: $($_.Exception.Message)" -ForegroundColor Red
    #}
}