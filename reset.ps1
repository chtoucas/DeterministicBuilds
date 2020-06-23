
[CmdletBinding()]
param()

ls $PSScriptRoot -Include bin,obj,TestResults -Recurse `
    | foreach { Write-Verbose "Deleting ""$_""." ; rm $_.FullName -Recurse }

$json = Join-Path $PSScriptRoot (Join-Path "MyTests" "coverage.json")
if (Test-Path $json) {
    Write-Verbose "Deleting ""$json""."
    rm $json
}
