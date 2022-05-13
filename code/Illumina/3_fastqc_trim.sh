#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J fastqc_trim
#SBATCH -o 3_fastqc_trim.output
#SBATCH -e 3_fastqc_trim_error.output
#SBATCH --mail-user Sara.Lindberg.9490@student.uu.se
#SBATCH --mail-type=END,FAIL

set -x

module load bioinfo-tools
module load FastQC/0.11.9
module list

fastqc -t 4 -o /home/sali9490/genome_analysis/analyses/Illumina/01_preprocessing/fastqc_trim /home/sali9490/genome_analysis/analyses/Illumina/01_preprocessing/trimming/*
