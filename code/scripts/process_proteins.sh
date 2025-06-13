#!/bin/bash

INPUT_DIR="../"
OUTPUT_DIR="../"

grep '^>' "${INPUT_DIR}isolates_proteins_prodigal.faa" | sed 's/^>//' > "${OUTPUT_DIR}isolates_proteins_coords_interm.txt"

awk -F'[ #]+' '{
    split($1, a, "_"); 
    start_pos = a[3]; 
    abs_start = $2 + start_pos; 
    abs_end = $3 + start_pos; 
    print a[1] "_" a[2] "\t" abs_start "\t" abs_end "\t" $4 "\t" $1
}' "${OUTPUT_DIR}isolates_proteins_coords_interm.txt" > "${OUTPUT_DIR}isolates_proteins_coords.txt"

bedtools intersect -a "${OUTPUT_DIR}isolates_proteins_coords.txt" \
                  -b "${OUTPUT_DIR}coords_invertons_uniq.txt" \
                  -wa -wb > "${OUTPUT_DIR}intersect_prots.txt"

grep -F -f <(awk '{print $3}' "${OUTPUT_DIR}intersect_prots.txt") \
     "${INPUT_DIR}results.txt" > "${OUTPUT_DIR}intersected_prots.txt"

wc -l "${OUTPUT_DIR}isolates_proteins_coords.txt"
wc -l "${INPUT_DIR}results.txt"
wc -l "${OUTPUT_DIR}intersected_prots.txt"