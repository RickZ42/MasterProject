#PBS -N minimaph2HiFi
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=12:00:00
#PBS -l ncpus=30
#PBS -l mem=120GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

/g/data/xf3/zz3507/envs/minimap2-2.28_x64-linux/minimap2 -t 30 -ax map-hifi /g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/fasta/assemblyQ720KOntHifiHiC.hic.hap2.p_ctg.fasta /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz > /g/data/xf3/zz3507/Output/minimap/H2HiFialn.sam
