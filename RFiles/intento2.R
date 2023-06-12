# <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>> <<==>>
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
  for (archivo in archivos) {
    # Abre el archivo de entrada en modo de lectura
    con <- file(archivo, "r")
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

Archivo1 <- "Archivo_1_cdc5_1_S9_R1_001.fastq"     
Archivo2 <- "Archivo_10_EhMyb10_1_S11_R2_001.fastq"
Archivo3 <- "Archivo_11_EhMyb10_2_S12_R1_001.fastq"
Archivo3 <- "Archivo_12_EhMyb10_2_S12_R2_001.fastq"
Archivo5 <- "Archivo_13_pEhEx_2_S8_R1_001.fastq"   
Archivo6 <- "Archivo_14_pEhEx_2_S8_R2_001.fastq"   
Archivo7 <- "Archivo_15_pEhEx1_S7_R1_001.fastq"    
Archivo8 <- "Archivo_16_pEhEx1_S7_R2_001.fastq"    
Archivo9 <- "Archivo_17_U2AF84_1_S13_R1_001.fastq" 
Archivo10 <- "Archivo_18_U2AF84_1_S13_R2_001.fastq" 
Archivo11 <- "Archivo_19_U2AF84_2_S14_R1_001.fastq" 
Archivo12 <- "Archivo_2_cdc5_1_S9_R2_001.fastq"     
Archivo13 <- "Archivo_20_U2AF84_2_S14_R2_001.fastq" 
Archivo14 <- "Archivo_21_UmasM_1_S17_R1_001.fastq"  
Archivo15 <- "Archivo_22_UmasM_1_S17_R2_001.fastq"  
Archivo16 <- "Archivo_23_UmasM_2_S18_R1_001.fastq"  
Archivo17 <- "Archivo_24_UmasM_2_S18_R2_001.fastq"  
Archivo18 <- "Archivo_3_cdc5_2_S10_R1_001.fastq"    
Archivo19 <- "Archivo_4_cdc5_2_S10_R2_001.fastq"    
Archivo20 <- "Archivo_5_CmasM_1_S15_R1_001.fastq"   
Archivo21 <- "Archivo_6_CmasM_1_S15_R2_001.fastq"   
Archivo22 <- "Archivo_7_CmasM_2_S16_R1_001.fastq"   
Archivo23 <- "Archivo_8_CmasM_2_S16_R2_001.fastq"   
Archivo24 <- "Archivo_9_EhMyb10_1_S11_R1_001.fastq" 
#Ejemplo de uso de la función
archivos <- c(Archivo1, Archivo2)
archivo_salida <- "concatenacion.fastq"
concatenar_fastq(archivos, archivo_salida)
