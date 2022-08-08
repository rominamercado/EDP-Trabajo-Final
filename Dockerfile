#Utilizamos como base la imagen de la última versión de ubuntu
FROM ubuntu

#Indicamos los creadores del contenedor
MAINTAINER ROMINA_GASTON

#Definimos bash como shell ya que por defecto usa sh
SHELL ["/bin/bash", "-c"]

#Se lesolicita a ubuntu que haga una actualizaciòn de los repositorios
RUN apt-get update

#Instala locales (-y: para que se acepte todo los comandos(yes))
RUN apt-get -y install -y locales locales-all
ENV LC_ALL es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES.UTF-8

#Creamos la carpeta que almacenará los archivos de textos
RUN mkdir /texto

#Copiamos todos los Scripts
ADD ["OptionsMenu.sh", "statsWords.sh", "statsUsageWords.sh", "findNames.sh", "statsSentences.sh", "blankLinesCounter.sh", "caseConverter.sh", "substringReplace.sh", "blockSelection.sh", "palindromeDetection.sh", "./"]

#Ejecutamos el menú
ENTRYPOINT ["./OptionsMenu.sh"]



