#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
INPUT_FILE="../notebooks/ids_coords_raw.txt"
OUTPUT_DIR="../notebooks/"

awk -F '[: -]' '{start=$2+20000; end=$5+20000; print $1, start, end}' "$INPUT_FILE" > "${OUTPUT_DIR}coords.txt"

awk -F '[: -]' '{start=$2-20000; end=$5+20000; if (start < 0) start = 0; print $1, start, end}' "$INPUT_FILE" > "${OUTPUT_DIR}coords_adjusted.txt"

sort "${OUTPUT_DIR}coords.txt" | uniq > "${OUTPUT_DIR}coords_uniq.txt"

line_count=$(wc -l < "${OUTPUT_DIR}coords_uniq.txt")
echo "Number of unique coors: $line_count"