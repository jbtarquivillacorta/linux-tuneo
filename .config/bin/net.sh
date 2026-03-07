#!/bin/sh
interfaz=enp0s17

existe=$( /usr/sbin/ifconfig $interfaz 2>&1 | head -n 1 | awk '{print $2}' )
ip=""

if [ "$existe" != "error" ];then 
  ip=$( /usr/sbin/ifconfig $interfaz 2>&1 | grep -w inet | awk '{print $2}' );
fi

if [ -n "$ip" ];then
  echo "$ip";
else
  echo "Desconectado";
fi
