#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun  9 09:14:59 2023

@author: todomundomx
"""
import gzip

# Nombre del archivo generado
output_file = "concatenated.fastq.gz"

# Leer el archivo generado
with gzip.open(output_file, 'rb') as file:
    # Leer líneas del archivo
    lines = file.readlines()

# Imprimir la cantidad total de líneas en el archivo
total_lines = len(lines)
print("Total de líneas en el archivo:", total_lines)

# Imprimir las primeras 10 líneas del archivo
print("Primeras 10 líneas:")
for line in lines[:10]:
    print(line.decode().strip())

# Imprimir la última línea del archivo
print("Última línea:")
print(lines[-1].decode().strip())