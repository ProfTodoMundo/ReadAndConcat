# Instalar Bioconductor si no está instalado
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")}
#BiocManager::install("ShortRead")
# Cargar la biblioteca ShortRead
library(ShortRead)
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq")
#setwd("~/Desktop/TemporalEnsamble/Fastq")
# Especificar la carpeta donde se encuentran los archivos FASTQ
folder_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq"
# Obtener la lista de archivos FASTQ en la carpeta
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)
numfiles <- length(file_list)
# Crear un objeto Vacío para almacenar los datos
Num <- 1; reads <- c();
# Iterar sobre la lista de archivos y leer los datos FASTQ
for (file in file_list) {
  print(paste("Tarea", Num, "- Hora de inicio:", Sys.time()))
  nombre <- c();  texto <- basename(file)
  nombref <- paste0("Procesados/Archivo_",Num,"_",texto)
  reads <- readFastq(file);   
  output_file <- nombref
  writeFastq(reads, output_file);  Num <- Num +1;
}

setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq")

# Obtener la lista de archivos FASTQ en la carpeta
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)
num_files <- length(file_list)
# Crear una lista para almacenar los datos
read_list <- list()
# Iterar sobre la lista de archivos y leer los datos FASTQ
for (i in 1:num_files) {
  file <- file_list[i]
  print(paste("Tarea", i, "- Hora de inicio:", Sys.time()))
  reads <- readFastq(file)
  texto <- basename(file)
  nombref <- paste0("Procesados/Archivo_",i,"_",texto)
  read_list[[i]] <- reads
  output_file <- nombref
  writeFastq(reads, output_file)
}



setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq")

# Obtener la lista de archivos FASTQ en la carpeta
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)
num_files <- length(file_list)
# Crear una lista para almacenar los datos
read_list <- list()
# Iterar sobre la lista de archivos y leer los datos FASTQ
for (i in 8:num_files) {
  file <- file_list[i]
  print(paste("Tarea", i, "- Hora de inicio:", Sys.time()))
  reads <- readFastq(file)
  texto <- basename(file)
  nombref <- paste0("Procesados/Archivo_",i,"_",texto)
  read_list[[i]] <- reads
  output_file <- nombref
  writeFastq(reads, output_file)
}

read_list2 <- list()
# Iterar sobre la lista de archivos y leer los datos FASTQ
for (i in 8:num_files) {
  file <- file_list[i]
  print(paste("Tarea", i, "- Hora de inicio:", Sys.time()))
  reads <- readFastq(file)
  texto <- basename(file)
  nombref <- paste0("Procesados/Archivo_",i,"_",texto)
  read_list2[[i]] <- reads
  output_file <- nombref
  writeFastq(reads, output_file)
}


## Ahora se van a concatenar
# Ruta a la carpeta que contiene los archivos FASTQ
carpeta <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Procesados2"
#setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Procesados2")
# Obtener la lista de archivos FASTQ en la carpeta
archivos <- list.files(path = carpeta, pattern = ".fastq$", full.names = TRUE)
# Definir el tamaño del bloque (por ejemplo, 4 archivos por bloque)
tamano_bloque <- 2

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

# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
# Ruta de la carpeta que contiene los archivos FASTQ
ruta_carpeta <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/Procesados"
# Obtiene los nombres de los archivos FASTQ en la carpeta
archivos <- list.files(path = ruta_carpeta, pattern = "\\.fastq$", full.names = TRUE)
# Crea un archivo de salida para almacenar la concatenación
archivo_salida <- "concatenacion.fastq"
# Inicializa el contador de líneas y el porcentaje completado
lineas_totales <- 0
total_lineas <- sum(sapply(archivos, function(archivo) {
  con <- file(archivo, "r")
  lineas <- length(readLines(con))
  close(con)
  lineas
}))
porcentaje_completado <- 0
# Itera sobre los archivos y realiza la concatenación
for (archivo in archivos) {
  print(paste("Tarea - Hora de inicio:", Sys.time()))
  # Abre el archivo de entrada en modo de lectura
  con <- file(archivo, "r")
  # Abre el archivo de salida en modo de escritura (si no existe, se crea)
  if (file.exists(archivo_salida)) {
    con_salida <- file(archivo_salida, "a")
  } else {
    con_salida <- file(archivo_salida, "w")
  }
  # Lee cada línea del archivo de entrada y escríbela en el archivo de salida
  while (length(linea <- readLines(con, n = 1)) > 0) {
    cat(linea, "\n", file = con_salida)
    lineas_totales <- lineas_totales + 1
    # Calcula el porcentaje completado
    porcentaje_completado <- lineas_totales / total_lineas * 100
    # Actualiza la barra de progreso
    cat("\r[", paste(rep("=", porcentaje_completado), collapse = ""), ">",
        paste(rep(" ", 100 - porcentaje_completado), collapse = ""), "]",
        sep = "")
  }
  # Cierra los archivos
  close(con)
  close(con_salida)
}

# Imprime un mensaje de finalización
cat("\nLa concatenación se ha completado.\n")

# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
