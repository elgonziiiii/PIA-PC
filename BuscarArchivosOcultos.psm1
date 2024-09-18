<#
.SYNOPSIS
   Muestra los archivos ocultos en una ruta especificada.
.DESCRIPTION
   La funcion recibe una ruta ingresada por el usuario y muestra todos los archivos ocultos en esa ruta.
.PARAMETER None
   La función no recibe parametros, pero solicita al usuario que ingrese una ruta.
.NOTES
   Autor: TeyssiHM
   Fecha: 12/09/2024
#>

function Get-HiddenFiles {
    Set-StrictMode -Version Latest
    
    $path = Read-Host "Enter the path to your folder to see hidden files"
    
    if (Test-Path -Path $path) {
        try {
            $hiddenFiles = Get-ChildItem -Path $path -Force -Hidden -File -ErrorAction Stop
            
            if ($hiddenFiles.Count -eq 0) {
                Write-Host "No hidden files found."
            } else {
                Write-Host "Hidden files found in $path :"
                
                $count = 1
                foreach ($file in $hiddenFiles) {
                    Write-Host "$count. $($file.Name)"
                    $count++
                }
                
                Write-Host "Total number of hidden files: $($hiddenFiles.Count)"
            }
        } catch {
            Write-Host "Error: $_"
        }
    } else {
        Write-Host "The specified path does not exist. Please enter a valid path."
    }
}

Get-HiddenFiles
