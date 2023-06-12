# Cargar los paquetes necesarios
library(ShortRead)
library(R.utils)

# Ruta de la carpeta que contiene los archivos fastq.gz
carpeta <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/FastqGz"

# Obtener la lista de archivos fastq.gz en la carpeta
archivos <- list.files(carpeta, pattern = ".fastq.gz$", full.names = TRUE)

# Crear una función para procesar cada archivo individualmente
procesar_archivo <- function(archivo) {
  print(paste("Inicio de la iteración:", Sys.time()))
  datos <- readFastq(archivo)
  secuencias <- sread(datos)
  calidades <- quality(datos)
  gc()  # Liberar la memoria utilizada
  return(list(secuencias = secuencias, calidades = calidades))
}

# Crear una lista para almacenar los resultados
resultados_lista <- list()

# Iterar sobre la lista de archivos y procesar cada archivo individualmente
for (archivo in archivos) {
  resultados <- procesar_archivo(archivo)
  resultados_lista <- append(resultados_lista, resultados)
}

# Concatenar las secuencias y las calidades de todos los archivos en listas separadas
secuencias_lista <- lapply(resultados_lista, function(resultado) resultado$secuencias)
calidades_lista <- lapply(resultados_lista, function(resultado) resultado$calidades)

# Combinar todas las secuencias y calidades en un solo vector
secuencias <- unlist(secuencias_lista)
calidades <- unlist(calidades_lista)
