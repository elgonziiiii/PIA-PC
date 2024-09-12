Set-StrictMode -Version Latest

function get-menu {
    do {
        try {
           
            $menu = Read-Host " `nPlease choose an option:`n 1: Listado de Archivos`n 2: Uso de Recursos`n 3: Tarea Adicional`n 4: Exit`n Opcion"
            
            switch ($menu) {
                1{ 
                    try {
                        Write-Host "Listado de Archivos"
                        
                    } catch {
                        Write-Host "Error al listar los archivos: $_"
                    }
                }
                2{
                    try {
                        Write-Host "Uso de Recursos"
                        
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







