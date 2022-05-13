#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 4:00:00
#SBATCH -J homology_search
#SBATCH -o 4_homology_search.output
#SBATCH -e 4_homology_search_error.output
#SBATCH --mail-user Sara.Lindberg.9490@student.uu.se
#SBATCH --mail-type=END,FAIL

set -x

module load bioinfo-tools
module load blast
module list

gzip -d /home/sali9490/genome_analysis/data/raw_data/reference_genome/GCF_009734005.1_ASM973400v2_genomic.fna.gz
makeblastdb -in /home/sali9490/genome_analysis/data/raw_data/reference_genome/GCF_009734005.1_ASM973400v2_genomic.fna -out /home/sali9490/genome_analysis/data/raw_data/reference_genome/e_faecium_db -dbtype nucl

blastn -db /home/sali9490/genome_analysis/data/raw_data/reference_genome/e_faecium_db -num_threads 4 -query /home/sali9490/genome_analysis/analyses/PacBio/01_genome_assembly/pacbio_assembly.contigs.fasta -out /home/sali9490/genome_analysis/analyses/PacBio/blast_e_faecium
