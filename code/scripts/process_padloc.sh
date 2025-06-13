#!/bin/bash

INPUT_DIR="../"
OUTPUT_DIR="../"
PADLOC_DIR="${INPUT_DIR}padloc_"
mkdir -p "$PADLOC_DIR"
padloc --fna "${INPUT_DIR}isolates_combined_cut.fasta" --outdir "$PADLOC_DIR" --cpu 4

awk -F',' 'BEGIN {OFS="\t"} NR > 1 {
    split($2, seqid, "_");
    start = seqid[3] + $12;
    end = seqid[3] + $13;
    print seqid[1] "_" seqid[2], start, end, $3, $6, $14
}' "${PADLOC_DIR}/isolates_combined_cut_3.fasta_padloc.csv" > "${OUTPUT_DIR}padloc_cut_2.txt"

sort "${OUTPUT_DIR}padloc_cut_2.txt" | uniq > "${OUTPUT_DIR}padloc_cut_uniq_2.txt"

bedtools intersect -a "${OUTPUT_DIR}padloc_cut_uniq_2.txt" \
                  -b "${OUTPUT_DIR}coords_invertons_uniq.txt" \
                  -wa -wb > "${OUTPUT_DIR}intersect_padloc.txt"

wc -l "${OUTPUT_DIR}padloc_cut_2.txt"
wc -l "${OUTPUT_DIR}padloc_cut_uniq_2.txt"
wc -l "${OUTPUT_DIR}intersect_padloc.txt"
cat "${OUTPUT_DIR}intersect_padloc.txt"