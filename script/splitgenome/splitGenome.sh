#!/bin/bash

#PBS -N SplitGenomeH1
#PBS -P xf3
#PBS -q express
#PBS -l walltime=04:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -m ab

# Change to the directory where your job will run
cd $PBS_O_WORKDIR

# Run the splitgenome.py program
python SplitGenome.py /g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/fasta/assemblyQ720KOntHifiHiC.hic.hap1.p_ctg.fasta /g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/SplitGenome