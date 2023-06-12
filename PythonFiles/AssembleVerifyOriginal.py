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
        "cdc5_1_S9_R1_001.fastq.gz",
        "cdc5_1_S9_R2_001.fastq.gz",
        "cdc5_2_S10_R1_001.fastq.gz",
        "cdc5_2_S10_R2_001.fastq.gz",
        "CmasM_1_S15_R1_001.fastq.gz",
        "CmasM_1_S15_R2_001.fastq.gz",
        "CmasM_2_S16_R1_001.fastq.gz",
        "CmasM_2_S16_R2_001.fastq.gz",
        "EhMyb10_1_S11_R1_001.fastq.gz",
        "EhMyb10_1_S11_R2_001.fastq.gz",
        "EhMyb10_2_S12_R1_001.fastq.gz",
        "EhMyb10_2_S12_R2_001.fastq.gz",
        "pEhEx_2_S8_R1_001.fastq.gz",
        "pEhEx_2_S8_R2_001.fastq.gz",
        "pEhEx1_S7_R1_001.fastq.gz",
        "pEhEx1_S7_R2_001.fastq.gz",
        "U2AF84_1_S13_R1_001.fastq.gz",
        "U2AF84_1_S13_R2_001.fastq.gz",
        "U2AF84_2_S14_R1_001.fastq.gz",
        "U2AF84_2_S14_R2_001.fastq.gz",
        "UmasM_1_S17_R1_001.fastq.gz",
        "UmasM_1_S17_R2_001.fastq.gz",
        "UmasM_2_S18_R1_001.fastq.gz",
        "UmasM_2_S18_R2_001.fastq.gz"
    ]

    output_file = "concatenatedorigin.fastq.gz"
    concatenate_fastq_files(filenames, output_file)
    verify_file(output_file)
