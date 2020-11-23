# Run this script / ISE as administrator!
# Download hotfixes to local computer
# Update the path of the hotfixes to prevent failure
$UpdatePath = "C:\temp"

# Old hotfix list
Get-HotFix > "$UpdatePath\old_hotfix_list.txt"

# Get all updates
$Updates = Get-ChildItem -Path $UpdatePath -Recurse | Where-Object {$_.Name -like "*msu*"}

# Iterate through each update
ForEach ($update in $Updates) {

    # Get the full file path to the update
    $UpdateFilePath = $update.FullName

    # Logging
    write-host "Installing update $($update.BaseName)"

    # Install update - use start-process -wait so it doesnt launch the next installation until its done
    Start-Process -wait wusa -ArgumentList "/update $UpdateFilePath","/quiet","/norestart"
}

# Old hotfix list66
Get-HotFix > "$UpdatePath\new_hotfix_list.txt
