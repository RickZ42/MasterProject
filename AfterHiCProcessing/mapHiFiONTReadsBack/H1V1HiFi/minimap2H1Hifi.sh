#PBS -P fa63
#PBS -q normalsr
#PBS -l walltime=24:00:00
#PBS -l ncpus=60
#PBS -l mem=240GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

/g/data/xf3/zz3507/envs/minimap2-2.28_x64-linux/minimap2 -t 60 -ax map-hifi /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1reference/yahsMarkedPCRRNocorrection/yahsMarkedPCRNocorrection50KH1.fa /g/data/xf3/zz3507/RawData/ctrapeziformis_hifi_PacBio_Revio/hifi_reads/ctrapeziformis.fastq.gz > /g/data/xf3/zz3507/Output/AfterHiCProcessing/minimapHIFIONTreadsBackToScaffolds/H1V1HiFi/H1V1HiFialn.sam
