#!/bin/bash

#PBS -N compleasmhap1
#PBS -P xf3
#PBS -q express
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/compleasm


input_file="/g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V2H2V6ReferenceFinal20240711/H1reference/0708H1V2FastaJul9/H1V2Jul8Reference.FINAL.500K.22scaffold.fa"
output_dir="/g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V2H2V6ReferenceFinal20240711/H1reference/compleasm/"
lineage_dir="/g/data/xf3/zz3507/script/compleasm/lineage"
threads=24
mkdir $output_dir
compleasm run -a "$input_file" -o "$output_dir" -l embryophyta_odb10 -t "$threads" -L "$lineage_dir"