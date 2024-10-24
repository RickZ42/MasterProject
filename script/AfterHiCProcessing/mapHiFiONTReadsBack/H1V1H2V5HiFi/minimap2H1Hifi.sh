#PBS -P fa63
#PBS -q normal
#PBS -l walltime=48:00:00
#PBS -l ncpus=48
#PBS -l mem=180GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

/g/data/xf3/zz3507/envs/minimap2-2.28_x64-linux/minimap2 -t 48 -ax map-hifi --secondary=no /g/data/xf3/zz3507/Output/AfterHiCProcessing/AfterJuicerEditing/0708H1V2FinalAndMergedJul9/merged_H1V2.1H2V6.500KJul9.fasta /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz > /g/data/xf3/zz3507/Output/AfterHiCProcessing/minimapHIFIONTreadsBackToScaffolds/H1H2HiFi/H1V2.H2V6.500K.HiFialnJul9.sam
