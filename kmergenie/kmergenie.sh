#!/bin/bash

#PBS -N kmergenie
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=2:00:00
#PBS -l ncpus=32
#PBS -l mem=128GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2


set -xue

# path to kmergenie file
kmergenie_PATH="/g/data/xf3/zz3507/envs/kmergenie-1.7051/kmergenie"

$kmergenie_PATH /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz --diploid -o /g/data/xf3/zz3507/script/kmergenie

