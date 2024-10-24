#PBS -P fa63
#PBS -q normalsr
#PBS -l walltime=24:00:00
#PBS -l ncpus=60
#PBS -l mem=240GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

/g/data/xf3/zz3507/envs/minimap2-2.28_x64-linux/minimap2 -t 60 -ax map-hifi /g/data/xf3/zz3507/Output/AfterHiCProcessing/AfterJuicerEditing/0603V6/h2/out_JBATH2.FINAL.fa /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz > /g/data/xf3/zz3507/Output/AfterHiCProcessing/minimapHIFIONTreadsBackToScaffolds/H2V6HiFi/H2V6HiFialn.sam
