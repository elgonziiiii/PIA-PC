Set-StrictMode -Version Latest #Activa el modo estricto en su version mas reciente

function TopProcess {
    try {
        ps | Sort-Object -Property WS | Select-Object -Last 5 -ErrorAction "Stop" # Muestra los 5 procesos con mayor uso de memoria
    }
    catch {
        Write-Host "Ocurrió un error:" $_.Exception.Message # Muestra el mensaje de error
    }
}
