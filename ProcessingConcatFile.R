# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >>
library(R.utils)
library(R.oo)
library(Biostrings)
library(Rsamtools)
library(ShortRead)
library(progress)
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >>
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/Ensamblando/FastqGzFiles")
folder_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/Ensamblando/FastqGzFiles"
ruta_archivo <- "~/Nextcloud/NubeGralCarlos/ElisaProject/Ensamblando/FastqGzFiles"
file <- "concatenacion.fastq.gz"
archivo <- "concatenacion.fastq.gz"
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >>
# INTENTO 3
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >>
lectura <- readFastq(ruta_archivo)

# Paso 3: Obtener el tamaño total del archivo
tamano_total <- file.info(ruta_archivo)$size

# Paso 4: Configurar la barra de progreso
pb <- progress_bar$new(total = tamano_total, format = "[:bar] :percent :eta")

# Paso 5: Leer el archivo FASTQ.gz y actualizar la barra de progreso
on_chunk_read <- function(chunk) {pb$tick(nchar(chunk))}
lectura <- readFastq(ruta_archivo, on_chunk_read = on_chunk_read)

# Paso 6: Finalizar la barra de progreso
pb$close()

# Paso 7: Realizar las operaciones necesarias con la lectura
# (por ejemplo, procesar los datos o extraer información)

# Paso 8: Continuar con el resto de tu código
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >>
# INTENTO 1
# Paso 4: Leer el archivo FASTQ.gz
lectura <- readFastq(ruta_archivo)
# Paso 5: Extraer la información de las lecturas
num_lecturas <- length(lectura)  # Obtener el número total de lecturas
# Mostrar información de cada lectura
for (i in 1:num_lecturas) {
  cat("Lectura", i, ":\n")
  # Obtener la secuencia
  secuencia <- as.character(quality(lectura)[[i]])
  cat("Secuencia: ", secuencia, "\n")
  # Obtener la calidad
  calidad <- as.character(quality(lectura)[[i]])
  cat("Calidad: ", calidad, "\n")
  cat("\n")
}
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >>
# INTENTO 2
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >>
# Obtener el tamaño del archivo en bytes
file_size <- file.size(file)
# Crear un objeto de archivo para lectura
con <- gzfile(file, "rb")
# Contador para el número de registros leídos
read_count <- 0
# Loop para leer los registros del archivo
while (length(line <- readLines(con, n = 4)) == 4) {
  read_count <- read_count + 1; # Incrementar el contador de registros
  file_position <- gzcon(con)$position; # Calcular el porcentaje de avance
  progress <- file_position / file_size * 100; # Mostrar el porcentaje de avance
}
close(con); # Cerrar el archivo
cat("Total de registros leídos:", read_count, "\n"); # Mostrar el número total de registros leídos
