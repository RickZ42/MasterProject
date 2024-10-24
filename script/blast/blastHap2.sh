#!/bin/bash

#PBS -N blasthap2
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=18:00:00
#PBS -l ncpus=22
#PBS -l mem=100GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate snakemake

cd /g/data/xf3/zz3507/envs/snake
snakemake --use-conda -c22 --keep-going