{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf610
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 library(ShortRead)\
# Establecer directorio de trabajo\
setwd("~/Desktop/TemporalEnsamble/Fastq")\
# Especificar la carpeta donde se encuentran los archivos FASTQ\
folder_path <- "~/Desktop/TemporalEnsamble/Fastq"\
# Obtener la lista de archivos FASTQ en la carpeta\
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)\
numfiles <- length(file_list)\
# Crear un objeto vac\'edo para almacenar los datos\
Num <- 1\
reads_list <- list()\
# Iterar sobre la lista de archivos y leer los datos FASTQ\
for (file in file_list) \{\
  print(paste("Tarea", Num, "- Hora de inicio:", Sys.time()))\
  nombre <- c()\
  texto <- basename(file)\
  nombref <- paste0("Procesados/Archivo_", Num, "_", texto)\
  reads <- readFastq(file)\
  reads_list[[Num]] <- reads\
  output_file <- nombref\
  writeFastq(reads, output_file)\
  Num <- Num + 1\
\}\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 # << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 library(ShortRead)\
setwd("~/Desktop/TemporalEnsamble/Fastq")\
# Especificar la carpeta donde se encuentran los archivos FASTQ\
folder_path <- "~/Desktop/TemporalEnsamble/Fastq"\
# Obtener la lista de archivos FASTQ en la carpeta\
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)\
num_files <- length(file_list)\
# Crear una lista vac\'eda para almacenar los datos\
read_list <- list()\
# Iterar sobre la lista de archivos y leer los datos FASTQ\
for (i in 1:num_files) \{\
  file <- file_list[i]\
  print(paste("Tarea", i, "- Hora de inicio:", Sys.time()))\
  # Leer el archivo FASTQ y almacenarlo en una variable\
  reads <- readFastq(file)\
  # Guardar los datos en la lista\
  read_list[[i]] <- reads\
\}\
# Ejemplo de acceso a los datos de un archivo FASTQ espec\'edfico\
primer_archivo <- read_list[[1]]\
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> \
library(ShortRead)\
# Establecer el directorio de trabajo\
setwd("~/Desktop/TemporalEnsamble/Fastq")\
# Especificar la carpeta donde se encuentran los archivos FASTQ\
folder_path <- "~/Desktop/TemporalEnsamble/Fastq"\
# Obtener la lista de archivos FASTQ en la carpeta\
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)\
numfiles <- length(file_list)\
# Crear un objeto vac\'edo para almacenar los datos\
reads_list <- list()\
# Iterar sobre la lista de archivos y leer los datos FASTQ\
for (file in file_list) \{\
  # Imprimir informaci\'f3n de tarea y hora de inicio\
  print(paste("Tarea", numfiles, "- Hora de inicio:", Sys.time()))\
  # Obtener el nombre del archivo\
  nombre <- basename(file)  \
  # Leer los datos FASTQ\
  reads <- readFastq(file)\
  # Almacenar los datos en una variable en memoria\
  reads_list[[numfiles]] <- reads  \
  # Incrementar el contador de tarea\
  numfiles <- numfiles - 1\
\}\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 # << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> \
library(ShortRead)\
setwd("~/Desktop/TemporalEnsamble/Fastq")\
# Especificar la carpeta donde se encuentran los archivos FASTQ\
folder_path <- "~/Desktop/TemporalEnsamble/Fastq"\
# Obtener la lista de archivos FASTQ en la carpeta\
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)\
num_files <- length(file_list)\
# Crear una lista para almacenar los datos\
read_list <- list()\
# Iterar sobre la lista de archivos y leer los datos FASTQ\
for (i in 1:num_files) \{\
  file <- file_list[i]\
  print(paste("Tarea", i, "- Hora de inicio:", Sys.time()))\
  reads <- readFastq(file)\
  read_list[[i]] <- reads\
\}\
# Ejemplo de acceso a los datos de cada archivo\
for (i in 1:num_files) \{\
  reads <- read_list[[i]]\
  print(paste("Datos del archivo", i))\
  print(reads)\
\}\
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> \
\
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> }