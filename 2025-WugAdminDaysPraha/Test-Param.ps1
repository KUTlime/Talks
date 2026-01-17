param (
    [Parameter(Mandatory)]
    [string]
    $InputValue
)

Write-Host "Zpracovávám vstup: $InputValue"
Write-Warning "Toto je varování pro vstup: $InputValue"
Write-Information "Informace o vstupu: $InputValue"