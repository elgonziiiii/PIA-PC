import os
import datetime
from modulo1 import generar_contrasena    #Importado de Modulo1
from modulo2 import obtenerInfo               #Importado de Modulo2
from modulo3 import scan_directory         #Importado de Modulo3
from scapy.all import sniff                     #Importado de Modulo4
from modulo5 import analizar_ip_abuse          #Importado de Modulo5

def generate_report(report_name, content):
    with open(report_name, 'w') as report:
        report.write(content)

def menu():
    options = [
        "1. Usar generador de contraseñas",
        "2. Ver información de IP con Shodan",
        "3. Buscar malware en un directorio",
        "4. Ver tráfico de red",
        "5. Detectar vulnerabilidades en una IP",
        "6. Salir"
    ]
    for option in options:
        print(option)

def main():
    # Generar un nombre de archivo único basado en la fecha y hora actuales
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    report_name = f"report_{timestamp}.txt"
    report_content = f"Reporte generado el: {timestamp}\n\n"
    
    while True:
        print("\n--- Menú Principal ---")
        menu()
        choice = input("Elige una opción: ")

        if choice == '1':
            length = int(input("Introduce la longitud deseada de la contraseña: "))
            password = generar_contrasena(length)
            print(f"Contraseña generada: {password}")
            report_content += f"Opción 1: Generador de contraseñas\nContraseña generada: {password}\n\n"

        elif choice == '2':
            api_key = input("Introduce tu API Key de Shodan: ")
            ip = input("Introduce la IP que deseas consultar: ")
            ip_info = obtenerInfo(api_key, ip)
            report_content += f"Opción 2: Información de IP con Shodan\n{ip_info}\n\n"

        elif choice == '3':
            directory = input("Introduce el directorio a escanear: ")
            malware_results = scan_directory(directory)
            report_content += f"Opción 3: Escaneo de malware\n"
            for result in malware_results:
                report_content += f"{result}\n"
            report_content += "\n"

        elif choice == '4':
            traffic_results = analizar_trafico_red()
            report_content += f"Opción 4: Análisis de tráfico de red\n"
            for result in traffic_results:
                report_content += f"{result}\n"
            report_content += "\n"

        elif choice == '5':
            ip = input("Introduce la IP que deseas analizar: ")
            abuse_results = analizar_ip_abuse(ip)
            report_content += f"Opción 5: Detección de vulnerabilidades\n{abuse_results}\n\n"

        elif choice == '6':
            generate_report(report_name, report_content)
            print(f"\nSaliendo del programa... El reporte ha sido guardado en: {report_name}")
            break

        else:
            print("Opción no válida, por favor elige una opción del menú.")

if __name__ == "__main__":
    main()
