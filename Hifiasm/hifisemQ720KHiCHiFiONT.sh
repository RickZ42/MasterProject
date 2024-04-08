#!/bin/bash

#PBS -N hifisemQ720KHiCHiFiONT
#PBS -P xf3
#PBS -q normalsr
#PBS -l walltime=48:00:00
#PBS -l ncpus=50
#PBS -l mem=450GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3
#PBS -l wd

# Set up the environment
set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/hifiasm

# HiFiasm
hifiasm --hom-cov 48 -o /g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC -t50 --ul /g/data/xf3/zz3507/Output/chopper_output/Q720K/MergedONTQ720K/mergedONTQ720K.fq.gz --h1 /g/data/xf3/zz3507/Output/TrimedHiC/40769_R1_001_val_1.fq.gz --h2 /g/data/xf3/zz3507/Output/TrimedHiC/40769_R2_001_val_2.fq.gz /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz