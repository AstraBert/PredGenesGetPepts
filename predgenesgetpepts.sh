# Usage function
usage() {
    echo "Usage: predgenpepts -i,--infile INFILE -db, --database DATABASE -s,--species SPECIES

    REQUIRED ARGUMENTS:
    -i, --infile: Provide the path to the original fasta file from which to start the phylogenetic analysis
    -db, --database: Provide the path to the database against with blastp will be conducted
	-max, --max_target_seqs: Provide the maximum number of hits you want blast to return (default is 100)
    -s,--species: Provide the identifier of the (expected) species you are calling genes against (needed for Augustus); available species are:
    identifier                               | species
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
    
    Input predgenpepts -h,--help to show this message"
    exit 1
}


infile=""
database=""
species=""
num=""

while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            usage
            ;;
        -i|--infile)
            infile="$2"
            shift 2
            ;;
        -db|--database)
            database="$2"
            shift 2
            ;;
        -s|--species)
            species="$2"
            shift 2
            ;;
        -max|-max_target_seqs)
        	num="$2"
        	shift 2
        	;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    usage
fi


if [ -z "$infile" ] && [ ! "$1" = "-h" ] && [ ! "$1" = "--help" ]; then
    echo "Missing required argument: INFILE"
    usage
fi

if [ -z "$database" ] && [ ! "$1" = "-h" ] && [ ! "$1" = "--help" ]; then
    echo "Missing required argument: DATABASE"
    usage
fi

if [ -z "$species" ] && [ ! "$1" = "-h" ] && [ ! "$1" = "--help" ]; then
    echo "Missing required argument: SPECIES"
    usage
fi

if [ -z "$num" ] && [ ! "$1" = "-h" ] && [ ! "$1" = "--help" ]; then
    num=100
fi

if [ ! -f "$infile" ]
then
    echo "Provided path does not represent an existing file"
else
    flnm=$(basename "$infile")
    no_ext="${flnm%.*}"
    fold_name=$(dirname "$infile")
    folder_name=$(realpath "$fold_name")
    execpath=$(which predgenpepts)
    realexec=$(realpath $execpath)
    execdir=$(dirname $realexec)
    mkdir -p ${folder_name}/genecaesar_results
    augustus --species=$species --gff3=on $infile > ${folder_name}/predgenpepts_results/${no_ext}.gff3
    python3 ${execdir}/readaugustus.py -i ${folder_name}/predgenpepts_results/${no_ext}.gff3 > ${folder_name}/predgenpepts_results/${no_ext}_predtranscript.faa
    blastp -query ${folder_name}/predgenpepts_results/${no_ext}_predtranscript.faa -db $database -out ${folder_name}/predgenpepts_results/${no_ext}_blast.txt -outfmt "6 qseqid sseqid slen qlen pident qcovs length mismatch gapopen qstart qend sstart send evalue bitscore" -max_target_seqs $num
fi
