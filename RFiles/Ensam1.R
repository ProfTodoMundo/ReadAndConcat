# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
# Obtener la lista de archivos FASTQ
files <- list.files(pattern = "*.fastq")

# Abrir el archivo de salida
outfile <- file("merged.fastq", "w")

# Iterar sobre cada archivo FASTQ
for (filename in files) {
  # Leer el contenido del archivo FASTQ y escribirlo en el archivo de salida
  infile <- file(filename, "r")
  while (length(line <- readLines(infile, n = 1)) > 0) {
    writeLines(line, outfile)
  }
  
  # Cerrar el archivo de entrada
  close(infile)
}

# Cerrar el archivo de salida
close(outfile)

# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
# Instalar y cargar el paquete Bioconductor Biostrings
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Biostrings")
library(Biostrings)

# Obtener la lista de archivos FASTQ
fastq_files <- list.files(pattern = "*.fastq")

# Archivo de salida para el FASTQ unido
merged_fastq <- "merged.fastq"

# Unir los archivos FASTQ en uno solo
outfile <- file(merged_fastq, "w")
for (fastq_file in fastq_files) {
  infile <- file(fastq_file, "r")
  while (length(line <- readLines(infile, n = 1)) > 0) {
    writeLines(line, outfile)
  }
  close(infile)
}
close(outfile)

# Nombre del archivo de salida (SAM)
sam_output <- "alignment.sam"

# Cargar el archivo FASTQ unido
fastq_data <- readDNAStringSet(merged_fastq, format = "fastq")

# Realizar la alineación utilizando el archivo de referencia
alignment <- alignPattern(reference_file, fastq_data)

# Guardar el resultado en formato SAM
writeXStringSet(alignment, sam_output, format = "SAM")
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
# Instalar y cargar el paquete Bioconductor Biostrings
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Biostrings")
library(Biostrings)

# Archivo de referencia genómica en formato FASTA
reference_file <- "referencia_genomica.fasta"

# Lista de archivos FASTQ a alinear
fastq_files <- c("archivo1.fastq", "archivo2.fastq", ..., "archivo24.fastq")

# Realizar la alineación para cada archivo FASTQ
for (fastq_file in fastq_files) {
  # Nombre del archivo de salida (SAM)
  sam_output <- gsub(".fastq", ".sam", fastq_file)
  
  # Cargar el archivo FASTQ
  fastq_data <- readDNAStringSet(fastq_file, format = "fastq")
  
  # Realizar la alineación utilizando el archivo de referencia
  alignment <- alignPattern(reference_file, fastq_data)
  
  # Guardar el resultado en formato SAM
  writeXStringSet(alignment, sam_output, format = "SAM")
}

# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>

# Instalar y cargar el paquete Bioconductor Biostrings
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Biostrings")
library(Biostrings)
library(progress)

# Archivo de referencia genómica en formato FASTA
reference_file <- "referencia.fasta"

# Obtener la lista de archivos FASTQ
fastq_files <- list.files(pattern = "*.fastq")

# Archivo de salida para el FASTQ unido
merged_fastq <- "merged.fastq"

# Unir los archivos FASTQ en uno solo con barra de progreso
pb <- progress_bar$new(total = length(fastq_files), format = "[:bar] :percent")
outfile <- file(merged_fastq, "w")
for (fastq_file in fastq_files) {
  infile <- file(fastq_file, "r")
  while (length(line <- readLines(infile, n = 1)) > 0) {
    writeLines(line, outfile)
  }
  close(infile)
  pb$tick()
}
close(outfile)

# Nombre del archivo de salida (SAM)
sam_output <- "alignment.sam"

# Cargar el archivo FASTQ unido
fastq_data <- readDNAStringSet(merged_fastq, format = "fastq")

# Realizar la alineación utilizando el archivo de referencia con barra de progreso
pb <- progress_bar$new(total = length(fastq_data), format = "[:bar] :percent")
alignment <- alignPattern(reference_file, fastq_data, callback = function(x) {
  pb$tick()
})

# Guardar el resultado en formato SAM
writeXStringSet(alignment, sam_output, format = "SAM")
