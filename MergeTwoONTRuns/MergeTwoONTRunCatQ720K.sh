
#!/bin/bash
#PBS -N MergeTwoONTRunQ720K
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

# Set the input file paths
file1="/g/data/xf3/zz3507/Output/chopper_output/Q720K/DoradoSup278simplex.fq_Q720K.fq.gz"
file2="/g/data/xf3/zz3507/Output/chopper_output/Q720K/DoradoSup765simplex.fq_Q720K.fq.gz"

# Set the output file path
output_file="/g/data/xf3/zz3507/Output/chopper_output/Q720K/MergedONTQ720K/mergedONTQ720K.fq.gz"

# Merge the files using zcat and gzip
cat "$file1" "$file2" > "$output_file"

echo "Merging completed. Merged file: $output_file"