

from scapy.all import sniff

def analizar_trafico_red():
    try:
        # Pregunta al usuario cuántos paquetes quiere capturar
        num_paquetes = int(input("¿Cuantas líneas de trafico de red deseas imprimir? "))

        def analizar_paquete(paquete):
            if paquete.haslayer('IP'):
                print(f"Origen: {paquete['IP'].src} -> Destino: {paquete['IP'].dst}")

        # Sniffing de paquetes con la cantidad límite indicada por el usuario
        sniff(prn=analizar_paquete, count=num_paquetes, store=0)
    
    except ValueError:
        print("Error: Debes ingresar un numero válido.")
    
    except Exception as e:
        print(f"Ha ocurrido un error inesperado: {e}")

# Ejecutar el programa
analizar_trafico_red()
