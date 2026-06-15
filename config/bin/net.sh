#!/bin/bash

#funciones

existe_interfaz(){
  verificar=$( /usr/sbin/ifconfig $1 2>&1 | head -n 1 | awk '{print $2}' );

  if [ "$verificar" != "error" ];then
    return 0;
  fi

  return 1;
}

extraer_ip(){
  echo -n $( /usr/sbin/ifconfig $1 | grep -w inet | awk '{print $2}');
}


#main

interfaces=("enp1s0" "wlp2s0" "enx5ab568290841");
ip=""

for interfaz in "${interfaces[@]}";do

  if existe_interfaz "$interfaz";then #verifica si existe la interfaz
    ip=$(extraer_ip "$interfaz"); #extrae la ip
  fi

  if [ -n "$ip" ];then #verifica si la variable es distinto de vacio
    echo "$ip"
    break;
  fi

done

if [ -z "$ip" ];then 
  echo "Desconectado";
fi
