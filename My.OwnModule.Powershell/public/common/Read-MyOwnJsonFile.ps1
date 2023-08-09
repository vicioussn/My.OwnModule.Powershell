function Read-MyOwnJsonFile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline = $true)][string]$path
    );

    
    try
    {
        $result = Get-Content -Path $path -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop;
    }
    catch
    {
        Write-Error "Error while reading '$path'.";
        throw $_;
    }

    return $result;
}