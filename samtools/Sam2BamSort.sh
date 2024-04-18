#!/bin/bash

#PBS -N Sam2BamSort
#PBS -l ncpus=32
#PBS -l mem=128GB
#PBS -l jobfs=1GB
#PBS -q normal
#PBS -P xf3
#PBS -l walltime=48:00:00
#PBS -l storage=gdata/xf3+scratch/xf3
#PBS -l wd
#PBS -m abe

set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/samtools


# Set the input SAM files
SAM_FILE1="/g/data/xf3/zz3507/Output/minimap/H1HiFialn.sam"
SAM_FILE2="/g/data/xf3/zz3507/Output/minimap/H2HiFialn.sam"

# Set the output BAM file names
BAM_FILE1="/g/data/xf3/zz3507/Output/minimap/H1HiFialn.bam"
BAM_FILE2="/g/data/xf3/zz3507/Output/minimap/H2HiFialn.bam"

# Convert SAM to BAM using samtools
samtools view -b -@32 $SAM_FILE1 -o $BAM_FILE1
samtools view -b -@32 $SAM_FILE2 -o $BAM_FILE2

# Sort the BAM files
samtools sort -@32 $BAM_FILE1 -o ${BAM_FILE1%.bam}_sorted.bam
samtools sort -@32 $BAM_FILE2 -o ${BAM_FILE2%.bam}_sorted.bam

# Index the sorted BAM files
samtools index -@32 ${BAM_FILE1%.bam}_sorted.bam
samtools index -@32 ${BAM_FILE2%.bam}_sorted.bam

