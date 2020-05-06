#!/usr/bin/bash
#SBATCH --partition=ficklin_class
#SBATCH --account=ficklin_class
#SBATCH --job-name=swissprot_blastp
#SBATCH --output=results2
#SBATCH --error=results2.err
#SBATCH --time=0-24:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=5
#SBATCH --mail-type=ALL
#SBATCH --mail-user=richard.houghton@wsu.edu

module add blast
module add java nextflow

nextflow run test2.nf -profile slurm

