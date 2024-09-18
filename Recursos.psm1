#JOSAFAT DE LA GARZA AMARO 2076405
#CODIGO PARA VER EL USO DE LA CPU Y LA RAM Y DISCO DURO 
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
