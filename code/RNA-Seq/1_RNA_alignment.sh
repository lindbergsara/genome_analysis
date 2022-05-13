#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 04:00:00
#SBATCH -J RNA_alignment
#SBATCH -o 1_RNA_alignment.output
#SBATCH -e 1_RNA_alignment_error.output
#SBATCH --mail-user Sara.Lindberg.9490@student.uu.se
#SBATCH --mail-type=END,FAIL

set -x

module load bioinfo-tools
module load bwa
module load samtools
module list

cd /home/sali9490/genome_analysis/data/databases
bwa index -p assembled_genome_db /home/sali9490/genome_analysis/analyses/PacBio/01_genome_assembly/pacbio_assembly.contigs.fasta

cd /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_BH
bwa mem -t 4 /home/sali9490/genome_analysis/data/databases/assembled_genome_db /home/sali9490/genome_analysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972* | \
samtools sort -@ 4 -o /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_BH/RNA_BH_72_mapped.bam

bwa mem -t 4 /home/sali9490/genome_analysis/data/databases/assembled_genome_db /home/sali9490/genome_analysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973* | \
samtools sort -@ 4 -o /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_BH/RNA_BH_73_mapped.bam

bwa mem -t 4 /home/sali9490/genome_analysis/data/databases/assembled_genome_db /home/sali9490/genome_analysis/data/raw_data/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974* | \
samtools sort -@ 4 -o /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_BH/RNA_BH_74_mapped.bam

cd /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_serum
bwa mem -t 4 /home/sali9490/genome_analysis/data/databases/assembled_genome_db /home/sali9490/genome_analysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969* | \
samtools sort -@ 4 -o /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_serum/RNA_69_serum_mapped.bam

bwa mem -t 4 /home/sali9490/genome_analysis/data/databases/assembled_genome_db /home/sali9490/genome_analysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970* | \
samtools sort -@ 4 -o /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_serum/RNA_70_serum_mapped.bam

bwa mem -t 4 /home/sali9490/genome_analysis/data/databases/assembled_genome_db /home/sali9490/genome_analysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971* | \
samtools sort -@ 4 -o /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_serum/RNA_71_serum_mapped.bam

