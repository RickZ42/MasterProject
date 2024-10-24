import pandas as pd
import argparse
import os
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
import math

def split_fasta_per_1mbp(fasta_fn, outdir):
    """
    Split an input fasta (e.g. genome assembly with many chromosome-scale contigs) into multiple fasta files.
    For contigs larger than 1Mbp, only output the first 100kb.
    For contigs smaller than 1Mbp, remove anything below 20kb and output the rest.
    """
    if not os.path.exists(outdir):
        os.makedirs(outdir)

    outpaths = []
    limit = 1000000

    for record in SeqIO.parse(fasta_fn, "fasta"):
        seq_len = len(record.seq)
        print(f"Length of {record.id}: {seq_len}bp")

        if seq_len > limit:
            # Handle contigs larger than 1Mbp
            chunk = str(record.seq[:100000])
            chunk_fn = os.path.join(outdir, f"{record.id}_first100k.fasta")
            newrecord = SeqRecord(Seq(chunk), id=f"{record.id}_first100k", description="")
            SeqIO.write(newrecord, chunk_fn, "fasta")
            outpaths.append(chunk_fn)
            print(f"Chunk: {len(chunk)}bp (first 100kbp of contig larger than 1Mbp)")
        else:
            # Handle contigs smaller than 1Mbp
            chunk_fn = os.path.join(outdir, f"{record.id}.fasta")
            SeqIO.write(record, chunk_fn, "fasta")
            outpaths.append(chunk_fn)
            print(f"Contig: {seq_len}bp (kept contig smaller than 1Mbp)")


    print(" ")
    return outpaths

def main():
    parser = argparse.ArgumentParser(description="Split an input fasta file and process contigs based on size.")
    parser.add_argument("input_fasta", help="Path to the input fasta file.")
    parser.add_argument("output_dir", help="Path to the output directory where the split fasta files will be saved.")
    args = parser.parse_args()

    input_fasta = args.input_fasta
    output_dir = args.output_dir

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    split_fasta_per_1mbp(input_fasta, output_dir)

if __name__ == "__main__":
    main()