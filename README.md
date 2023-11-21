# PredGenesGetPepts
PredGenesGetPepts is an easy-to-use, beginner-friendly pipeline to call genes from fasta files, retrieve peptides from it and blasting them against a given protein database

## General information and applicability
PredGenesGetPepts was designed as a gene-calling and peptide identification tool: a fasta file containing the to-be-investigated genetic region(s), a protein database and a taxonomic unit (at least orientative) are thus needed for the analysis. 

For the gene-calling portion, PredGenesGetPepts is based on Augustus (version 3.4.0): this comes with the advantages of its easy-to-read output and quickness, but puts also a limitation on the applicability of the pipeline. Up to the employed version, the species that are part of 

