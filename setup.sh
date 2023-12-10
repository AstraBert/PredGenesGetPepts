echo "Installation process started, checking if Anaconda/Miniconda and Mamba are installed..."


command -v conda >/dev/null 2>&1 || {
   echo >&2 "The installation pipeline requires Anaconda/Miniconda but it is not installed. Please check here: https://anaconda.org/ for more details. Aborting."
   exit 1
}


command -v mamba >/dev/null 2>&1 || {
   echo >&2 "The installation pipeline requires Mamba but it is not installed. Please check here: https://github.com/conda-forge/miniforge#mambaforge for more details. Aborting."
   exit 2
}

echo "Anaconda/Miniconda and Mamba are correctly installed, proceeding with the installation of necessary softwares: it may take a while..."

sleep 1

tmp=$(dirname $0)
basedir=$(realpath $tmp)

ConPath=$(which conda)
tmp=${ConPath#* }
Conda=${tmp%%/bin/co*}

## CREATE A NEW FOLDER WHERE TO STORE THE ENVIRONMENT
mkdir -p $basedir/environments

## CREATE A MAMBA/CONDA ENVIRONMENT
mamba create \
  -p $basedir/environments/predgenesgetpepts  \
  -y \
  -c conda-forge \
  -c bioconda \
  python=3.10

## ACTIVATE predgenesgetpepts ENVIRONMENT
source ${Conda}/etc/profile.d/conda.sh
conda activate \
  ${basedir}/environments/predgenesgetpepts

## INSTALL augustus
mamba install \
   -c bioconda \
   -y \
   augustus

## INSTALL blast
mamba install \
   -c bioconda \
   -y \
   blast

## DEACTIVATE
conda deactivate

## MAKE predgenesgetpepts.sh AN EXECUTABLE
ln -s ${basedir}/predgenesgetpepts.sh pregegepep

## MAKE THE CHANGES EFFECTIVE

source ~/.bashrc

## TEST INSTALLATION
conda activate ${basedir}/environments/predgenesgetpepts

bash pregegepep -h

conda deactivate
