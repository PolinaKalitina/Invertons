#!/bin/bash

BASE_DIR="../deffinder_global"
OUTPUT_FILE="../defense_systems_stats.tsv"

echo -e "Part\tTotal_Genes\tType_I_S_Count\tType_I_S_Percent" > "$OUTPUT_FILE"

for part in {1..5}; do
    file="${BASE_DIR}/part${part}/isolates_combined.part_00${part}_defense_finder_genes.tsv"
    
    total=$(wc -l < "$file")
    type_i_s=$(grep -c 'RM__Type_I_S' "$file")
    percent=$(awk -v a="$type_i_s" -v b="$total" 'BEGIN{printf "%.1f", a/b*100}')
    
    echo -e "part${part}\t${total}\t${type_i_s}\t${percent}%" >> "$OUTPUT_FILE"
done

column -t -s $'\t' "$OUTPUT_FILE"