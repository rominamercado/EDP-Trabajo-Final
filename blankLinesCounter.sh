#! /bin/bash

#Contamos las lìneas que se encuentran vacias con el comando grep opcion c.
echo "El archivo de texto contiene $(grep -c '^$' ./texto.txt) lineas en blanco"

exit 1

