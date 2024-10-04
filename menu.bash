#!/bin/bash

clear
echo "================================="
echo "        Menú Principal           "
echo "================================="

PS3="Ingresa un Número: "

select opcion in "Monitoreo de uso de ancho de banda"  "Registro de tráfico de red"  "Detección de dispositivos en la red"  "Análisis de rendimiento de la red"  "Generar reporte"  "Salir"
do
    case $REPLY in
        1)
            echo "Iniciando monitoreo de uso de ancho de banda..."
            # Aquí se añade el modulo 
            ;;
        2)
            echo "Registrando tráfico de red..."
            # Aquí se añade el modulo 
            ;;
        3)
            echo "Detectando dispositivos en la red..."
            # Aquí se añade el modulo 
            ;;
        4)
            echo "Analizando rendimiento de la red..."
            # Aquí se añade el modulo 
            ;;
        5)
            echo "Generando reporte..."
            # Aquí se añade el modulo 
            ;;
        6)
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción no válida. Intenta de nuevo."
            ;;
    esac
    echo "Presiona [Enter] para continuar..."
    read
done
