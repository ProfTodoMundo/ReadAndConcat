# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")}
#BiocManager::install("ShortRead")
# Cargar la biblioteca ShortRead
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
library(ShortRead)
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/FastqGz")
#setwd("~/Desktop/TemporalEnsamble/Fastq")
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
# Especificar la carpeta donde se encuentran los archivos FASTQ
folder_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/FastqGz"
# Obtener la lista de archivos FASTQ en la carpeta
file_list <- list.files(folder_path, pattern = ".fastq", full.names = TRUE)
numfiles <- length(file_list)
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
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
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >>
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> 
library(readr)
library(ggplot2)
library(Rsamtools)
library(ShortRead)
library(data.table)
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> 
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/FastqGz/Procesados")
aarchivo <- "concatenated.fastq.gz" 
datos <- read_delim(aarchivo, delim = "\n", col_names = FALSE)
# << == >> << == >> << == >> << == >> << == >> << == >> << == >> << == >> 
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>




# Visualizar los primeros 6 registros del archivo
head(data)

# Generar histograma de longitudes de secuencia
seq_lengths <- nchar(data$X1)
ggplot(data.frame(lengths = seq_lengths), aes(x = lengths)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(x = "Longitud de secuencia", y = "Frecuencia") +
  ggtitle("Histograma de longitudes de secuencia")

# Generar boxplot de longitudes de secuencia
ggplot(data.frame(lengths = seq_lengths), aes(y = lengths)) +
  geom_boxplot() +
  labs(y = "Longitud de secuencia") +
  ggtitle("Boxplot de longitudes de secuencia")

# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
library(Rsamtools)
library(ShortRead)
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/FastqGz/Procesados")
# Paso 2: Definir la ruta completa al archivo FASTQ.gz
# 
folder_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/FastqGz/Procesados"
# Obtener la lista de archivos FASTQ en la carpeta
file_list <- list.files(folder_path, pattern = ".fastq.gz", full.names = TRUE)
numfiles <- length(file_list)
ruta_archivo <- file_list
# Paso 3: Leer el archivo FASTQ.gz
lectura <- readFastq(ruta_archivo)
# Paso 4: Extraer la información de las lecturas
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