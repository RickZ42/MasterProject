#PBS -N minimaph2ONT
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=48:00:00
#PBS -l ncpus=40
#PBS -l mem=160GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd
#PBS -m abe

/g/data/xf3/zz3507/envs/minimap2-2.28_x64-linux/minimap2 -t 40 -ax map-ont /g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/fasta/assemblyQ720KOntHifiHiC.hic.hap2.p_ctg.fasta /g/data/xf3/zz3507/Output/chopper_output/Q720K/MergedONTQ720K/mergedONTQ720K.fq.gz > /g/data/xf3/zz3507/Output/minimap/H2ONTaln.sam

