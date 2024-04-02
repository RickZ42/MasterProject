#!/bin/bash


#21-3-24 (DD-MM-YY)

#To trim Illumina paired end reads of adapter sequences and specified length and quality

#trim_galore --version
#v0.6.10

#PBS -N dorado_basecalling_job
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=4:00:00
#PBS -l ncpus=24
#PBS -l mem=64GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

set -xue
export JAVA_HOME="/home/106/zz3507/softwere/trimgalore"
export JAVA_LD_LIBRARY_PATH="/home/106/zz3507/softwere/trimgalore/lib"
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /home/106/zz3507/softwere/trimgalore

#Settings#
##########
in_r1=/g/data/xf3/rick/RawData/ctrapeziformis_hic/original/40769_R1_001.fastq.gz
in_r2=/g/data/xf3/rick/RawData/ctrapeziformis_hic/original/40769_R2_001.fastq.gz
out=/g/data/xf3/rick/Output/TrimedHiC
##########


trim_galore --cores 24 --quality 30 --length 100 --paired --fastqc --output_dir $out $in_r1 $in_r2

