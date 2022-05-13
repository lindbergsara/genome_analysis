#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 2:00:00
#SBATCH -J annotation
#SBATCH -o 3_annotation.output
#SBATCH -e 3_annotation_error.output
#SBATCH --mail-user Sara.Lindberg.9490@student.uu.se
#SBATCH --mail-type=END,FAIL

set -x

module load bioinfo-tools
module load prokka
module list

prokka --outdir /home/sali9490/genome_analysis/analyses/PacBio/03_annotation/ --force --prefix E_faecium /home/sali9490/genome_analysis/analyses/PacBio/01_genome_assembly/pacbio_assembly.contigs.fasta
