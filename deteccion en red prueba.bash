#!/bin/bash
 
# Inicializa una lista para los hosts activos
hosts_activos=()
 
# Bucle para escanear los hosts
for i in {1..255}; do
    if timeout 2 ping -c 1 127.0.0.$i >/dev/null 2>&1; then
        echo "El host 127.0.0.$i está activo"
        # Agrega el host a la lista de hosts activos
        hosts_activos+=("127.0.0.$i")
    fi
done
 
# Imprime la lista de hosts activos al final
echo -e "\nDispositivos conectados a la red local:"
for host in "${hosts_activos[@]}"; do
    echo "$host"
done
