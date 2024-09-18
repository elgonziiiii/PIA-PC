
<#
.SYNOPSIS
Genera una lista de hashes SHA-256 de archivos en el directorio actual y consulta la API de VirusTotal para analizar esos hashes.

.DESCRIPTION
La función `Api_HashView` realiza los siguientes pasos:
1. Obtiene todos los archivos en el directorio actual y calcula el hash SHA-256 de cada uno.
2. Exporta los hashes a un archivo CSV.
3. Importa los hashes del archivo CSV.
4. Consulta la API de VirusTotal para cada hash utilizando una clave API proporcionada.
5. Muestra el nombre del archivo y los resultados del análisis (malicioso y sospechoso) en la consola.
6. Hace una pausa de 15 segundos entre cada consulta para evitar exceder el límite de solicitud de la API.

.EXAMPLE
Api_HashView
Genera hashes SHA-256 para todos los archivos en el directorio actual, exporta estos hashes a un archivo CSV y luego consulta la API de VirusTotal para obtener información sobre cada hash.

.PARAMETER
Este script no acepta parámetros.

.NOTES
- Asegúrate de tener una clave API válida de VirusTotal.
- La función realiza una pausa de 15 segundos entre cada consulta para evitar exceder los límites de solicitud de la API.
- Los resultados de la consulta se muestran en la consola.

#>

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
          
        }
    }
}
