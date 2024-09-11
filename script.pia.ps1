function get-menu {
    do {
    $menu = Read-Host " `nPlease choose an option:`n 1: Listado de Archivos`n 2: Uso de Recursos`n 3: Tarea Adicional`n 4: Exit`n Opcion"
    switch ($menu) {
        1{ 
            Write-Host "listado de Archivos"
            #modulo
        }
        2{
            Write-Host "Uso de Recursos"
            #modulo
        }
        3{
            Write-Host "Tarea Adicional"
            #modulo
        }
        4{
            Write-Host "leaving... "
            exit
        }
    }
    } while ($true)}




