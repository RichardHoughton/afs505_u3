#!/bin/bash
perl -p -e 's/\t//g' fasta_results.txt | perl -p -e 's/\./\.\t/g' | cut -f 1 | uniq -c | sort -r | awk '{ print $2, $1}' | perl -p -e 's/\./\t/g' > fasta_results_cut.txt
