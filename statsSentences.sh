#! /bin/bash


#########################################################################
#
# Script statsSentences.sh: calcula los indicadores estadísticos de 
# longitud de oraciones y los informa como resultado: 
#   1. Longitud mínima de palabra
#   2. Longitud máxima de palabra
#   3. Longitud promedio de palabras
#
# La resolución utiliza los comdandos tr y sed de bash para obtener
# una oración por línea, las cuales son almacenadas en el archivo
# oraciones.txt.
# Se recorre el archivo oraciones.txt y se calcula la longitud de cada
# oración, se actualizan los valores de longitud máxima, mínima,
# el acumulador suma y el contador de oraciones.
#  
# El texto a analizar se debe seleccionar de la carpeta texto.
#
#########################################################################


# El programa acumula los valores de longitud a medida que recorre el archivo, es por eso que necesitamos eliminar el archivo longitud al incio. De esta manera, nos aseguramos que el archivo contenga el resultado de la corrida vigente.
# Para evitar el mesaje de error en la primera corrida en la que el archivo longitud.txt todavìa no existe redireccionamos el error de inexistencia al fichero error.

rm longitud.txt 2>error.log

#Tomamos el texto con el que trabajaremos, reemplazamos cada punto por un salto línea, eliminamos el espacio del inicio con sed 's/^[[:space:]]*//', eliminamos las líneas en blanco con sed '/^$/d', y por último le agregamos el punto de cada oración al final.
cat ./texto/$1 | tr '.' '\n' | sed 's/^[[:space:]]*//' | sed '/^$/d' | sed 's/$/./' > oraciones.txt

#Tomamos el archivo limpio, que contiene en cada línea una oración. Por medio del comando wc -m obtenemos la longitud de cada oración, la que se guarda en el archivo longitud.
while IFS= read -r line
do
        echo -n $line | wc -m >> longitud.txt
done < oraciones.txt

#Obtenida la longitud de cada oración (archivo longitud), estamos en condiciones de calcular los indicadores
#Inicializamos las variables
CONT=0
SUM=0

#Recorremos el archivo longitud línea por línea
while IFS= read -r line
do
	#En cada línea recorrida almacenamos el contenido de la línea (longitud de oración) en la variable VAL
	VAL=$(echo -n $line)

        #Si es la primera línea, el contador es cero, por ende ingresa en este bloque y almacena en las variables MIN y MAX la longitud oración de la primera línea del archivo longitud, luego actualiza las variables CONT Y SUM
        if [[ $CONT -eq 0 ]]
        then
                MIN=$VAL
                MAX=$VAL
                SUM=$((SUM+VAL))
                CONT=$((CONT+1))
		#Si no es la primera línea, el contador es mayor a 0, por ende ingresa en este bloque y de acuerdo al valor longitud contenido en la línea activa(VAL) y al valor almacenado en MIN/MAX actualiza la variable MIN/MAX, luego los contadores y acumuladores.
	else
                if [[ $VAL -lt $MIN ]]
                then
                        SUM=$((SUM+VAL))
                        CONT=$((CONT+1))
                        MIN=$VAL
                elif [[ $VAL -gt $MAX ]]
                then
                        SUM=$((SUM+VAL))
                        CONT=$((CONT+1))
                        MAX=$VAL
                #Si el valor de la línea no es ni menor a MIN ni mayor a MAX, solo actualiza las variables SUM y CONT
		else
                        SUM=$((SUM+VAL))
                        CONT=$((CONT+1))

                fi
        fi

done < longitud.txt
echo -e "\nA continuación se muestran los indicadores estadísticos de longitud de las oraciones de $1 \n"
echo "Longitud Máxima:      $MAX caracteres"
echo "Longitud Mínima:      $MIN caracteres"
echo "Longitud promedio:    $((SUM/CONT)) caracteres"

