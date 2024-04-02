#!/bin/bash

#PBS -N HifisemQ730KNoHiC
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=48:00:00
#PBS -l ncpus=96
#PBS -l mem=384GB
#PBS -l jobfs=800GB
#PBS -l storage=scratch/xf3+gdata/xf3
#PBS -l wd

# Set up the environment
set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/hifiasm

# HiFiasm
hifiasm -o /g/data/xf3/zz3507/Output/assemblyQ710KNoHiC -t96 --ul /g/data/xf3/zz3507/Output/chopper_output/Q710K/MergedONT/mergedONTQ710Kcat.fq.gz /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz