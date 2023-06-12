# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", dependencies = TRUE, ask = FALSE)
# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>
BiocManager::install("Rsamtools", ask = FALSE, update = TRUE)
BiocManager::install("GenomicAlignments", ask = FALSE, update = TRUE)
BiocManager::install("ShortRead", ask = FALSE, update = TRUE)
# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>
library(ShortRead)
library(GenomicAlignments)
library(Rsamtools)
# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>
setwd("~/Desktop/TemporalEnsamble/FastqGz")a
# Ruta de la carpeta que contiene los archivos fastq.gz
carpeta <- "~/Desktop/TemporalEnsamble/FastqGz"
# Obtener la lista de archivos fastq.gz en la carpeta
archivos <- list.files(carpeta, pattern = ".fastq.gz$", full.names = TRUE)
wtime <- 0.25*60
# Leer y descomprimir los archivos
for (i in seq_along(archivos)) {
  archivo <- archivos[i]
  # Obtener el nombre del archivo sin la extensión .gz
  archivo_descomprimido <- gsub(".gz$", "", archivo)
  # Leer y descomprimir el archivo
  fq <- readFastq(archivo, param = ScanBamParam(gz = TRUE))
  # Guardar el archivo descomprimido
  writeFastq(fq, archivo_descomprimido)
  # Imprimir el nombre del archivo descomprimido y el número de iteración
  cat("Iteración", i, "- Archivo descomprimido:", archivo_descomprimido, "\n")
  # Pausa de 5 minutos
  Sys.sleep(wtime)
}
# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>
setwd("~/Desktop/TemporalEnsamble/FastqGz")
carpeta <- "~/Desktop/TemporalEnsamble/FastqGz"
archivos <- list.files(carpeta, pattern = ".fastq.gz$", full.names = TRUE)
wtime <- 0.25 * 60
i <- 1
for (i in seq_along(archivos)) {
  archivo <- archivos[i]
  archivo_descomprimido <- gsub(".gz$", "", archivo)
  
  # Leer y descomprimir el archivo FASTQ
  fq <- readFastq(archivo, full = TRUE)
  
  # Guardar el archivo descomprimido
  writeFastq(fq, file = archivo_descomprimido)
  
  cat("Iteración", i, "- Archivo descomprimido:", archivo_descomprimido, "\n")
  
  # Pausa de 5 minutos
  Sys.sleep(wtime)
}
# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>

setwd("~/Desktop/TemporalEnsamble/FastqGz")

carpeta <- "~/Desktop/TemporalEnsamble/FastqGz"
archivos <- list.files(carpeta, pattern = ".fastq.gz$", full.names = TRUE)
wtime <- 0.25 * 60

for (i in seq_along(archivos)) {
  archivo <- archivos[i]
  archivo_descomprimido <- gsub(".gz$", "", archivo)
  # Leer y descomprimir el archivo
  fq <- readGAlignments(archivo)
  # Guardar el archivo descomprimido
  writeFastq(fq, file = archivo_descomprimido)
  cat("Iteración", i, "- Archivo descomprimido:", archivo_descomprimido, "\n")
  # Pausa de 5 minutos
  Sys.sleep(wtime)
}
# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>