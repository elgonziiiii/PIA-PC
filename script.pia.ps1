# Gonzalo Gabriel Valdez Gonzalez 2057618
# Josefat De la Garza Almaro 2076405
#

Import-Module .\Recursos.psm1
Import-Module .\TopProcess.psm1
Import-Module .\BuscarArchivosOcultos.psm1
Import-Module .\API_VIRUSTOTAL_2.psm1

Set-StrictMode -Version Latest

function get-menu {
    do {
        try {
            $menu = Read-Host " `nEscoja una opción:`n 1: Revisión de hashes de archivos y consulta de API de Virus Total `n 2: Listado de archivos ocultos  `n 3: Listado de Uso de Recursos`n 4: Ver Proceso con más Recursos`n 5: Exit`n Opción"
            
            switch ($menu) {
                1 { 
                    try {
                        Write-Host "Revisión de hashes y consulta API"
                        Api_HashView
                    } catch {
                        Write-Host "Error al realizar la revisión: $_"
                    }
                }
                2 {
                    try {
                        Write-Host "Listado de Archivos Ocultos"
                        Get-HiddenFiles
                    } catch {
                        Write-Host "Error al buscar los archivos ocultos: $_"
                    }
                }
                3 {
                    try {
                        Write-Host "Listado de uso de Recursos"
                        Get-ResourceUsage
                    } catch {
                        Write-Host "Error en el listado de Recursos: $_"
                    }
                }
                4 {  
                    try {
                        Write-Host "Tarea con más recursos"
                        TopProcess
                    } catch { 
                        Write-Host "Error en mostrar la tarea: $_"
                    }
                }
                5 { 
                    Write-Host "Saliendo..."
                    exit
                }
                default {
                    Write-Host "Opción no válida. Por favor, elige una opción del 1 al 5."
                }
            }
        } catch {
            Write-Host "Error general: $_"
        } finally {
            Write-Host "Operación Finalizada"
        }
    } while ($true)
}






