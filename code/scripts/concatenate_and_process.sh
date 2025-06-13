#!/bin/bash

INPUT_DIR="../LR_assemblies"
OUTPUT_DIR="../"
TEMP_DIR="../temp"

mkdir -p "$TEMP_DIR"

cat "${INPUT_DIR}"/*.fasta.gz > "${TEMP_DIR}/concatenated_NEW.fasta.gz"

zcat "${TEMP_DIR}/concatenated_NEW.fasta.gz" | \
    grep '^>' | \
    cut -d ' ' -f 1 | \
    sed 's/^>//' > "${TEMP_DIR}/sequence_ids_fasta_gz.txt"

awk -F '[:|-]' 'NR > 1 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5}' \
    "${INPUT_DIR}/41586_2024_7970_MOESM7.txt" > "${TEMP_DIR}/contigs_cut.txt"

cut -f 1-5 "${TEMP_DIR}/contigs_cut.txt" > "${OUTPUT_DIR}/contigs_cutcut.txt"
cut -f 1 "${OUTPUT_DIR}/contigs_cutcut.txt" > "${OUTPUT_DIR}/ids_cut.txt"

grep -F -x -f "${OUTPUT_DIR}/ids_cut.txt" \
    "${TEMP_DIR}/sequence_ids_fasta_gz.txt" > "${OUTPUT_DIR}/what.txt"

# rm -rf "$TEMP_DIR"

wc -l "${OUTPUT_DIR}/what.txt"