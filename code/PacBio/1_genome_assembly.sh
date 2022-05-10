#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J genome_assembly
#SBATCH -o genome_assembly.output
#SBATCH -e genome_assembly_error.output
#SBATCH --mail-user Sara.Lindberg.9490@student.uu.se
#SBATCH --mail-type=END,FAIL

set -x

module load bioinfo-tools
module load canu
module list

canu -d /home/sali9490/genome_analysis/analyses/PacBio/01_genome_assembly -p pacbio_assembly genomeSize=3m useGrid=false -pacbio /home/sali9490/genome_analysis/data/raw_data/genomics_data/PacBio/*
