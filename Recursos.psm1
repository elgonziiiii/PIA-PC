#JOSAFAT DE LA GARZA AMARO 2076405
#CODIGO PARA VER EL USO DE LA CPU Y LA RAM Y DISCO DURO 
function Resource-Usage{

$totalRam = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).Sum
while ($true) {
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Las siguientes 3 lineas de codigo se usan para encontrar el valor de los recursos que se estan usando 
    $cpuTime = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    
    $availMem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
    
    $diskFree = (Get-Counter '\LogicalDisk(_Total)\% Free Space').CounterSamples.CookedValue
    
    # Aqui se muestran los resultados, por favor no moverle a nada 
    $output = "$date > CPU: {0}%, Avail. RAM.: {1}MB ({2}%), Disco Libre: {3}%" -f `
        $cpuTime.ToString("#,0.000"), `
        $availMem.ToString("N0"), `
        (104857600 * $availMem / $totalRam).ToString("#,0.0"), `
        $diskFree.ToString("#,0.0")
    
    Write-Output $output
    
    Start-Sleep -s 2
 } RAM 

}



#CODIGO PARA VER EL USO DE LA CPU Y LA RAM Y DISCO DURO 
