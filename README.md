# PIA-PC
PIA para Programacion para Ciberseguridad

Este script de PowerShell proporciona un menú interactivo que permite al usuario ejecutar varias funciones relacionadas con la revisión de hashes de archivos, consulta a la API de Virus Total, listado de archivos ocultos y monitoreo del uso de recursos del sistema. Está diseñado para ser una herramienta útil en tareas de administración y monitoreo del sistema, especialmente en el contexto de la seguridad informática. 

A continuacion explicare el procedimiento para instalar el script: 

Primero se tendrian que descargar los archivos psm1 siendo los modulos y el archivo ps1 siendo el script principal: 

Importar los Módulos: El script requiere la importación de varios módulos personalizados. Asegúrate de que los siguientes archivos de módulo (.psm1) estén en el mismo directorio que el script principal:

Recursos.psm1
TopProcess.psm1
BuscarArchivosOcultos.psm1
API_VIRUSTOTAL_2.psm1
Luego, ejecuta el script para importar estos módulos:

Import-Module .\Recursos.psm1
Import-Module .\TopProcess.psm1
Import-Module .\BuscarArchivosOcultos.psm1
Import-Module .\API_VIRUSTOTAL_2.psm1

Establecer el Modo Estricto: El script utiliza el modo estricto para asegurar buenas prácticas de programación:

La primera vez que se ejecute el codigo en el sistema pedira la confirmacion 4 veces

Set-StrictMode -Version Latest

Uso
Una vez que los módulos han sido importados, puedes ejecutar el menú interactivo usando la función get-menu. El menú presenta varias opciones:

Revisión de hashes y consulta a la API de Virus Total:

Ejecuta la función Api_HashView para revisar los hashes de archivos y hacer una consulta a la API de Virus Total.
Listado de archivos ocultos:

Usa la función Get-HiddenFiles para mostrar los archivos ocultos en el sistema.
Listado del uso de recursos:

La función Get-ResourceUsage muestra un listado de los recursos del sistema en uso.
Mostrar el proceso con más recursos:

Ejecuta la función TopProcess para ver el proceso que está utilizando más recursos del sistema.
Salir del menú:

Permite salir del menú y finalizar el script.

Ejecución del Menú
Para iniciar el menú, simplemente ejecuta el siguiente comando:

get-menu

Te presentará algo similar a lo siguiente:

Escoja una opción:
1: Revisión de hashes de archivos y consulta de API de Virus Total
2: Listado de archivos ocultos
3: Listado de Uso de Recursos
4: Ver Proceso con más Recursos
5: Exit
Opción:


Selecciona la opción deseada (del 1 al 5) para ejecutar la tarea.


Creditos: 

-Equipo 4 de la clase de Programacion para Ciberseguridad.
