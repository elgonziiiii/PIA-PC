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
           
            $menu = Read-Host " `nEscoja una opcion:`n 1: Revision de hashes de archivos y consulta de API de Virus Total `n 2: Listado de archivos ocultos  `n 3: Listado de Uso de Recursos`n 4: Ver Proceso con mas Recursos`n 5: Exit`n Opcio"
            
            switch ($menu) {
                1{ 
                    try {
                        Write-Host "Revision de hashes y consulta API"
                        Api_HashView
                        
                    } catch {
                        Write-Host "Error al realizar la revision: $_"
                    }
                }
                2{
                    try {
                        Write-Host "Listado de Archivos Ocultos"
                        
                    } catch {
                        Write-Host "Error al mostrar el uso de recursos: $_"
                    }
                }
                3{
                    try {
                        Write-Host "Tarea Adicional"
                       
                    } catch {
                        Write-Host "Error en la tarea adicional: $_"
                    }
                }
                4{
                    Write-Host "Saliendo..."
                    exit
                }
                default {
                    Write-Host "Opción no válida. Por favor, elige una opción del 1 al 4."
                }
            }
        } catch {
            Write-Host "Error general: $_"
        } finally {
            
            Write-Host "Operacion Finalizada"
        }
    } while ($true)
}







