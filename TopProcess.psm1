<#
.SYNOPSIS
Muestra los procesos que est�n utilizando m�s memoria.

.DESCRIPTION
La funci�n `TopProcess` obtiene la lista de todos los procesos en ejecuci�n, los ordena por el uso de memoria (Working Set) y selecciona los procesos que est�n utilizando m�s memoria.

.EXAMPLE
TopProcess -Count 5
Muestra los 5 procesos que est�n utilizando m�s memoria en el sistema.

.NOTES
 -La funci�n utiliza el cmdlet `Get-Process` para obtener los procesos que se estan ejecutando
 -Ordena los procesos por la memoria f�sica utilizada (`WS` o Working Set)
 -Selecciona los procesos con mayor uso de memoria.
 -Autor: Jonathan Francisco Vela Guerrero
 -Fecha: 18/09/2024
 #>

Set-StrictMode -Version Latest #Activa el modo estricto en su version mas reciente

function TopProcess {
    try {
        ps | Sort-Object -Property WS | Select-Object -Last 5 -ErrorAction "Stop" # Muestra los 5 procesos con mayor uso de memoria
    }
    catch {
        Write-Host "Ocurri� un error:" $_.Exception.Message # Muestra el mensaje de error
    }
}
