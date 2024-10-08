#!/bin/bash

source ./monitoreo.bash
source ./trafico_red.sh
source ./dispositivos.bash 
source ./rendimiento_red.sh

clear
echo "================================="
echo "        Menú Principal           "
echo "================================="

PS3="Ingresa un Numero: "

select opcion in "Monitoreo de uso de ancho de banda"  "Registro de tráfico de red"  "Detección de dispositivos en la red"  "Análisis de rendimiento de la red"  "Salir"
do
    case $REPLY in
        1)
            echo "Iniciando monitoreo de uso de ancho de banda..."
            monitoreo
            ;;
        2)
            echo "Registrando trafico de red..."
            trafico_red
            ;;
        3)
            echo "Detectando dispositivos en la red..."
            escaneo
            ;;
        4)
            echo "Analizando rendimiento de la red..."
            analizar_rendimiento_red
            ;;
        5)
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opcion no valida. Intenta de nuevo."
            ;;
    esac
    echo "Presiona [Enter] para continuar..."
    read
done
