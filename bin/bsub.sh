#!/bin/bash

bsub -u idas@genome.wustl.edu -N -oo f60b23fdb26c45f486cf2d5937a7502b-snv-%J.out ./calculate-build-filter-ratios.pl f60b23fdb26c45f486cf2d5937a7502b /gscmnt/gc2801/analytics/tabbott/sv/na12878/slides/results/f60b23fdb26c45f486cf2d5937a7502b/build/variants/snvs.vcf.gz 100
