#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J trimming
#SBATCH -o 2_trimming.output
#SBATCH -e 2_trimming_error.output
#SBATCH --mail-user Sara.Lindberg.9490@student.uu.se
#SBATCH --mail-type=END,FAIL

set -x

module load bioinfo-tools
module load trimmomatic
module list

trimmomatic PE -threads 4 /home/sali9490/genome_analysis/data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz /home/sali9490/genome_analysis/data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz /home/sali9490/genome_analysis/analyses/Illumina/01_preprocessing/trimming/L500_1_P.fq.gz /home/sali9490/genome_analysis/analyses/Illumina/01_preprocessing/trimming/L500_1_U.fq.gz /home/sali9490/genome_analysis/analyses/Illumina/01_preprocessing/trimming/L500_2_P.fq.gz /home/sali9490/genome_analysis/analyses/Illumina/01_preprocessing/trimming/L500_2_U.fq.gz ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/snowy/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
