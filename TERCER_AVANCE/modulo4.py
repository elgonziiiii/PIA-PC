from scapy.all import sniff

def analizar_trafico_red():
    results = []
    try:
        # Pregunta al usuario cuántos paquetes quiere capturar
        num_paquetes = int(input("¿Cuantas líneas de trafico de red deseas imprimir? "))

        def analizar_paquete(paquete):
            if paquete.haslayer('IP'):
                result = f"Origen: {paquete['IP'].src} -> Destino: {paquete['IP'].dst}"
                results.append(result)
                print(result)

        # Sniffing de paquetes con la cantidad límite indicada por el usuario
        sniff(prn=analizar_paquete, count=num_paquetes, store=0)
        return results
    
    except ValueError:
        print("Error: Debes ingresar un numero válido.")
        return []
    
    except Exception as e:
        print(f"Ha ocurrido un error inesperado: {e}")
        return []

