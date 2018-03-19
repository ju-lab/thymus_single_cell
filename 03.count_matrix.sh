#!/bin/bash
~/src/star/summary.sh star/*ReadsPerGene.out.tab | transpose > count_matrix.tsv
