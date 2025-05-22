# Invertons as a source of programmed variability in the bacterial immunity systems
## General information

### Aim and objectives

**Aim**: explore the possibility of DNA inversions association with changes in bacterial immunity systems

**Objectives**: 
 - For putative DNA inversions events, confirm the presence of inversions with currently existing approaches;
 - Explore the possibility of DNA inversion in currently unknown defense genes within defense islands;
 - Perform search of recombinases, associated with defense islands in bacteria genomes;
 - Identify and classify events of DNA inversions within defense-related genes;
 - Evaluate functional consequences of DNA inversion for each event.

### Abstract
Bacterial defense systems, such as restriction-modification (RM) and CRISPR-Cas systems, employ diverse strategies to combat phages and mobile genetic elements (MGEs). Phase variation, a stochastic mechanism generating phenotypic heterogeneity, regulates some RM systems by altering DNA methylation specificity via S-subunit shuffling or target recognition domain (TRD) recombination. While invertible DNA sequences (invertons) are known to mediate phase variation in other contexts, their role in defense system regulation remains underexplored.

This study investigates the association between intragenic DNA inversions and bacterial immunity systems. Analyzing 1,601 inversion events across bacterial genomes, we identified only 21 cases overlapping RM system genes (Type I and II), with no evidence of widespread regulatory function. Most inversions (52.6%) led to gene inactivation via premature stop codons, while 31.6% truncated S-subunit TRDs, potentially altering target specificity. Notably, 15.8% of inversions had no discernible functional impact.

Our findings suggest that invertons occur stochastically in RM systems, primarily under neutral selection, rather than serving as a conserved immune regulatory mechanism. The absence of inversion-associated integrases and the lack of clustered domain architectures further support random integration. This work clarifies the limited role of DNA inversions in bacterial immunity and highlights the evolutionary constraints shaping defense system plasticity.

### Results and conclusion

**Results:**
- For putative DNA inversions events, the presence of 21 inversions within defense genes was confirmed with currently existing approaches;
- Clustering of other invertable proteins within defense islands was uninformative;
- Two integrases, associated with invertable defense genes in bacteria genomes were found;
- Inversions occurred only within RM I and RM II systems involving S-subunit genes (66.7%), RM II Type G proteins (14.3%), restrictases (14.3%) and methylases (4.7%);
- There types of inversion events of DNA inversions within defense-related genes were identified: loss of function for 52.6%, change in specificity for 31.6%, no apparent changes for 15.8%. 

**Conclusion:** inversion events within genes of defense systems are likely random and mainly lead to loss of protein function.  

### Data
Data used was composed of full genome sequences assembled from long reads and available though NCBI. Inverton annotation for the genomes was obtained from [Chanin et. al, 2024](https://doi.org/10.1038/s41586-024-07970-4) - table can be found in ```./data/initial_data```. Python script for data aquisition can be found in ```./code/notebooks/Labjournal - general pipeline.ipynb``` in *Data selection and extraction* section.
    
## Repository structure


