#!/bin/bash

#PBS -N hifiasm_haplotype_assembly
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=20:00:00
#PBS -l ncpus=32
#PBS -l mem=196GB
#PBS -l jobfs=200GB
#PBS -l storage=scratch/xf3+gdata/xf3

# Set up the environment
set -xue
source /g/data/ /miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/hifiasm

# Set the input and output file names
HiFi_READS="/g/data/xf3/rick/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz"
H1_READS="/g/data/xf3/rick/RawData/ctrapeziformis_hic/original/40769_R1_001.fastq.gz"
H2_READS="/g/data/xf3/rick/RawData/ctrapeziformis_hic/original/40769_R2_001.fastq.gz"
OUTPUT_PREFIX="/g/data/xf3/rick/Output/Hifi&HiC.asm"

# Run Hifiasm for haplotype-resolved assembly
hifiasm -o ${OUTPUT_PREFIX} -t32 --h1 ${H1_READS} --h2 ${H2_READS} ${HiFi_READS}

sleep infinity