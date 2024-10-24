#PBS -P fa63
#PBS -q normal
#PBS -l walltime=48:00:00
#PBS -l ncpus=48
#PBS -l mem=180GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

/g/data/xf3/zz3507/envs/minimap2-2.28_x64-linux/minimap2 -t 48 -ax map-hifi --secondary=no /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/MapHiFiReads/AUG17H1H2Merged.fasta /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz > /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/MapHiFiReads/AUG17H1H2Merged.sam
