#!/bin/bash

#PBS -N Hifisem
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=48:00:00
#PBS -l ncpus=144
#PBS -l mem=576GB
#PBS -l jobfs=800GB
#PBS -l storage=scratch/xf3+gdata/xf3
#PBS -l wd

# Set up the environment
set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/hifiasm

# HiFiasm
hifiasm --hom-cov 48 -o /g/data/xf3/zz3507/Output/assembly30KOntHifiHic -t144 --ul /g/data/xf3/zz3507/Output/chopper_output/30K/MergedONT/mergedONT30K.fq.gz --h1 /g/data/xf3/zz3507/Output/TrimedHiC/40769_R1_001_val_1.fq.gz --h2 /g/data/xf3/zz3507/Output/TrimedHiC/40769_R2_001_val_2.fq.gz /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz