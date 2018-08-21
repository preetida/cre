#!/bin/bash

#PBS -l walltime=23:00:00,nodes=1:ppn=1
#PBS -joe .
#PBS -d .
#PBS -l vmem=10g,mem=10g

vcfanno -p 7 -lua /home/naumenko/cre/cre.vcfanno.lua \
	     -base-path /hpf/largeprojects/ccmbio/naumenko/tools/bcbio/gemini_data \
	     /home/naumenko/cre/cre.vcfanno.conf \
	     $vcf | sed -e 's/Number=A/Number=1/g' | bgzip -c > `echo $vcf | sed s/vcf/annotated.vcf/`
