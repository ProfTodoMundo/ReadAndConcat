import gzip

def parse_fastq_file(file_path):
    sequences = []
    with gzip.open(file_path, 'rt') as file:
        lines = file.readlines()
        num_lines = len(lines)
        for i in range(0, num_lines, 4):
            header = lines[i].rstrip()
            sequence = lines[i + 1].rstrip()
            quality = lines[i + 3].rstrip()
            sequences.append((header, sequence, quality))
    return sequences

# Ruta al archivo concatenado comprimido
file_path = '~/Nextcloud/NubeGralCarlos/ElisaProject/NuevoProyecto/TemporalEnsamble/Fastq/Procesados/concatenated.fastq'


# Llamada a la función para parsear el archivo FASTQ
parsed_sequences = parse_fastq_file(file_path)

# Ejemplo de acceso a la información
for header, sequence, quality in parsed_sequences:
    print("Header:", header)
    print("Sequence:", sequence)
    print("Quality:", quality)
    print()