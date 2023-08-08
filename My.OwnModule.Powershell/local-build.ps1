# Config
$moduleName = "My.OwnModule.Powershell";


# Clear old packages
# Get-ChildItem .\$moduleName\_bin | Remove-Item -Force -Verbose;


#region Get current package version and increment Patch
$version = Select-String -Path .\$moduleName\$moduleName.nuspec -Pattern "<version>(\d)\.(\d)\.(\d{1,})</version>";
[int]$majorVersion = $version | Select-Object @{name="version"; expression={$_.Matches.Groups[1].Value}} | select-object -ExpandProperty version;
[int]$minorVersion = $version | Select-Object @{name="version"; expression={$_.Matches.Groups[2].Value}} | select-object -ExpandProperty version;
[int]$patchVersion = $version | Select-Object @{name="version"; expression={$_.Matches.Groups[3].Value}} | select-object -ExpandProperty version;
$patchVersion++;
$nuspecVersionString = "<version>$majorVersion.$minorVersion.$patchVersion</version>";
$psd1VersionString = "ModuleVersion        = `"$majorVersion.$minorVersion.$patchVersion`"";
#endregion /Get current package version and increment Patch


#region Update package version
$a = Get-Content -Path ".\$moduleName\$moduleName.nuspec" | %{$_ -replace "<version>(\d)\.(\d)\.(\d{1,})<\/version>", $nuspecVersionString };
$a | Out-File ".\$moduleName\$moduleName.nuspec" -Verbose;

$a = Get-Content -Path ".\$moduleName\$moduleName.psd1" | %{$_ -replace "ModuleVersion        = `"\d\.\d.\d{1,}`"", $psd1VersionString };
$a | Out-File ".\$moduleName\$moduleName.psd1" -Verbose;
#endregion /Update package version


nuget pack ".\$moduleName\$moduleName.nuspec" -OutputDirectory .\$moduleName\_bin -Properties NoWarn=NU5111,NU5110,NU5100
$package = Get-ChildItem .\$moduleName\_bin\*.nupkg | Sort-Object -Property CreationTime | Select-Object -Last 1;

$package