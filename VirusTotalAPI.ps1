$headers = @{
    "accept" = "application/json"
    "x-apikey" = "<API-KEY>" # Place your API key inside of the quotes
}

$file = "<example.txt>" # Place your text file with hashes name here
$hashes = Get-Content $file
$outputFile = "<results.txt>" # Name your output file here

foreach ($hash in $hashes) {
    $url = "https://www.virustotal.com/api/v3/files/$hash"
    $response = Invoke-RestMethod -Uri $url -Method GET -Headers $headers

    # Write the response to the output file
    $response | ConvertTo-Json | Out-File -FilePath $outputFile -Append
}