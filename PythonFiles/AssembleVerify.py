#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun  9 09:43:36 2023

@author: todomundomx
"""
import os
import sys
import shutil
import gzip

def concatenate_fastq_files(filenames, output_file):
    total_files = len(filenames)
    with open(output_file, 'wb') as outfile:
        for i, filename in enumerate(filenames, 1):
            with gzip.open(filename, 'rb') as infile:
                shutil.copyfileobj(infile, outfile)
            progress = (i / total_files) * 100
            sys.stdout.write('\r')
            sys.stdout.write(f"Progress: {progress:.2f}%")
            sys.stdout.flush()
    sys.stdout.write('\n')

def verify_file(filename):
    try:
        with gzip.open(filename, 'rb') as file:
            file.read(1)
        print("El archivo se generó correctamente.")
    except OSError:
        print("El archivo no se generó correctamente.")

if __name__ == "__main__":
    filenames = [
        "Archivo_1_cdc5_1_S9_R1_001.fastq.gz",
        "Archivo_2_cdc5_1_S9_R2_001.fastq.gz",
        "Archivo_3_cdc5_2_S10_R1_001.fastq.gz",
        "Archivo_4_cdc5_2_S10_R2_001.fastq.gz",
        "Archivo_5_CmasM_1_S15_R1_001.fastq.gz",
        "Archivo_6_CmasM_1_S15_R2_001.fastq.gz",
        "Archivo_7_CmasM_2_S16_R1_001.fastq.gz",
        "Archivo_8_CmasM_2_S16_R2_001.fastq.gz",
        "Archivo_9_EhMyb10_1_S11_R1_001.fastq.gz",
        "Archivo_10_EhMyb10_1_S11_R2_001.fastq.gz",
        "Archivo_11_EhMyb10_2_S12_R1_001.fastq.gz",
        "Archivo_12_EhMyb10_2_S12_R2_001.fastq.gz",
        "Archivo_13_pEhEx_2_S8_R1_001.fastq.gz",
        "Archivo_14_pEhEx_2_S8_R2_001.fastq.gz",
        "Archivo_15_pEhEx1_S7_R1_001.fastq.gz",
        "Archivo_16_pEhEx1_S7_R2_001.fastq.gz",
        "Archivo_17_U2AF84_1_S13_R1_001.fastq.gz",
        "Archivo_18_U2AF84_1_S13_R2_001.fastq.gz",
        "Archivo_19_U2AF84_2_S14_R1_001.fastq.gz",
        "Archivo_20_U2AF84_2_S14_R2_001.fastq.gz",
        "Archivo_21_UmasM_1_S17_R1_001.fastq.gz",
        "Archivo_22_UmasM_1_S17_R2_001.fastq.gz",
        "Archivo_23_UmasM_2_S18_R1_001.fastq.gz",
        "Archivo_24_UmasM_2_S18_R2_001.fastq.gz"
    ]

    output_file = "concatenated4.fastq.gz"
    concatenate_fastq_files(filenames, output_file)
    verify_file(output_file)
