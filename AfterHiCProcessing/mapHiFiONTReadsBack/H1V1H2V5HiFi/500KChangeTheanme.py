import argparse
import os
from Bio import SeqIO
from datetime import datetime

def add_prefix_to_contigs(input_fasta, output_fasta, prefix="H1"):
    """
    Add a specified prefix to each contig name in the input fasta file
    and write the updated contigs to the output fasta file.
    """
    with open(output_fasta, "w") as output_handle:
        for record in SeqIO.parse(input_fasta, "fasta"):
            record.id = f"{prefix}_{record.id}"
            record.description = f"{prefix}_{record.description}"
            SeqIO.write(record, output_handle, "fasta")

def remove_small_contigs(input_fasta, output_fasta, min_length=50000):
    """
    Remove contigs smaller than the specified min_length (default: 50kb) from the input fasta file
    and write the remaining contigs to the output fasta file.
    """
    kept_contigs = []
    removed_contigs = []

    with open(output_fasta, "w") as output_handle:
        for record in SeqIO.parse(input_fasta, "fasta"):
            seq_len = len(record.seq)
            if seq_len >= min_length:
                SeqIO.write(record, output_handle, "fasta")
                kept_contigs.append((record.id, seq_len))
            else:
                removed_contigs.append((record.id, seq_len))

    return kept_contigs, removed_contigs

def generate_summary(kept_contigs, removed_contigs, log_file):
    total_kept = len(kept_contigs)
    total_removed = len(removed_contigs)
    total_contigs = total_kept + total_removed

    summary = f"Contig Filtering Summary\n"
    summary += f"-------------------------\n"
    summary += f"Total contigs: {total_contigs}\n"
    summary += f"Kept contigs: {total_kept}\n"
    summary += f"Removed contigs: {total_removed}\n\n"

    summary += f"Kept Contigs:\n"
    for contig_id, length in kept_contigs:
        summary += f"{contig_id}: {length}bp\n"

    summary += f"\nRemoved Contigs:\n"
    for contig_id, length in removed_contigs:
        summary += f"{contig_id}: {length}bp\n"

    with open(log_file, "w") as log_handle:
        log_handle.write(summary)

    print(summary)

def main():
    parser = argparse.ArgumentParser(description="Remove contigs smaller than a specified length from a fasta file and add a prefix to contig names.")
    parser.add_argument("input_fasta", help="Path to the input fasta file.")
    parser.add_argument("output_fasta", help="Path to the output fasta file.")
    parser.add_argument("--min_length", type=int, default=50000, help="Minimum length of contigs to keep (default: 50000).")
    parser.add_argument("--a500dd_prefix", action="store_true", help="Add a prefix to each contig name.")
    parser.add_argument("--prefix", type=str, default="H1", help="Prefix to add to each contig name (default: H1).")
    args = parser.parse_args()

    input_fasta = args.input_fasta
    output_fasta = args.output_fasta
    min_length = args.min_length

    # Create the output directory if it doesn't exist
    output_dir = os.path.dirname(output_fasta)
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    if args.add_prefix:
        temp_fasta = f"temp_{os.path.basename(input_fasta)}"
        add_prefix_to_contigs(input_fasta, temp_fasta, args.prefix)
        kept_contigs, removed_contigs = remove_small_contigs(temp_fasta, output_fasta, min_length)
        os.remove(temp_fasta)
    else:
        kept_contigs, removed_contigs = remove_small_contigs(input_fasta, output_fasta, min_length)

    # Generate summary and save to log file
    log_file = f"contig_filtering_summary_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
    generate_summary(kept_contigs, removed_contigs, log_file)

if __name__ == "__main__":
    main()