# << == >>  << == >>  << == >>  << == >>  << == >>  << == >>  << == >>  << == >> 
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble")
# << == >>  << == >>  << == >>  << == >>  << == >>  << == >>  << == >>  << == >> 
# Instalar Bioconductor si no está instalado
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
# Instalar el paquete "ShortRead" desde Bioconductor
BiocManager::install("ShortRead")
# Instalar el paquete si no está instalado
if (!requireNamespace("Rsamtools", quietly = TRUE))
  install.packages("Rsamtools")
# Instalar el paquete si no está instalado
if (!requireNamespace("R.utils", quietly = TRUE))
  install.packages("R.utils")
# Instalar el paquete si no está instalado
if (!requireNamespace("data.table", quietly = TRUE))
  install.packages("data.table")
# Instalar Bioconductor si no está instalado
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
# Instalar el paquete "GenomicFiles" desde Bioconductor
BiocManager::install("GenomicFiles")
# Instalar Bioconductor si no está instalado
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
# Instalar el paquete "BiocFileCache" desde Bioconductor
BiocManager::install("BiocFileCache")
# Instalar el paquete si no está instalado
if (!requireNamespace("readfq", quietly = TRUE))
  install.packages("readfq")
# << == >>  << == >>  << == >>  << == >>  << == >>  << == >>  << == >>  << == >> 
# Cargar el paquete
library(Rsamtools)
# Leer el archivo Fastq.gz
reads <- readFastq("cdc5_1_S9_R1_001.fastq")
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
# Cargar el paquete
library(data.table)
# Leer el archivo Fastq.gz
reads <- fread(cmd = "U2AF84_2_S14_R2_001.fastq")
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
# Cargar el paquete
library(R.utils)
# Leer el archivo Fastq.gz
reads <- readFastqGz("UmasM_1_S17_R1_001.fastq")
# Cargar el paquete
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
library(ShortRead)
# Leer el archivo Fastq.gz
reads <- readFastq("Fastq/cdc5_S9_R1_001.fastq")
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
# Cargar el paquete
library(readfq)
# Leer el archivo Fastq
reads <- readfq("UmasM_1_S17_R2_001.fastq")
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
# Cargar el paquete
library(BiocFileCache)
# Crear un caché del archivo Fastq.gz
cache <- BiocFileCache("UmasM_2_S18_R1_001.fastq")
# Leer el archivo Fastq.gz desde el caché
reads <- readFastq(cache)
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
# Cargar el paquete
library(GenomicFiles)
# Crear un archivo GenomicFile para el archivo Fastq.gz
file <- file(paste("UmasM_2_S18_R2_001.fastq", sep = ""))
# Leer el archivo Fastq.gz
reads <- readFastq(file)
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 

#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
#  - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - - - - -   - - - - 
