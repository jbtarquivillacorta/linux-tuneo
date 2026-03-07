target=$( cat ~/.config/bin/target )

if [ "$target" != "" ];then
  echo "$target"
else
  echo "Sin Targeta"
fi
