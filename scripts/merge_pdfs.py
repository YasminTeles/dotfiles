#!/usr/bin/env python3
#
# Description: Merges multiple PDF files into a single file.
#
# Usage:
#   ./merge_pdfs.py output.pdf input1.pdf input2.pdf ...
#
# Dependencies:
#   pip install pypdf
#

import sys
from pypdf import PdfMerger

def main():
    """
    Merges a list of PDF files into a single PDF file.
    The list of PDF files is passed as command-line arguments.
    """
    if len(sys.argv) < 3:
        print("Usage: {} <output_file.pdf> <input_file1.pdf> [input_file2.pdf ...]".format(sys.argv[0]))
        sys.exit(1)

    output_filename = sys.argv[1]
    input_files = sys.argv[2:]

    merger = PdfMerger()

    for pdf in input_files:
        try:
            merger.append(pdf)
        except FileNotFoundError:
            print(f"Error: Input file not found at '{pdf}'")
            sys.exit(1)

    try:
        merger.write(output_filename)
        print(f"Successfully merged {len(input_files)} PDF(s) into '{output_filename}'")
    except Exception as e:
        print(f"An error occurred while writing the output file: {e}")
        sys.exit(1)
    finally:
        merger.close()

if __name__ == "__main__":
    main()