library(data.table)

parse_fastq_file <- function(file_path) {
  sequences <- list()
  con <- file(file_path, "r")
  while (length(lines <- readLines(con, n = 4)) > 0) {
    header <- lines[1]
    sequence <- lines[2]
    quality <- lines[4]
    sequences <- c(sequences, list(list(header = header, sequence = sequence, quality = quality)))
  }
  close(con)
  return(sequences)
}

# Ruta al archivo concatenado
file_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/concatenated.fastq"

# Llamada a la función para parsear el archivo FASTQ
parsed_sequences <- parse_fastq_file(file_path)

# Ejemplo de acceso a la información
for (sequence in parsed_sequences) {
  cat("Header:", sequence$header, "\n")
  cat("Sequence:", sequence$sequence, "\n")
  cat("Quality:", sequence$quality, "\n\n")
}

# Obtener la longitud de las secuencias
parsed_sequences$seq_length <- nchar(parsed_sequences$sequence)

# Gráfico de barras de la distribución de longitudes de secuencia
ggplot(parsed_sequences, aes(x = seq_length)) +
  geom_histogram(binwidth = 10, fill = "lightblue", color = "black") +
  labs(title = "Distribución de Longitudes de Secuencia", x = "Longitud de Secuencia", y = "Frecuencia")


if (!requireNamespace("Rsubread", quietly = TRUE)) {
  install.packages("Rsubread")
}

#
# ESTA PARTE ES PARA ALINEAR
# 
library(Rsubread)

# Ruta al archivo Fastq
file_path <- "ruta/al/archivo.fastq"

# Ruta al genoma de referencia (archivo de índice de Rsubread)
index_path <- "ruta/al/genoma_de_referencia"

# Alineación de las secuencias Fastq con el genoma de referencia
align <- align(index = index_path, readfile1 = file_path, output_format = "BAM", nthreads = 4)

# Cuantificación de la expresión génica
featureCounts <- featureCounts(files = align$bam, annot.ext = "ruta/al/anotaciones.gtf", isGTFAnnotationFile = TRUE)

# Resultados de la cuantificación de la expresión génica
counts <- featureCounts$counts