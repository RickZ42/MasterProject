#!/bin/bash

#PBS -N blasthap1
#PBS -P xf3
#PBS -q normalsr
#PBS -l walltime=48:00:00
#PBS -l ncpus=50
#PBS -l mem=500GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate snakemake

cd /g/data/xf3/zz3507/envs/snake
snakemake --use-conda -c50 --keep-going