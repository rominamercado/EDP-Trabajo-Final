#! /bin/bash

#########################################################################
#
# Script blockSelection.sh: Permite seleccionar una oración y/o párrafo 
# en base a un número de entrada. Es decir,se puede establecer como 
# entrada “O” o “P” para indicar oración o párrafo y luego un número 
# (un párrafo se distingue de otro con un punto y aparte, las
# oraciones vía un punto seguido). 
#
# Los usuarios deberán ingresar valores:
#   1. Opción: 1 -Párrafo  / 2 -Oración
#   2. Número: para indicar el número de párrafo u oración a imprimir
#
# La resolución utiliza diferentes comandos de bash para obtener lo
# solicitado. el resultado se imprime en pantalla.
#
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################

#Incluimos el menú de opciones dentro de una sentencia while para asegurarnos que los usuarios ingrese una opción correcta.
T='true'
while T='true'
do
	PS3='Elija una opción: '
	echo "Desea imprimir una Oración o un Párrafo"
	select opcion in "Párrafo" "Oración" "Salir"
	do
		if [ $REPLY == 1 ]
		then
			T='false'
			read -p "Ingrese el número de párrafo que desee imprimir: " NUM
			
			# Calculamos el número de párrafos:
                        # 1. sed '/^$/d': Elimina las líneas en blanco del txt
			# 2. grep -nc '\.$': la opción -nc imprime el número de líneas que terminan en un punto y aparte (párrafo)
                        ULT_PAR=$(cat ./texto/$1 | sed '/^$/d' | grep -nc '\.$')
			
                        # Analizamos la existencia del párrafo:
			if [[ $ULT_PAR -lt $NUM ]]
			then
				echo "No existe el párrafo $NUM en el archivo $1"
			else
				echo "A continuación se imprime el párrafo $NUM del archivo $1"
				#grep -n -m$NUM '\.$': Filtramos los [NUM] párrafos. (-n:agrega el num. de línea) (-m[NUM]: indica hasta qué línea imprimir) 
				#grep '^'$NUM':.*': Filtra e imprime la línea que posee el párrafo [NUM]
				cat ./texto/$1 | sed '/^$/d' | grep -n -m$NUM '\.$' | grep '^'$NUM':.*'
			fi
		elif [ $REPLY == 2 ]
		then
			T='false'
			read -p "Ingrese el número de oración que desee imprimir: " NUM
			#Creamos result1.txt para almacenar en cada línea una oración.
			cat ./texto/$1 | tr '.' '\n' > resul1.txt
			# sed 's/^[[:space:]]*//': eliminamos posibles espacios inciales en todas las sed líneas.
			# sed '/^$/d': Eliminamos las líneas en blanco
			# sed 's/$/./': le agregamos el punto final de la oración que suprimió tr '.' '\n'.
			cat resul1.txt | sed 's/^[[:space:]]*//' | sed '/^$/d' | sed 's/$/./' > res2.txt
			
			# Caculamos el número de líneas que hay en el archivo res2.txt (cada línea almacena una las oración)
			LIN=$(wc -l < res2.txt)

			#Validamos que el numero ingresado sea menor al número de oraciones que contienen el archivo.
			if [[ $LIN -lt $NUM ]]
			then
				echo "No existe la oración número $NUM en el archivo $1"
			else
				echo "La oración número $NUM del archivo $1 es:"
				#Imprime el texto de la línea indicada [NUM] -> las líneas se corresponden con las oraciones.
				sed ''$NUM'q;d' res2.txt
			fi
		elif [ $REPLY == 3 ]
		then
			T='false'
			echo "Hasta luego!"
			exit 1
		else
			echo "Debe seleccionar una opción válida"
			T='true'
		fi
	done
done
