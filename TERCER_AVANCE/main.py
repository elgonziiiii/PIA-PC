import os
import datetime
from password_generator import generar_contrasena
from malware_scanner import scan_directory
from scapy.all import sniff
from shodan_module import obtenerInfo
from abuseipdb_module import analizar_ip_abuse

def generar_reporte(nombre_reporte, contenido):
    with open(nombre_reporte, 'w') as reporte:
        reporte.write(contenido)

def menu():
    opciones = [
        "1. Usar generador de contraseñas",
        "2. Ver información de IP con Shodan",
        "3. Buscar malware en un directorio",
        "4. Ver tráfico de red",
        "5. Detectar vulnerabilidades en una IP",
        "6. Salir"
    ]
    for opcion in opciones:
        print(opcion)

def main():
    # Generar un nombre de archivo único basado en la fecha y hora actuales
    fecha_hora = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    nombre_reporte = f"reporte_{fecha_hora}.txt"
    contenido_reporte = f"Reporte generado el: {fecha_hora}\n\n"
    
    while True:
        print("\n--- Menú Principal ---")
        menu()
        opcion = input("Elige una opción: ")

        if opcion == '1':
            longitud = int(input("Introduce la longitud deseada de la contraseña: "))
            contrasena = generar_contrasena(longitud)
            print(f"Contraseña generada: {contrasena}")
            contenido_reporte += f"Opción 1: Generador de contraseñas\nContraseña generada: {contrasena}\n\n"

        elif opcion == '2':
            api_key = input("Introduce tu API Key de Shodan: ")
            ip = input("Introduce la IP que deseas consultar: ")
            info_ip = obtenerInfo(api_key, ip)
            contenido_reporte += f"Opción 2: Información de IP con Shodan\n{info_ip}\n\n"

        elif opcion == '3':
            directorio = input("Introduce el directorio a escanear: ")
            resultados_malware = scan_directory(directorio)
            contenido_reporte += f"Opción 3: Escaneo de malware\n"
            for resultado in resultados_malware:
                contenido_reporte += f"{resultado}\n"
            contenido_reporte += "\n"

        elif opcion == '4':
            resultados_trafico = analizar_trafico_red()
            contenido_reporte += f"Opción 4: Análisis de tráfico de red\n"
            for resultado in resultados_trafico:
                contenido_reporte += f"{resultado}\n"
            contenido_reporte += "\n"

        elif opcion == '5':
            ip = input("Introduce la IP que deseas analizar: ")
            resultados_abuse = analizar_ip_abuse(ip)
            contenido_reporte += f"Opción 5: Detección de vulnerabilidades\n{resultados_abuse}\n\n"

        elif opcion == '6':
            generar_reporte(nombre_reporte, contenido_reporte)
            print(f"\nSaliendo del programa... El reporte ha sido guardado en: {nombre_reporte}")
            break

        else:
            print("Opción no válida, por favor elige una opción del menú.")

if __name__ == "__main__":
    main()
