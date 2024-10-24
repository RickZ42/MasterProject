#!/bin/bash

input_dir="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/Blast/BlastOutput/haplotype1"

# Create an empty results file
result_file="/g/data/xf3/zz3507/script/blast/h1BlastOutputMerged.txt"
touch $result_file

# Iterate through all input files
for file in "$input_dir"/*.blast
do
    # If the file does not exist or is empty, skip
    if [ ! -s "$file" ]; then
        continue
    fi

    # Find the forth row (pident) with the highest value
    highest_fifth_value=$(awk -F'\t' '{print $4}' $file | sort -nr | head -n 1)
    highest_line=$(awk -F'\t' -v highest="$highest_fifth_value" '$4 == highest {print; exit}' $file)



    # Write this line to the result file
    echo "$highest_line" >> $result_file
done

echo "The merge is completed and the result file is: $result_file"