#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jun  8 22:43:56 2023

@author: todomundomx
"""

import sys
import os
import gzip
from datetime import datetime


def concatenate_fastq_files(folder_path, output_file):
    # Obtener la lista de archivos en la carpeta
    file_list = os.listdir(folder_path)

    # Filtrar solo los archivos con extensión .fastq.gz
    fastq_files = [file for file in file_list if file.endswith('.fastq.gz')]

    # Ordenar los archivos alfabéticamente
    fastq_files.sort()

    start_time = datetime.now()
    total_files = len(fastq_files)

    with open(output_file, 'wb') as output:
        for i, file_name in enumerate(fastq_files, 1):
            file_path = os.path.join(folder_path, file_name)
            with gzip.open(file_path, 'rb') as input_file:
                while True:
                    data = input_file.read(1024)
                    if data:
                        output.write(data)
                    else:
                        break

            # Calcular el porcentaje de avance
            progress = (i / total_files) * 100
            print('Procesado {}/{} archivos ({:.2f}%)'.format(i, total_files, progress))

    end_time = datetime.now()
    elapsed_time = end_time - start_time
    print('\nTiempo total de ejecución: {}'.format(elapsed_time))


# Obtener los argumentos de línea de comandos
if len(sys.argv) != 3:
    print('Uso: python script.py carpeta_salida archivo_salida.fastq.gz')
else:
    carpeta = sys.argv[1]
    archivo_salida = sys.argv[2]

    concatenate_fastq_files(carpeta, archivo_salida)
