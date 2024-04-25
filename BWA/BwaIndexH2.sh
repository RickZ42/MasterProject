#!/bin/bash
#PBS -N Bwah2
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

set -xue


/g/data/xf3/zz3507/envs/BWA/bwa/bwa index /g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/assemblyQ720KOntHifiHiCBiggerThan50KContig/assemblyQ720KOntHifiHiCBigger50Kcontig.hic.hap2_ctg.fasta


