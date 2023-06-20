$headers = @{
    "accept" = "application/json"
    'api-key' = "<API-KEu>"
}

$file = "hashset.txt"
$hashes = Get-Content $file

$outputFile = "malres1.txt"
$url = "https://www.hybrid-analysis.com/api/v2/search/hash"

foreach ($hash in $hashes) {
    if (![string]::IsNullOrWhiteSpace($hash)) {
        $body = "hash=$hash"

        try {
            $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -ContentType "application/x-www-form-urlencoded" -Body $body

            # Check if the response contains any validation errors
            if ($response.validation_errors) {
                $errors = $response.validation_errors | Select-Object -ExpandProperty errors
                Write-Host "Validation errors occurred for hash: $hash"
                $errors | ForEach-Object { Write-Host "- $_" }
            } else {
                $response | ConvertTo-Json | Out-File -FilePath $outputFile -Append
            }
        } catch {
            Write-Host "Failed to retrieve response for hash: $hash. Error: $_"
        }
    } else {
        Write-Host "Skipping empty hash."
    }
}
