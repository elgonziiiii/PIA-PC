#!/bin/bash

#Instalar comando dos2unix y usarlo "dos2unix escaneos.sh"
# Función para mostrar el menú 
mostrar_menu() {
  echo "   Menu de Escaneo de Puertos"
  echo "1) Escanear un rango de puertos"
  echo "2) Escanear puertos comunes (21, 22, 80, 443)"
  echo "3) Salir"
}

# Función para escanear un puerto específico
escanear_puerto() {
  local host=$1
  local puerto=$2

  timeout 1 bash -c "echo > /dev/tcp/$host/$puerto" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Puerto $puerto está abierto"
  else
    echo "Puerto $puerto está cerrado"
  fi
}

# Función para escanear un rango de puertos
escanear_rango() {
  read -p "Ingresa la dirección IP o dominio a escanear: " host
  read -p "Ingresa el rango de puertos a escanear (ejemplo: 1-1024): " rango_puertos

  IFS="-" read inicio fin <<< "$rango_puertos"
  for (( puerto=inicio; puerto<=fin; puerto++ )); do
    escanear_puerto $host $puerto
  done
}

# Función para escanear puertos comunes
escanear_comunes() {
  read -p "Ingresa la dirección IP o dominio a escanear: " host
  puertos_comunes=(21 22 80 443)

  for puerto in "${puertos_comunes[@]}"; do
    escanear_puerto $host $puerto
  done
}

# Bucle principal
while true; do
  mostrar_menu
  read -p "Elige una opción: " opcion

  case $opcion in
    1)
      escanear_rango
      ;;
    2)
      escanear_comunes
      ;;
    3)
      echo "Saliendo del programa..."
      exit 0
      ;;
    *)
      echo "Opción no válida. Inténtalo de nuevo."
      ;;
  esac
done
