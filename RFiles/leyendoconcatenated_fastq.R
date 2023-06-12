# Instalar el paquete 'ShortRead' si no está instalado
#install.packages("ShortRead")

# Cargar el paquete 'ShortRead'
library(ShortRead)

# Ruta al archivo FASTQ
ruta_archivo <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/Procesados/concatenated.fastq"

# Leer el archivo FASTQ
reads <- readFastq(ruta_archivo)

# Imprimir la información de cada lectura
for (i in 1:length(reads)) {
  lectura <- reads[[i]]
  cat("Lectura", i, ":\n")
  cat("Secuencia:", lectura$seq, "\n")
  cat("Calidad  :", lectura$qual, "\n\n")
}