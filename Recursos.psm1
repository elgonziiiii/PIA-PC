#JOSAFAT DE LA GARZA AMARO 2076405
#CODIGO PARA VER EL USO DE LA CPU Y LA RAM Y DISCO DURO 

<#
.SYNOPSIS
Muestra el uso actual de los recursos del sistema, incluyendo CPU, memoria y espacio en disco.

.DESCRIPTION
La función `Get-ResourceUsage` obtiene y muestra información sobre el uso de recursos del sistema, como el porcentaje de tiempo de procesador, la memoria disponible en megabytes y el porcentaje de espacio libre en disco. La información se actualiza cada 2 segundos y se muestra en formato de texto.

.EXAMPLE
Get-ResourceUsage
Muestra el uso de recursos del sistema en la consola cada 2 segundos.

.PARAMETER
Este script no acepta parámetros.

.NOTES
- La función utiliza `Get-Counter` para obtener los contadores de rendimiento del sistema.
- La función maneja errores y muestra mensajes en caso de problemas al obtener los datos.
- La actualización de los datos de recursos se realiza cada 2 segundos.
- Para salir del bucle de los 2 segundos presionar ´ctrl+c´

#>

function Get-ResourceUsage{

   Set-StrictMode -Version Latest
try{

$totalRam = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).Sum
if (-not $totalRam) {
  throw "No se pudo obtener la informacion de la memoria fisica"
  }
  }catch{
   Write-Error "Error al obtener la memoria fisica: $_"
   return
   }
while ($true) {
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    try{
    
    # Las siguientes 3 lineas de codigo se usan para encontrar el valor de los recursos que se estan usando 
    $cpuTime = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    
    $availMem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
    
    $diskFree = (Get-Counter '\LogicalDisk(_Total)\% Free Space').CounterSamples.CookedValue

    if(-not $cpuTime -or -not $availMem -or -not $diskFree) {
        throw "No se pudieron obtener los contadores de recursos"
        }
    } catch { 
       Write-Error "Error al obtener los contadores de recursos: $_"
       Start-Sleep -s 2
       continue
    }
    
    # Aqui se muestran los resultados, por favor no moverle a nada 
    try {
    $output = "$date > CPU: {0}%, Avail. RAM.: {1}MB ({2}%), Disco Libre: {3}%" -f `
        $cpuTime.ToString("#,0.000"), `
        $availMem.ToString("N0"), `
        (104857600 * $availMem / $totalRam).ToString("#,0.0"), `
        $diskFree.ToString("#,0.0")
    
    Write-Output $output
} catch { 
   Write-Error "Error al formatear la salida: $_"
   }
    
    Start-Sleep -s 2
 }  

}



#CODIGO PARA VER EL USO DE LA CPU Y LA RAM Y DISCO DURO 
