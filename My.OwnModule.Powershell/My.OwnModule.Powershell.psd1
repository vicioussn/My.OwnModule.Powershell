@{
    RootModule           = "My.OwnModule.Powershell.psm1"
    ModuleVersion        = "0.0.4"
    CompatiblePSEditions = "Desktop", "Core"
    GUID                 = "8f37ba7b-be77-4b6e-8ceb-d30c0c328674"
    Author               = "uladzislau_dadzimau@epam.com"
    PowerShellVersion    = "7.0"

    ScriptsToProcess     = @();
       
    FunctionsToExport    = @(
        "Read-MyOwnJsonFile"
    );
    CmdletsToExport      = "*"
    VariablesToExport    = "*"
    AliasesToExport      = "*"
}
