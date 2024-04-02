#!/bin/bash

#PBS -N dorado_basecalling_278
#PBS -P xf3
#PBS -q gpuvolta
#PBS -l walltime=48:00:00
#PBS -l ngpus=4
#PBS -l ncpus=48
#PBS -l mem=192GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

set -xue
# path to dorado binary file
DORADO_PATH="/g/data/xf3/zz3507/envs/dorado-0.5.3-linux-x64/bin/dorado"


# Set the input directories
INPUT_DIRS=(
    "/g/data/xe2/datasets/uploads_public/ctrap_ont_pod5/20231017_1728_1F_PAQ09278_af45b1bf/pod5_pass/"
    "/g/data/xe2/datasets/uploads_public/ctrap_ont_pod5/20231023_1117_1F_PAQ09278_674d2cfd/pod5_pass/"
)

# Set the output file
OUTPUT_FILE="/g/data/xf3/zz3507/Output/DoradoSup278DuplexMar28.bam"


# Iterate over each path
for DIRS in "${INPUT_DIRS[@]}"; do

"${DORADO_PATH}" duplex /g/data/xf3/zz3507/script/basecalling/DoradoModel/dna_r10.4.1_e8.2_400bps_sup@v4.3.0 "${DIRS}" >> "${OUTPUT_FILE}"

done

# Keep the job running indefinitely (optional)
# sleep infinity