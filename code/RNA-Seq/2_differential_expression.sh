#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J differential_expression_serum
#SBATCH -o 2_differential_expression_serum.output
#SBATCH -e 2_differential_expression_error_serum.output
#SBATCH --mail-user Sara.Lindberg.9490@student.uu.se
#SBATCH --mail-type=END,FAIL

set -x

module load bioinfo-tools
module load htseq
module list

htseq-count -f bam -r pos -i ID -s no -t CDS /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_BH/RNA_BH_72_mapped.bam \
/home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_BH/RNA_BH_73_mapped.bam /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_BH/RNA_BH_74_mapped.bam \
/home/sali9490/genome_analysis/analyses/PacBio/03_annotation/E_faecium.gff \
> /home/sali9490/genome_analysis/analyses/RNA-Seq/02_differential_expression/BH_counts  

htseq-count -f bam -r pos -i ID -s no -t CDS /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_serum/RNA_69_serum_mapped.bam \
/home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_serum/RNA_70_serum_mapped.bam /home/sali9490/genome_analysis/analyses/RNA-Seq/01_RNA_alignment_serum/RNA_71_serum_mapped.bam \
/home/sali9490/genome_analysis/analyses/PacBio/03_annotation/E_faecium.gff \
> /home/sali9490/genome_analysis/analyses/RNA-Seq/02_differential_expression/serum_counts
