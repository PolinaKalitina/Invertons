#!/bin/bash

INPUT_DIR="../"
OUTPUT_DIR="../"
TMP_DIR="${INPUT_DIR}tmp"

mkdir -p "$TMP_DIR"

mafft --auto "${INPUT_DIR}top_genes_proteins.fasta" > "${OUTPUT_DIR}aligned_proteins.fasta"

mmseqs createdb "${INPUT_DIR}top_genes_proteins.fasta" "${TMP_DIR}/proteinsDB"
mmseqs cluster "${TMP_DIR}/proteinsDB" "${TMP_DIR}/clusterDB" "$TMP_DIR" --min-seq-id 0.8 -c 0.8
mmseqs createtsv "${TMP_DIR}/proteinsDB" "${TMP_DIR}/proteinsDB" "${TMP_DIR}/clusterDB" "${OUTPUT_DIR}/clusters.tsv"

mmseqs easy-cluster "${INPUT_DIR}top_genes_proteins.fasta" \
                    "${OUTPUT_DIR}/clusterRes" \
                    "$TMP_DIR" \
                    --min-seq-id 0.5 -c 0.7

awk '$1 != $2' "${OUTPUT_DIR}/clusterRes_cluster.tsv" > "${OUTPUT_DIR}/real_clusters.txt"
awk '{print $2}' "${OUTPUT_DIR}/real_clusters.txt" | sort | uniq -c | sort -nr > "${OUTPUT_DIR}/cluster_frequency.txt"

rm -rf "$TMP_DIR"

ls -lh "${OUTPUT_DIR}/clusters.tsv" "${OUTPUT_DIR}/real_clusters.txt" "${OUTPUT_DIR}/cluster_frequency.txt"

cat "${OUTPUT_DIR}/cluster_frequency.txt"