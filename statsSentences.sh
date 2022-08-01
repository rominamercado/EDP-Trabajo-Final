#! /bin/bash

#Eliminamos el archivo longitud, ya que en cada corrida acumulamos los resultados. De esta manera, nos asegurarnos que contenga el resultado de la corrida vigente. En caso de no existir el archivo redireccionamos el error de inexistencia al fichero error.
rm longitud.txt 2>error.log

#Tomamos el texto con el que trabajaremos, reemplazamos cada punto por un salto linea, eliminamos el espacio del inicio con sed 's/^[[:space:]]*//', eliminamos las lìneas en blanco con sed '/^$/d', y por ultimo le agregamos el punto de cada oracion al final.
cat ./texto.txt | tr '.' '\n' | sed 's/^[[:space:]]*//' | sed '/^$/d' | sed 's/$/./' > oraciones.txt

#Tomamos el archivo limpio, que contiene en cada linea una oracion. Por medio del comando wc -m obtenemosla longitud de cada oracion, la que se guarda en el archivo longitud.
while IFS= read -r line
do
        echo -n $line | wc -m >> longitud.txt
done < oraciones.txt

#Obtenida la longitud de cada oracion (archivo longitud), estamos en condiciones de calcular los indicadores
#Inicializamos las variables
CONT=0
SUM=0

#Recorremos el archivo longitud linea por linea
while IFS= read -r line
do
	#En cada linea recorrida almacenamos el contenido de la linea(longitud de oracion) en la variable VAL
	VAL=$(echo -n $line)

        #Si es la primera linea, el contador es cero, por ende ingresa en este bloque y almacena en las variables MIN y Max el valor longitud de oracion que contiene la primera linea del archivo longitud, luego actualiza las variables CONT Y SUM
        if [[ $CONT -eq 0 ]]
        then
                MIN=$VAL
                MAX=$VAL
                SUM=$((SUM+VAL))
                CONT=$((CONT+1))
		#Si no es la primera linea, el contador es mayor a 0, por ende ingresa en este bloque y de acuerdo al valor del contenido en la linea activa y al valor almacena en MIN y VAR actualiza esas variables, luego las iniciales (CONT y SUM)
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
                #Si el valor de la linea no es ni menor a MIN ni mayor a MAX, solo actualiza las variables SUM y CONT
		else
                        SUM=$((SUM+VAL))
                        CONT=$((CONT+1))

                fi
        fi

done < longitud.txt
echo "A continuaciòn se muestran los indicadores estadisticos de las oraciones del archivo txt"
echo "Longitud maxima: $MAX"
echo "Longitud minima: $MIN"
echo "Longitud promedio: $((SUM/CONT))"

