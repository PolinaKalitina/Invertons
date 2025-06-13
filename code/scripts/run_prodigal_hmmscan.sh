#!/bin/bash

INPUT_DIR="../"
OUTPUT_DIR="../"

prodigal -i "${INPUT_DIR}isolates_combined_cut.fasta" \
         -o "${OUTPUT_DIR}isolates_proteins.gbk" \
         -a "${OUTPUT_DIR}isolates_proteins_prodigal.faa" \
         -p meta

hmmscan --domtblout "${OUTPUT_DIR}domains_genome_coords.tsv" \
        ./Pfam/Pfam-A.hmm \
        "${OUTPUT_DIR}isolates_proteins_prodigal.faa"

ls -lh "${OUTPUT_DIR}isolates_proteins_prodigal.faa"
ls -lh "${OUTPUT_DIR}domains_genome_coords.tsv"