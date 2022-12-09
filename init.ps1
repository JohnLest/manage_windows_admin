$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
$name = "PATH"
$varPath = Get-ItemProperty -Path $registryPath -Name $name
$realVarpath = $varPath.PATH
$sudoPath = "D:\Dev-Project\Other_Project\sudo;"
Write-Output "Edite the system variable Path with : $sudoPath"
New-ItemProperty -Path $registryPath -Name $name -Value "$realVarpath$sudoPath" -PropertyType string -Force | Out-Null
Write-Output "Add UserAdmin in system Variable "
# TODO Get UserAdmin and add in system variable
