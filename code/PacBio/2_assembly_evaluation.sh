#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J assembly_evaluation
#SBATCH -o 2_assembly_evaluation.output
#SBATCH -e 2_assembly_evaluation_error.output
#SBATCH --mail-user Sara.Lindberg.9490@student.uu.se
#SBATCH --mail-type=END,FAIL

set -x

module load bioinfo-tools
module load quast
module list

quast.py -o /home/sali9490/genome_analysis/analyses/PacBio/02_assembly_evaluation -r /home/sali9490/genome_analysis/data/raw_data/reference_genome/GCF_001720945.1_ASM172094v1_genomic.fna.gz --threads 4 /home/sali9490/genome_analysis/analyses/PacBio/01_genome_assembly/pacbio_assembly.contigs.fasta
