from scapy.all import sniff

def analizar_trafico_red():
    results = []
    
    while True:
        try:
            # Define la cantidad de paquetes a capturar
            packet_count = int(input("¿Cuántas líneas de tráfico deseas imprimir? "))
            if packet_count <= 0:
                print("Por favor, introduce un número positivo.")
                continue  # Volver a preguntar si el número es negativo o cero
            break  # Salir del bucle si la entrada es válida
        except ValueError:
            print("Entrada no válida. Por favor, introduce un número entero.")

    def packet_callback(packet):
        results.append(f"Origen: {packet[0][1].src} -> Destino: {packet[0][1].dst}")  # Agrega un resumen del paquete a los resultados
        if len(results) >= packet_count:
            return False  # Detiene la captura después de alcanzar el número deseado

    sniff(prn=packet_callback, count=packet_count)
    
    # Imprimir y devolver los resultados
    for result in results:
        print(result)  # Imprime el resultado para el usuario
    return results  # Devuelve los resultados capturados
