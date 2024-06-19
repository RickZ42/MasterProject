#PBS -P fa63
#PBS -q normalsr
#PBS -l walltime=24:00:00
#PBS -l ncpus=100
#PBS -l mem=320GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

/g/data/xf3/zz3507/envs/minimap2-2.28_x64-linux/minimap2 -t 100 -ax map-hifi --secondary=no /g/data/xf3/zz3507/Output/AfterHiCProcessing/AfterJuicerEditing/0604H1V1.1.500K/merged_H1V1.1H2V6.500K.fasta /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz > /g/data/xf3/zz3507/Output/AfterHiCProcessing/minimapHIFIONTreadsBackToScaffolds/H1H2HiFi/H1V1.1H2V6.500K.HiFialn.sam
