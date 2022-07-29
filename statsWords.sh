#! /bin/bash
#1. statsWords.sh Indicador estadístico de longitud de palabras (la más corta, la más larga y el promedio de longitud).

#Imprimimos el texto y lo guardamos en TEXTO
TEXTO=$(cat $1)

#echo $TEXTO
#Convertimos el texto en una lista de palabras (separador ' ')
palabras=(${TEXTO//' '/ })

#Inicializamos las variables necesarias para obtener los indicadores estadísticos
SUMA=0
CONT=0
MIN=$(echo ${#palabras[0]})
MAX=$(echo ${#palabras[0]})

#Recorremos la lista con la sentencia FOR:
for i in "${palabras[@]}"
do
        #Eliminamos loscaracteres que no pertenecen a las palabras . y ,
	CAD=$(echo $i | tr "." "\n")
        CAD=$(echo $CAD | tr "," "\n")
        
	#Calculamos la longitud de la palabra
	LON=$(echo ${#CAD})
        
	#Actualizamos el valor de las variables
	SUMA=$((LON+SUMA))
        CONT=$((CONT+1))
        #echo $LON $SUMA $CONT
        if [[ $LON -lt $MIN ]]; then MIN=$LON; fi
        if [[ $LON -gt $MAX ]]; then MAX=$LON; fi
        #echo "MINIMO:$MIN MAXIMO:$MAX"
        if [[ $LON -lt $MIN ]]; then MIN=$LON; fi
        if [[ $LON -gt $MAX ]]; then MAX=$LON; fi
        #echo "MINIMO:$MIN MAXIMO:$MAX"
done
#Calculamos el promedio:
PROM=$((SUMA/CONT))

#Imprimimos los resultados:
echo "A continuación, se muestran los indicadores de longitud de cada palabra encontrada en el archivo $1:"

echo "Longitud Mínima: $MIN"
echo "Longitud Máxima: $MAX"
echo "Longitud Promedio: $PROM"

