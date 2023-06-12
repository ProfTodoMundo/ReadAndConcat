# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
library(ShortRead)
library(ggplot2)
# <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>>
# read fastq file
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/Ensamblando/concatenados/")
fq <- readFastq('~/Nextcloud/NubeGralCarlos/ElisaProject/Ensamblando/concatenados/concatenatedorigin.fastq.gz')

head(fq)
summary(fq)
# look the dna sequences
reads <- as(read(fq), "DNAStringSet")
widths <- as.data.frame(width(reads))
ggplot(widths) +
  geom_histogram(aes(x = V1))

# Grafica las puntuaciones de calidad
quals <- quality(fq)
numqscores <- as.matrix(quals)
avgscore <- rowMeans(numqscores, na.rm = TRUE)
avgscore <- as.data.frame(avgscore)
ggplot(avgscore) +
  geom_histogram(aes(x = avgscore))
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
library(ShortRead)
library(Biostrings)
library(Rsubread)
# Ruta al archivo Fastq.gz
file_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/Ensamblando/concatenados/concatenatedorigin.fastq.gz"
# Ruta al archivo Fastq.gz
# Configurar parámetros para la lectura del archivo Fastq.gz
params <- list(
  file = file_path,
  batchsize = 10000,   # Tamaño del lote (batch size)
  forceGC = TRUE       # Liberar memoria después de procesar cada lote
)

# Obtener el número total de secuencias en el archivo Fastq.gz
total_sequences <- countFastq(file_path)

# Crear un indicador de progreso
pb <- progress_bar$new(total = total_sequences, format = "[:bar] :percent :eta")

# Inicializar un contador para el número de secuencias leídas
num_sequences <- 0

# Leer el archivo Fastq.gz en lotes y procesar cada lote
while (TRUE) {
  # Leer el siguiente lote del archivo Fastq.gz
  batch <- readFastq(file_path, nreads = params$batchsize)
  
  # Comprobar si se ha llegado al final del archivo
  if (length(batch) == 0) {
    break
  }
  
  # Realizar las operaciones deseadas con el lote de secuencias
  # ...
  
  # Actualizar el contador de secuencias leídas
  num_sequences <- num_sequences + length(batch)
  
  # Actualizar el indicador de progreso
  pb$tick(length(batch))
  
  # Liberar memoria (opcional)
  rm(batch)
  gc()
}

# Finalizar y mostrar el indicador de progreso completo
pb$close()

# Verificar el número total de secuencias leídas
print(num_sequences)