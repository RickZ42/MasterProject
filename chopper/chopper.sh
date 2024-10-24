#!/bin/bash
#PBS -N chopper
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

set -xue 
#Chopper_PATH="/g/data/xf3/miniconda/chopper"

source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /scratch/xf3/share/chopper
# Set the input files
input_files=("/g/data/xf3/rick/Output/fastqsimplex/DoradoSup278simplex.fq.gz" "/g/data/xf3/rick/Output/fastqsimplex/DoradoSup765simplex.fq.gz")

# Set the output directory
output_dir="/g/data/xf3/rick/Output/chopper_output"

# Set the minimum read length (in bases)
min_length=1000


# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Run Chopper for each input file
for file in "${input_files[@]}"
do
# Extract the file name from the path
    file_name=$(basename "$file")
    output_file="${output_dir}/${file_name%.*}_30K.fq.gz"
    gunzip -c "$file" | chopper -l "$min_length" --headcrop | gzip > "$output_file" #when you use gunzip, remember to use -c to keep the origional file
done