function Api_HashView {
  Set-StrictMode -Version Latest
    Write-Host "Generaremos una lista de hashes para registrar su sistema de archivos local"
    Write-Host "Por favor indique de donde desea obtener los hashes SHA-256 para su analisis con VirusTotal"
    
    $files = Get-ChildItem -Path ".\*" -File
    $hashes = foreach ($file in $files) {
        Get-FileHash -Path $file.FullName -Algorithm SHA256 | Select-Object -Property Hash
    }
    $hashes | Export-Csv -Path .\hashes.csv -NoTypeInformation
    
    # Importar los hashes del archivo CSV
    $hashList = Import-Csv -Path .\hashes.csv | Select-Object -ExpandProperty Hash
    
    $apiKey = "26b83859a9b3ae2eeaf34ff2e9a1934b16f52d391c4620a474b4b16ba8705bb7"
    $headers = @{
        "accept" = "application/json"
        "x-apikey" = $apiKey
    }
    
    foreach ($hash in $hashList) {
        try {
            $url = "https://www.virustotal.com/api/v3/files/$hash"
            $response = Invoke-RestMethod -Uri $url -Method GET -Headers $headers -ErrorAction Stop
            
            if ($response) {
                $name = $response.data.attributes.meaningful_name
                $malicious = $response.data.attributes.last_analysis_stats.malicious
                $suspicious = $response.data.attributes.last_analysis_stats.suspicious
                
                Write-Host "Name: $name `nMalicious: $malicious `nSuspicious: $suspicious"
                Start-Sleep -Seconds 15
            }
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)"
        }
    }
}
