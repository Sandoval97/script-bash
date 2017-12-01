#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
if [ $# -gt 1 -o $# -eq 0 ]
then
	echo Este programa solo acepta un directorio como parametro
elif test -s $1
    then
	cd $1
	variable=`ls -a`
	echo Los tamaños de fichero sin letra de medidia se interpretan como bytes
	echo -e "\n\nNombre\t\t\t\tTamaño"
	for s in $variable
	do
		SAVEIFS=$IFS
		IFS=$(echo -en "\n\b")
		nueva=`du -bsh $s`
		IFS=$SAVEIFS
		v=`expr $s : '.*'`
		for x in $nueva
		do
			#echo $x $s
			b=`expr $x : '.*'`
			if [ $b -le 6 ]
			then
				tam=`echo ${x:0:3}`	
				if [ $v -ge 18 ]
				then
					echo -e "$s----------$tam"
				elif [ $v -ge 4 -a $v -le 6 ]
				   then
					echo -e "$s------------------------ $tam"
				   else
					echo -e "$s------------------------ $tam"
				fi
			else
				c=$x
				cero=`echo ${x:0:1}`
				if [ $cero -eq 0 ]
				then
					if [ $v -ge 18 ]
					then
						echo -e "$s---------- $cero Bytes"
					elif [ $v -ge 4 -a $v -le 6 ]
					   then
						echo -e "$s------------------------ $cero Bytes"
					   else
						echo -e "$s------------------------ $cero Bytes"
					fi
				else
					tam=`echo ${c:0:4}`
					if [ $v -ge 18 ]
					then
						echo -e "$s---------- $tam"
					elif [ $v -ge 4 -a $v -le 6 ]
					   then
						echo -e "$s------------------------ $tam"
					   else
						echo -e "$s------------------------ $tam"
					fi
				fi	
			fi
		done
	done
else
	echo No existe ese directorio
fi

