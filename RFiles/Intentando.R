library(ShortRead)
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/Procesados")
folder_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/Procesados"
file_list <- list.files(pattern = ".fastq", full.names = TRUE)
numfiles <- length(file_list)
# Crea una función para la concatenación de archivos FASTQ
concatenar_fastq <- function(archivos, archivo_salida) {
  # Abre el archivo de salida en modo de escritura
  con_salida <- file(archivo_salida, "w")
  # Itera sobre los archivos y realiza la concatenación
  for (i in seq_along(archivos)) {
    archivo <- archivos[i]
    # Abre el archivo de entrada en modo de lectura
    con <- file(archivo, "r")
    # Muestra la hora de inicio de la iteración
    print(paste("Inicio de la iteración", i, "- Hora de inicio:", Sys.time()))
    #cat("Inicio de la iteración", i, ":", Sys.time(), "\n")
    # Copia el contenido del archivo de entrada al archivo de salida
    while (length(linea <- readLines(con, n = 1)) > 0) {
      cat(linea, "\n", file = con_salida)
    }
    # Cierra el archivo de entrada
    close(con)
  }
  # Cierra el archivo de salida
  close(con_salida)
  # Imprime un mensaje de finalización
  cat("La concatenación se ha completado.\n")
}

Archivo1 <- "Archivo_1_cdc5_1_S9_R1_001.fastq";      Archivo2 <- "Archivo_10_EhMyb10_1_S11_R2_001.fastq"
Archivo3 <- "Archivo_11_EhMyb10_2_S12_R1_001.fastq"; Archivo4 <- "Archivo_12_EhMyb10_2_S12_R2_001.fastq"
Archivo5 <- "Archivo_13_pEhEx_2_S8_R1_001.fastq";    Archivo6 <- "Archivo_14_pEhEx_2_S8_R2_001.fastq"   
Archivo7 <- "Archivo_15_pEhEx1_S7_R1_001.fastq";     Archivo8 <- "Archivo_16_pEhEx1_S7_R2_001.fastq"    
Archivo9 <- "Archivo_17_U2AF84_1_S13_R1_001.fastq";  Archivo10 <- "Archivo_18_U2AF84_1_S13_R2_001.fastq" 
Archivo11 <- "Archivo_19_U2AF84_2_S14_R1_001.fastq"; Archivo12 <- "Archivo_2_cdc5_1_S9_R2_001.fastq"     
Archivo13 <- "Archivo_20_U2AF84_2_S14_R2_001.fastq"; Archivo14 <- "Archivo_21_UmasM_1_S17_R1_001.fastq"  
Archivo15 <- "Archivo_22_UmasM_1_S17_R2_001.fastq";  Archivo16 <- "Archivo_23_UmasM_2_S18_R1_001.fastq"  
Archivo17 <- "Archivo_24_UmasM_2_S18_R2_001.fastq";  Archivo18 <- "Archivo_3_cdc5_2_S10_R1_001.fastq"    
Archivo19 <- "Archivo_4_cdc5_2_S10_R2_001.fastq";    Archivo20 <- "Archivo_5_CmasM_1_S15_R1_001.fastq"   
Archivo21 <- "Archivo_6_CmasM_1_S15_R2_001.fastq";   Archivo22 <- "Archivo_7_CmasM_2_S16_R1_001.fastq"   
Archivo23 <- "Archivo_8_CmasM_2_S16_R2_001.fastq";   Archivo24 <- "Archivo_9_EhMyb10_1_S11_R1_001.fastq" 
# Archivos a concatenar
archivos <- c(Archivo1, Archivo2, Archivo3, Archivo4, Archivo5, Archivo6, 
              Archivo7, Archivo8, Archivo9,Archivo10, Archivo11, Archivo12,
              Archivo13, Archivo14, Archivo15, Archivo16, Archivo17,Archivo18, 
              Archivo19, Archivo20, Archivo21, Archivo22, Archivo23, Archivo24)
archivo_salida <- "concatenacion.fastq"
hora_inicio <- Sys.time()# Obtener la hora de inicio de la actividad
# Imprimir el indicador de inicio de la actividad
cat("# <<==>> <<==>> <<==>> <<==>>\n")
cat("Inicio de la actividad:", hora_inicio, "\n")
concatenar_fastq(archivos = archivos, archivo_salida = archivo_salida)
#concatenar_fastq(archivos, archivo_salida); # Llamar a la función para realizar la concatenación
hora_fin <- Sys.time(); # Obtener la hora de finalización de la actividad
cat("Fin de la actividad:", hora_fin, "\n"); # Imprimir el indicador de finalización de la actividad y la duración
cat("Duración:", hora_fin - hora_inicio, "\n")
# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
setwd("~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/Procesados")
folder_path <- "~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/Procesados"
file <- "concatenacion.fastq"
reads <- readFastq(file)