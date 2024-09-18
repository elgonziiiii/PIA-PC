# Gonzalo Gabriel Valdez Gonzalez 2057618
# Josefat De la Garza Almaro 2076405
# Anateyssi Hernandez Meza 2024072
# Ricardo González Villarreal 2044283

Import-Module .\Recursos.psm1
Import-Module .\TopProcess.psm1
Import-Module .\BuscarArchivosOcultos.psm1
Import-Module .\API_VIRUSTOTAL_2.psm1

Set-StrictMode -Version Latest

   <#
    .SYNOPSIS
    Muestra el menú principal y gestiona la selección de opciones.
    .DESCRIPTION
    Esta función muestra un menú con opciones para realizar diversas tareas, incluyendo la revisión de hashes de archivos, listado de archivos ocultos, listado del uso de recursos y visualización del proceso con más recursos. 
    La opción 5 permite salir del menú.
    .EXAMPLE
    get-menu
    Muestra el menú y permite al usuario seleccionar una opción.
    #>

function get-menu {
    do {
        try {
            $menu = Read-Host " `nEscoja una opcion:`n 1: Revisión de hashes de archivos y consulta de API de Virus Total `n 2: Listado de archivos ocultos  `n 3: Listado de Uso de Recursos`n 4: Ver Proceso con más Recursos`n 5: Exit`n Opción"
            
            switch ($menu) {
                1 { 
                    try {
                        Write-Host "Revision de hashes y consulta API"
                        Api_HashView
                    } catch {
                        Write-Host "Error al realizar la revision: $_"
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
                        Write-Host "Tarea con mas recursos"
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
                    Write-Host "Opcion no valida. Por favor, elige una opcion del 1 al 5."
                }
            }
        } catch {
            Write-Host "Error general: $_"
        } finally {
            Write-Host "Operacion Finalizada"
        }
    } while ($true)
}

get-menu





