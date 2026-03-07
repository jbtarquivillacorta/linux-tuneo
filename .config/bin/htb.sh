#!/bin/sh

i1=tun0
i2=enp0s8
ip=""

existe1=$( /usr/sbin/ifconfig $i1 2>&1 | head -n 1 | awk '{print $2}' )
existe2=$( /usr/sbin/ifconfig $i2 2>&1 | head -n 1 | awk '{print $2}' )

if [ "$existe1" != "error" ];then
  ip=$( /usr/sbin/ifconfig $i1 | grep -w inet | awk '{print $2}')
elif [ "$existe2" != "error" ]; then
  ip=$( /usr/sbin/ifconfig $i2 | grep -w inet | awk '{print $2}')
fi

if [ -n "$ip" ];then 
  echo "$ip";
else
  echo "Desconectado";
fi
