"""
Este programa es una herramienta de seguridad informática que permite realizar
diferentes acciones para fortalecer la seguridad de tu red y sistema.

ANTES DE USAR EL CODIGO SE DEBE INSTALAR: 

-pip install scapy
-pip install shodan
-pip install abuseipdb
-pip install requests

EN CIERTOS CASOS ES NECESARIO INSTALAR EXTERNAMENTE "Npcap" 

1. **Generador de Contraseñas**: Permite crear contraseñas seguras. Al seleccionar 
   esta opción, se te pedirá que ingreses la longitud deseada para la contraseña. 
   El programa generará una contraseña aleatoria compuesta por letras, números y 
   caracteres especiales.

2. **Consulta de Información de IP**: Utiliza la API de Shodan. Necesitarás 
   proporcionar tu API Key y la dirección IP que deseas investigar. El programa 
   devolverá detalles como la organización, el sistema operativo, y los puertos 
   abiertos.

3. **Escaneo de Malware**: Se te pedirá que introduzcas el directorio que deseas 
   escanear en busca de patrones de malware. El programa registrará los hallazgos 
   en un log y te mostrará los resultados.

4. **Análisis de Tráfico de Red**: Esta opción te permitirá monitorear el tráfico 
   de tu red en tiempo real. Introducirás cuántas líneas de tráfico deseas imprimir 
   y el programa capturará y mostrará la información de origen y destino de los 
   paquetes.

5. **Detección de Vulnerabilidades**: Para esta opción, se requerirá que ingreses 
   la IP que deseas analizar. El programa consultará la API de AbuseIPDB para 
   identificar posibles vulnerabilidades.

6. **Salir**: Selecciona esta opción para finalizar el programa. Antes de salir, 
   se generará un reporte que contendrá todos los resultados de las acciones 
   realizadas durante la sesión.

Los resultados de cada opción se almacenarán en un archivo de reporte con 
una marca de tiempo, permitiéndote revisar la información más tarde. 
Simplemente ejecuta el script y sigue las instrucciones del menú que aparecerá 
en la pantalla. ¡Empieza a fortalecer la seguridad de tu sistema ahora!
"""
