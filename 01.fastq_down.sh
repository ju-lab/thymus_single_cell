#!/bin/bash

# Download thymus single cell rna sequencing data, published in 2015, nature immunology, Brennecke et al.
# from EBI https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-3346/files/ 
# and https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-3624/
# ftp url tables were downloaded before this script run. (*.sdrf.txt)

#PBS -q long
#PBS -N Downld_Thymus_SC
#PBS -e /dev/null
#PBS -o /dev/null
#PBS -l nodes=bnode8:ppn=1
cd /home/users/team_projects/thymus_single_cell/Brennecke_2015
mkdir -p fastq/3346
mkdir -p fastq/3624
mkdir log
awk '{ print $48 } ' E-MTAB-3346/E-MTAB-3346.sdrf.txt  | grep ftp:// | wget -i - -q -p ./fastq/ 2> log/download.log
awk '{ print $48 } ' E-MTAB-3624/E-MTAB-3624.sdrf.txt  | grep ftp:// | wget -i - -q -p ./fastq/ 2>> log/download.log

