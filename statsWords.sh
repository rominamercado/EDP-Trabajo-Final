#! /bin/bash

#########################################################################
#
# Script statsWords.sh: calcula los indicadores estadísticos de longitud 
# de palabras de un archivo de texto, devolviendo como resultado 3
# valores numéricos:
#  1. Longitud mínima de palabras en el texto
#  2. Longitud máxima de palabras en el texto
#  3. Longitud promedio de palabras en el texto 
#
# La resolución se basa en el armado de una lista que contiene las palabras
# que conforman el archivo de texto. 
# El programa permite almacenar las longitudes MAX y MIN que aparecen
# en el listado e incrementa las variables SUM y CONT para obtener al 
# finalizar, la longitud promedio de longitud de palabras. 
# Consideramos palabras a aquellas cuya longitud es mayor a 2.
#
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################


# Imprimimos el texto con el comando CAT y lo guardamos en la variable TEXTO
TEXTO=$(cat ./texto/$1)

# Convertimos el texto en una lista de palabras (separador ' ')
palabras=(${TEXTO//' '/ })

# Inicializamos las variables necesarias para obtener los indicadores estadísticos
SUMA=0
CONT=0

#Recorremos la lista con la sentencia FOR:
for i in "${palabras[@]}"
do
        #Eliminamos para cada palabra: comas, puntos, puntos y comas, espacios inciales,signos de pregunta y de admiración
	PAL=$(echo -n "$i" | sed -e 's/\.//g' -e's/,//g' -e's/\!//g' -e's/;//g' -e's/\¡//g' -e 's/^[[:space:]]//g' -e 's/\?//g' -e 's/\¿//g')
	
        #Calculamos la longitud de la palabra
	LON=$(echo ${#PAL})

	#Si la longitud de la palabra es menor igual a 2 -> ignoramos
        if [ $LON -le 2 ]
	then
		continue
	# Si la longitud es mayor a 2 continuamos:
	else
		# Con la primera palabra de longitud mayor a 2,actualizamos las variables:
		if [ $CONT -eq 0 ]
		then
			MIN=$(echo ${#PAL})
			MAX=$(echo ${#PAL})
			#Actualizamos el valor de las variables
			SUMA=$((LON+SUMA))
			CONT=$((CONT+1))
		else
			#Si no es la primera palabra de longitud mayor a 2, evaluamos si es necesario actualizar MAX y MIN
			if [[ $LON -lt $MIN ]]; then MIN=$LON; fi
			if [[ $LON -gt $MAX ]]; then MAX=$LON; fi
			#Actualizamos SUMA y CONT para todas las palabras de longitud mayor a 2
			SUMA=$((LON+SUMA))
                        CONT=$((CONT+1))
		fi

	fi
done

#Calculamos la longitud promedio de palabras:
PROM=$((SUMA/CONT))

#Imprimimos los resultados:
echo -e "\nA continuación se muestran los indicadores estadísticos de longitud palabras encontradas en $1"
echo "Longitud Mínima:   $MIN caracteres" 
echo "Longitud Máxima:   $MAX caracteres"
echo "Longitud Promedio: $PROM caracteres"

