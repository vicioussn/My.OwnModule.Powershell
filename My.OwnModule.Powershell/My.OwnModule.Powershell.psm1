#Requires -Version 7.0


$public  = @( Get-ChildItem -Path $PSScriptRoot\public\*.ps1 -Recurse; );
$private = @( Get-ChildItem -Path $PSScriptRoot\private\*.ps1 -Recurse; );


# Dot source the files
foreach ($import in @($public + $private))
{
    try
    {
        Write-Verbose "Importing '$($import.FullName)'.";
        . $import.FullName;
    }
    catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_";
    }
}


Export-ModuleMember -Function $public.Basename;