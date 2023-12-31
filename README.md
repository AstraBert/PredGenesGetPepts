# PredGenesGetPepts
PredGenesGetPepts is an easy-to-use, beginner-friendly pipeline to call genes from fasta files, retrieve peptides from it and blasting them against a given protein database

## General information and applicability
PredGenesGetPepts was designed as a gene-calling and peptide identification tool: a fasta file containing the to-be-investigated genetic region(s), a protein database and a taxonomic unit (at least orientative) are thus needed for the analysis. 

For the gene-calling portion, PredGenesGetPepts is based on Augustus (version 3.4.0): this comes with the advantages of its easy-to-read output and quickness, but puts also a limitation on the applicability of the pipeline, as Augustus can identify genes from a limited number of species (see **Supported species** for more).

Gene calling output is a gff3 file, which is placed within the same folder of the original fasta file, located in a specifically generated directory named `predgengetpepts_results`.
After that, the python script `readaugustus.py` reads the gff3 output from Augustus and extract the protein sequence(s): after that, it prints them to a .faa file placed within the `predgengetpepts_results` folder.
The last step involves BLASTing, which is performed against the user-specified database: it returns a txt file that encompasses results from BLAST in tabular format.

## Installation

The basic requirment for this installation is to have [Mamba](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html) and [Conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html) up and running on your Linux machine. If you don't match this pre-requisite, consider downloading them from the dedicated pages.

To install PredGenesGetPepts, first of all run:
```bash
git init
git clone https://github.com/AstraBert/PredGenesGetPepts
```

Secondly, run :
```bash
cd PredGenesGetPepts
bash setup.sh
```

Everything should now be set up and ready to run, test the installation by executing:
```bash
source ~/.bash_aliases
pregegepep -h
```

Alternatively, you can download the code from the Realeases page: 
- Download the PredGenesGetPepts.tar.gz archive file
- Move to the directory were you stored the downloaded file
- Run:
```bash
tar -xzvf ./PredGenesGetPepts.tar.gz
```
- You will now have the complete directory; run:
```bash
cd PredGenesGetPepts
bash setup.sh
source ~/.bash_aliases
pregegepep -h
```

## Options and testing
You will have to use the following options to correctly exploit PredGenGetPepts:

```bash
Usage: pregegepep -i,--infile INFILE -db, --database DATABASE -s,--species SPECIES

REQUIRED ARGUMENTS:
-i, --infile: Provide the path to the original fasta file from which to start the phylogenetic analysis
-db, --database: Provide the path to the database against with blastp will be conducted
-s,--species: Provide the identifier of the (expected) species you are calling genes against (needed for Augustus)
OPTIONAL ARGUMENTS:
-max, --max_target_seqs: Provide the maximum number of hits you want blast to return (default is 100)

Input pregegepep -h,--help to show this message
```

To test the program, execute the following code (that assumes you have already moved to the PredGenGetPepts directory):

```bash
conda activate ./environments/predgenesgetpepts
cd ./test
makeblastdb -in ./proteins.faa -out ./proteinsDB -dbtype prot
conda deactivate
pregegepep -i ./test.fasta -db ./proteinsDB -s human -max 5
```

You will get the same results you can find in `predgengetpepts_results_test` folder.

## Supported species
Up to the employed version of Augustus, there are 108 species that can be gene-called, which are the following:

Identifier                               | Species
-----------------------------------------|----------------------
pea_aphid                                | Acyrthosiphon pisum
aedes                                    | Aedes aegypti
amphimedon                               | Amphimedon queenslandica
ancylostoma_ceylanicum                   | Ancylostoma ceylanicum
adorsata                                 | Apis dorsata
honeybee1                                | Apis mellifera
arabidopsis                              | Arabidopsis thaliana
aspergillus_fumigatus                    | Aspergillus fumigatus
aspergillus_nidulans                     | Aspergillus nidulans
(anidulans)                              | Aspergillus nidulans
aspergillus_oryzae                       | Aspergillus oryzae
aspergillus_terreus                      | Aspergillus terreus
bombus_impatiens1                        | Bombus impatiens
bombus_terrestris2                       | Bombus terrestris
botrytis_cinerea                         | Botrytis cinerea
brugia                                   | Brugia malayi
b_pseudomallei                           | Burkholderia pseudomallei
caenorhabditis                           | Caenorhabditis elegans
(c_elegans_trsk)                         | Caenorhabditis elegans
(elegans)                                | Caenorhabditis elegans
elephant_shark                           | Callorhinchus milii
camponotus_floridanus                    | Camponotus floridanus
candida_albicans                         | Candida albicans
candida_guilliermondii                   | Candida guilliermondii
candida_tropicalis                       | Candida tropicalis
chaetomium_globosum                      | Chaetomium globosum
chiloscyllium                            | Chiloscyllium punctatum
chlamy2011                               | Chlamydomonas reinhardtii
(chlamydomonas)                          | Chlamydomonas reinhardtii
chlorella                                | Chlorella sp.
ciona                                    | Ciona intestinalis
coccidioides_immitis                     | Coccidioides immitis
coccidioides_immitis                     | Coccidioides immitis
Conidiobolus_coronatus                   | Conidiobolus coronatus
coprinus_cinereus                        | Coprinus cinereus
coprinus_cinereus                        | Coprinus cinereus
(coprinus)                               | Coprinus cinereus
coprinus                                 | Coprinus cinereus
cryptococcus_neoformans_gattii           | Cryptococcus neoformans gattii
cryptococcus_neoformans_neoformans_B     | Cryptococcus neoformans neoformans
(cryptococcus)                           | Cryptococcus neoformans
culex                                    | Culex pipiens
zebrafish                                | Danio rerio
debaryomyces_hansenii                    | Debaryomyces hansenii
fly                                      | Drosophila melanogaster
(fly_exp)                                | Drosophila melanogaster
encephalitozoon_cuniculi_GB              | Encephalitozoon cuniculi
eremothecium_gossypii                    | Eremothecium gossypii
E_coli_K12                               | Escherichia coli K12
fusarium_graminearum                     | Fusarium graminearium
(fusarium)                               | Fusarium graminearium
galdieria                                | Galdieria sulphuraria
chicken                                  | Gallus gallus domesticus
heliconius_melpomene1                    | Heliconius melpomene
histoplasma_capsulatum                   | Histoplasma capsulatum
(histoplasma)                            | Histoplasma capsulatum
human                                    | Homo sapiens
kluyveromyces_lactis                     | Kluyveromyces lactis
laccaria_bicolor                         | Laccaria bicolor
leishmania_tarentolae                    | Leishmania tarentolae
japaneselamprey                          | Lethenteron camtschaticum
lodderomyces_elongisporus                | Lodderomyces elongisporus
magnaporthe_grisea                       | Magnaporthe grisea
mnemiopsis_leidyi                        | Mnemiopsis leidyi
nasonia                                  | Nasonia vitripennis
nematostella_vectensis                   | Nematostella vectensis
neurospora_crassa                        | Neurospora crassa
(neurospora)                             | Neurospora crassa
coyote_tobacco                           | Nicotiana attenuata
rice                                     | Oryza sativa
parasteatoda                             | Parasteatoda sp.
sealamprey                               | Petromyzon marinus
phanerochaete_chrysosporium              | Phanerochaete chrysosporium
(pchrysosporium)                         | Phanerochaete chrysosporium
pichia_stipitis                          | Pichia stipitis
pisaster                                 | Pisaster ochraceus
pfalciparum                              | Plasmodium falciparum
pneumocystis                             | Pneumocystis jirovecii
rhincodon                                | Rhincodon typus
rhizopus_oryzae                          | Rhizopus oryzae
rhodnius                                 | Rhodnius prolixus
saccharomyces_cerevisiae_rm11-1a_1       | Saccharomyces cerevisiae
saccharomyces_cerevisiae_S288C           | Saccharomyces cerevisiae
(saccharomyces)                          | Saccharomyces cerevisiae
schistosoma                              | Schistosoma mansoni
(schistosoma2)                           | Schistosoma mansoni
schizosaccharomyces_pombe                | Schizosaccharomyces pombe
scyliorhinus                             | Scyliorhinus torazame
tomato                                   | Solanum lycopersicum
s_aureus                                 | Staphylococcus aureus
s_pneumoniae                             | Streptococcus pneumoniae
strongylocentrotus_purpuratus            | Strongylocentrotus purpuratus
sulfolobus_solfataricus                  | Sulfolobus solfataricus
tetrahymena                              | Tetrahymena thermophila
cacao                                    | Theobroma cacao
thermoanaerobacter_tengcongensis         | Thermoanaerobacter tengcongensis
toxoplasma                               | Toxoplasma gondii
tribolium2012                            | Tribolium castaneum
trichinella                              | Trichinella sp.
wheat                                    | Triticum sp.
ustilago_maydis                          | Ustilago maydis
(ustilago)                               | Ustilago maydis
verticillium_albo_atrum1                 | Verticillium albo atrum
verticillium_longisporum1                | Verticillium longisporum
volvox                                   | Volvox sp.
Xipophorus_maculatus                     | Xipophorus maculatus
yarrowia_lipolytica                      | Yarrowia lipolytica
maize                                    | Zea mays
(maize5)                                 | Zea mays

## License and rights of usage
The code is protected by the GNU v.3 license. As the license provider reports: "Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights".

Please note that PredGenGetPepts is still experimental and may contain errors, may fail/take really long while performing large analyses with limited computational power (e.g. on a normal laptop) and may output not-100%-reliable results, so always check them and pull issues whenever you feel it to be the case, we'll be on your back as soon as possible to fix/implement/enhance whatever you suggest!

If you are using PredGenGetPepts for you project, please consider to cite the author of this code (Astra Bertelli) and this GitHub repository.

## References
**augustus**: Oliver Keller, Martin Kollmar, Mario Stanke, Stephan Waack (2011)
A novel hybrid gene prediction method employing protein multiple sequence alignments
Bioinformatics, doi: 10.1093/bioinformatics/btr010

**blast**: Camacho, C., Coulouris, G., Avagyan, V., Ma, N., Papadopoulos, J., Bealer, K., & Madden, T. L. (2009). 
BLAST+: architecture and applications. 
BMC bioinformatics, 10, 421. https://doi.org/10.1186/1471-2105-10-421
