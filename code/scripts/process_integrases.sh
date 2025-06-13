#!/bin/bash

INPUT_DIR="../"
OUTPUT_DIR="../"

grep -o '^[^\t]*' "${INPUT_DIR}SearchResults-integrase.tsv" > "${OUTPUT_DIR}accs_int.txt"

awk '/[0-9]/' "${OUTPUT_DIR}accs_int.txt" > "${OUTPUT_DIR}filtered_accs_int.txt"
sed 's/ .*//' "${OUTPUT_DIR}filtered_accs_int.txt" > "${OUTPUT_DIR}final_accs_int.txt"
awk '/[0-9]/' "${OUTPUT_DIR}final_accs_int.txt" > "${OUTPUT_DIR}ffif.txt"
awk -F '\t' '{gsub(/\$/, ""); print $1}' "${OUTPUT_DIR}ffif.txt" > "${OUTPUT_DIR}accesions_integrases.txt"

grep -F -f "${OUTPUT_DIR}accesions_integrases.txt" "${INPUT_DIR}results.txt" > "${OUTPUT_DIR}matched_lines.txt"

awk -F '\t' '{print $1}' "${INPUT_DIR}intersect_deffinder_uniq.tsv" > "${OUTPUT_DIR}invs_wdefsys_ids.txt"
grep -F -f "${OUTPUT_DIR}invs_wdefsys_ids.txt" "${OUTPUT_DIR}matched_lines.txt" > "${OUTPUT_DIR}if_invertases.txt"

wc -l "${OUTPUT_DIR}accesions_integrases.txt"
wc -l "${OUTPUT_DIR}matched_lines.txt"
wc -l "${OUTPUT_DIR}if_invertases.txt"

head -n 2 "${OUTPUT_DIR}if_invertases.txt"