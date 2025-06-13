#!/bin/bash

INPUT_DIR="../"
OUTPUT_DIR="../"
DEFENSE_DIR="${INPUT_DIR}deffinder_"

if [ ! -d "$DEFENSE_DIR" ]; then
    defense-finder run "${INPUT_DIR}isolates_combined_cut.fasta" --out-dir "$DEFENSE_DIR"
fi

awk -F'\t' 'BEGIN {OFS="\t"} NR > 1 {print $2, $5, $3}' \
    "${DEFENSE_DIR}/isolates_combined_cut_3_defense_finder_genes.tsv" \
    > "${OUTPUT_DIR}annot_deffinder.txt"

awk -F' # ' 'BEGIN {OFS="\t"} {print $1, $2, $3}' \
    "${INPUT_DIR}matched_headers_.txt" \
    > "${OUTPUT_DIR}headrs_for_annot.txt"

sort -k1,1 "${OUTPUT_DIR}headrs_for_annot.txt" > "${OUTPUT_DIR}sorted_headrs_for_annot.txt"
sort -k1,1 "${OUTPUT_DIR}annot_deffinder.txt" > "${OUTPUT_DIR}sorted_annot_deffinder.txt"

join -1 1 -2 1 \
    "${OUTPUT_DIR}sorted_headrs_for_annot.txt" \
    "${OUTPUT_DIR}sorted_annot_deffinder.txt" | \
    awk 'BEGIN {OFS="\t"} {print $1, $2, $3, $4, $5}' \
    > "${OUTPUT_DIR}merged_file.tsv"

awk -F'\t' 'BEGIN {OFS="\t"} {
    split($1, id, "_");
    base_id = id[1] "_" id[2];
    offset = id[3];
    start = $2 + offset;
    end = $3 + offset;
    print base_id, start, end, $4, $5
}' "${OUTPUT_DIR}merged_file.tsv" > "${OUTPUT_DIR}updated_file.tsv"

wc -l "${DEFENSE_DIR}/isolates_combined_cut_3_defense_finder_genes.tsv"
wc -l "${OUTPUT_DIR}updated_file.tsv"
wc -l "${INPUT_DIR}intersect_deffinder.txt"
wc -l "${INPUT_DIR}intersect_deffinder_uniq.tsv"