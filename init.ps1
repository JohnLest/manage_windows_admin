$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
if (!(Test-Path $registryPath)) {
    Write-Output "ERROR : the registry Path $registryPath not exist"
    Exit
}

$userAdmin = "$Env:USERDOMAIN\$Env:USERNAME"
Write-Output "Add UserAdmin $userAdmin in system Variable "
New-ItemProperty -Path $registryPath -Name UserAdmin -Value "$userAdmin" -PropertyType string -Force | Out-Null

$name = "PATH"
$varPath = Get-ItemProperty -Path $registryPath -Name $name
$realVarPath = $varPath.PATH
$scriptsPath = "$PSScriptRoot\scripts\;"
Write-Output "Edit the system variable Path with : $scriptsPath"
New-ItemProperty -Path $registryPath -Name $name -Value "$realVarPath$scriptsPath" -PropertyType string -Force | Out-Null