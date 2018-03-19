#!/bin/bash
# single cell sequencing data STAR alignment
for i in fastq/*1.fastq.gz; do
	name=`echo $i | sed 's!fastq/!!;s!_1.fastq.gz!!'`
	run_star.sh \
		-s $name \
		--reference `pwd`/mm10/mm10_ercc.fa \
		--star_index `pwd`/mm10/star_index \
		--rsem_ref `pwd`/mm10/rsem_reference \
		--sjdbGTFfile `pwd`/mm10/gencode_spike.gtf \
		$i \
		${i/%1.fastq.gz/2.fastq.gz} \
		--process star
done
