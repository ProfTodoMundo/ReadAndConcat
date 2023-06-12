# Instalar Bioconductor si no está instalado
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
#BiocManager::install("ShortRead")

# Cargar la biblioteca ShortRead
library(ShortRead)
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq")
# Especificar la carpeta donde se encuentran los archivos FASTQ
folder_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq"



# Obtener la lista de archivos FASTQ en la carpeta
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)

numfiles <- length(file_list)
# Crear un objeto Vacío para almacenar los datos
Num <- 1;
reads <- c()
# Iterar sobre la lista de archivos y leer los datos FASTQ
for (file in file_list) {
  nombre <- c()
  texto <- basename(file)
  nombref <- paste0("Procesados/Archivo_",Num,"_",texto)
  reads <- readFastq(file)
  output_file <- nombref
  writeFastq(reads, output_file)
#  print(file_list[file])
  Num <- Num +1;
}

## Ahora se van a concatenar


# Instalar y cargar el paquete ShortRead

# Ruta a la carpeta que contiene los archivos FASTQ
carpeta <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/Procesados"

# Obtener la lista de archivos FASTQ en la carpeta
archivos <- list.files(path = carpeta, pattern = "\\.fastq$", full.names = TRUE)

# Definir el tamaño del bloque (por ejemplo, 4 archivos por bloque)
tamano_bloque <- 4

# Bucle para ensamblar los archivos en bloques
for (i in seq(1, length(archivos), tamano_bloque)) {
  # Obtener los archivos del bloque actual
  archivos_bloque <- archivos[i:(i + tamano_bloque - 1)]
  
  # Leer los archivos FASTQ del bloque actual
  reads_bloque <- lapply(archivos_bloque, readFastq)
  
  # Combinar los reads de los archivos del bloque actual
  reads_combined <- do.call(c, reads_bloque)
  
  # Realizar el ensamblaje del bloque actual
  assembled_reads <- assemble(reads_combined)
  
  # Hacer algo con el ensamblaje (por ejemplo, guardar los resultados)
  # ...
  
  # Imprimir información sobre el bloque actual
  cat("Ensamblaje completado para los archivos:", paste(archivos_bloque, collapse = ", "), "\n")
}

