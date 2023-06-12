import os
import sys
import shutil

def concatenate_fastq_files(filenames, output_file):
    with open(output_file, 'wb') as outfile:
        for filename in filenames:
            with open(filename, 'rb') as infile:
                shutil.copyfileobj(infile, outfile)

if __name__ == "__main__":
    filenames = [
        "Archivo_1_cdc5_1_S9_R1_001.fastq",
        "Archivo_10_EhMyb10_1_S11_R2_001.fastq",
        "Archivo_11_EhMyb10_2_S12_R1_001.fastq",
        "Archivo_12_EhMyb10_2_S12_R2_001.fastq",
        "Archivo_13_pEhEx_2_S8_R1_001.fastq",
        "Archivo_14_pEhEx_2_S8_R2_001.fastq",
        "Archivo_15_pEhEx1_S7_R1_001.fastq",
        "Archivo_16_pEhEx1_S7_R2_001.fastq",
        "Archivo_17_U2AF84_1_S13_R1_001.fastq",
        "Archivo_18_U2AF84_1_S13_R2_001.fastq",
        "Archivo_19_U2AF84_2_S14_R1_001.fastq",
        "Archivo_2_cdc5_1_S9_R2_001.fastq",
        "Archivo_20_U2AF84_2_S14_R2_001.fastq",
        "Archivo_21_UmasM_1_S17_R1_001.fastq",
        "Archivo_22_UmasM_1_S17_R2_001.fastq",
        "Archivo_23_UmasM_2_S18_R1_001.fastq",
        "Archivo_24_UmasM_2_S18_R2_001.fastq",
        "Archivo_3_cdc5_2_S10_R1_001.fastq",
        "Archivo_4_cdc5_2_S10_R2_001.fastq",
        "Archivo_5_CmasM_1_S15_R1_001.fastq",
        "Archivo_6_CmasM_1_S15_R2_001.fastq",
        "Archivo_7_CmasM_2_S16_R1_001.fastq",
        "Archivo_8_CmasM_2_S16_R2_001.fastq",
        "Archivo_9_EhMyb10_1_S11_R1_001.fastq"
    ]
    
    output_file = "concatenated.fastq"
    concatenate_fastq_files(filenames, output_file)
