$moduleName = "My.OwnModule.Powershell";
$repoName = "My.OwnModule.Powershell.Repository";
$repoPath = "D:\Private\My.OwnModule.Powershell\My.OwnModule.Powershell\_bin\";

Register-PSRepository -Name $repoName -SourceLocation $repoPath -InstallationPolicy Trusted -ScriptSourceLocation $repoPath;

Install-Module -Name $moduleName -Repository $repoName -Verbose;

Get-Module $moduleName -ListAvailable;