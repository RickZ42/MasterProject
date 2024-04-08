#!/bin/bash

#PBS -N bam2fastqDuplex
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=48:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd




# activate the conda environment


set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/samtools

# directory bam files are located

bam_dir="/g/data/xf3/zz3507/Output/ExtractedONT/duplex"



# directory to save fastq files

fastq_dir="/g/data/xf3/rick/Output/fastqduplex"



# create fastq directory if it doesn't exist

mkdir -p $fastq_dir



# array of bam files

bam_files=("DoradoSup278Duplex_dx:1_only.bam"

           "DoradoSup765Duplex_dx:1_only.bam"
)



# loop through the bam files and convert them to fastq

for bam_file in "${bam_files[@]}"

do

   # construct the fastq file name

   fastq_file="${fastq_dir}/$(basename "${bam_file}" .bam).fq.gz"



   # convert bam to fastq

   samtools fastq "${bam_dir}/${bam_file}" | gzip > "${fastq_file}"



done