#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun  9 01:46:53 2023

@author: todomundomx
"""

import gzip
import matplotlib.pyplot as plt
from Bio import SeqIO

# Ruta al archivo FASTQ congcatenado
file_path = '/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/FastqGz/Procesados/concatenated.fastq.gz'

# Leer el archivo FASTQ comprimido
sequences = []
with gzip.open(file_path, 'rt') as handle:
    for record in SeqIO.parse(handle, 'fastq'):
        sequences.append(record)

# Mostrar los primeros 6 registros del archivo
for record in sequences[:6]:
    print(record.id)
    print(record.seq)

# Generar histograma de longitudes de secuencia
seq_lengths = [len(record.seq) for record in sequences]
plt.hist(seq_lengths, bins=10, color='skyblue', edgecolor='black')
plt.xlabel('Longitud de secuencia')
plt.ylabel('Frecuencia')
plt.title('Histograma de longitudes de secuencia')
plt.show()

# Generar boxplot de longitudes de secuencia
plt.boxplot(seq_lengths)
plt.ylabel('Longitud de secuencia')
plt.title('Boxplot de longitudes de secuencia')
plt.show()
