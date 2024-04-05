#!/bin/bash
#PBS -N buscowholegenome
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

# activate the environment

source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /scratch/xf3/zz3507/envs

# Set the input and output file paths
input_dir="/g/data/xf3/zz3507/Output/assembly30KHifiHicV1/AssembleResultV1fasta"
output_dir="/g/data/xf3/zz3507/Output/assembly30KHifiHicV1/compleasm"

# Set the input file names
input_files=(
  "/g/data/xf3/zz3507/Output/assembly30KHifiHicV1/AssembleResultV1fasta/Ctrap_HiFI_HiC_ONT30KB.hic.p_ctg.fasta"
)

busco_db="Angiospermae_odb10"




# run busco

busco -i "$input_dir/$input_file" -o "$output_file" -l $busco_db -m geno --cpu 24