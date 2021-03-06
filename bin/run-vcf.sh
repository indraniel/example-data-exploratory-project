#!/bin/bash

export ANALYSIS_ROOT=/gscmnt/gc13001/info/model_data/BIO-1064
export GOLD_INDELS=$ANALYSIS_ROOT/gold-standard/NISTIntegratedCalls_14datasets_131103_allcall_UGHapMerge_HetHomVarPASS_VQSRv2.18_all_nouncert_excludesimplerep_excludesegdups_excludedecoy_excludeRepSeqSTRs_noCNVs.fixed.header.allelic_primitives.sorted.normalized.resort.indels.vcf.gz
export GOLD_SNVS=$ANALYSIS_ROOT/gold-standard/NISTIntegratedCalls_14datasets_131103_allcall_UGHapMerge_HetHomVarPASS_VQSRv2.18_all_nouncert_excludesimplerep_excludesegdups_excludedecoy_excludeRepSeqSTRs_noCNVs.fixed.header.allelic_primitives.sorted.normalized.resort.snps.vcf.gz
export GOLD_TRUE_NEGATIVES=$ANALYSIS_ROOT/gold-standard/union13callableMQonlymerged_addcert_nouncert_excludesimplerep_excludesegdups_excludedecoy_excludeRepSeqSTRs_noCNVs_v2.18_2mindatasets_5minYesNoRatio.minus_NA12878_nistv2.18.bed.gz
export HIGH_CONFIDENCE_REGIONS=$ANALYSIS_ROOT/gold-standard/union13callableMQonlymerged_addcert_nouncert_excludesimplerep_excludesegdups_excludedecoy_excludeRepSeqSTRs_noCNVs_v2.18_2mindatasets_5minYesNoRatio.bed.gz

perl create_config_from_modelgroup.pl 4ba249ae0b814352baba1c09f5ec2320 > config.txt
perl evaluate_vcfs.pl --config=config.txt --roi $HIGH_CONFIDENCE_REGIONS --gold-snv-vcf $GOLD_SNVS --gold-indel-vcf $GOLD_INDELS --gold-sample NA12878 --true-negative-bed $GOLD_TRUE_NEGATIVES
