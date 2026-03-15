```bash
# 1. Remove low-quality SNPs and samples
plink --bfile AF.imputed.thin --maf 0.15 --geno 0 --thin 0.25  --make-bed --out arctic_fox

popgenmsc26user21@emily:~/fox_data$ wc -l AF.imputed.thin.bim
816284 AF.imputed.thin.bim
popgenmsc26user21@emily:~/fox_data$ wc -l arctic_fox.bim
58167 arctic_fox.bim
```

```bash
#!/bin/bash

PREFIX="arctic_fox"
SEEDS=(42 157 283 419 567 691 829 973 1103 1249)
SUMMARY_LOG="${PREFIX}_summary.log"

# 创建汇总文件
echo "ADMIXTURE Analysis Summary - $(date)" > ${SUMMARY_LOG}
echo "====================================" >> ${SUMMARY_LOG}
echo "" >> ${SUMMARY_LOG}

for K in {2..7}
do
    echo "Running K=${K}..."
    echo "K=${K} started at $(date)" >> ${SUMMARY_LOG}
    
    for seed in "${SEEDS[@]}"
    do
        # 运行admixture,输出到单独的log
        admixture -s ${seed} ${PREFIX}.bed ${K} > ${PREFIX}_K${K}_seed${seed}.log
        
        # 提取关键信息到汇总文件
        echo "  K=${K}, seed=${seed}:" >> ${SUMMARY_LOG}
        grep "^Loglikelihood:" ${PREFIX}_K${K}_seed${seed}.log >> ${SUMMARY_LOG}
        grep "^CV error" ${PREFIX}_K${K}_seed${seed}.log >> ${SUMMARY_LOG}
        
        # 重命名输出文件
        mv ${PREFIX}.${K}.Q ${PREFIX}_K${K}_seed${seed}.Q
        mv ${PREFIX}.${K}.P ${PREFIX}_K${K}_seed${seed}.P
        
        echo "  Completed seed ${seed}"
    done
    
    echo "" >> ${SUMMARY_LOG}
done

# 添加排序后的结果
echo "" >> ${SUMMARY_LOG}
echo "====================================" >> ${SUMMARY_LOG}
echo "SORTED LOG-LIKELIHOODS BY K VALUE" >> ${SUMMARY_LOG}
echo "====================================" >> ${SUMMARY_LOG}

for K in {2..7}
do
    echo "" >> ${SUMMARY_LOG}
    echo "K=${K} (sorted by likelihood):" >> ${SUMMARY_LOG}
    grep "^Loglikelihood:" ${PREFIX}_K${K}_seed*.log | \
        sed "s/${PREFIX}_K${K}_seed/seed /" | \
        sort -k2 -n -r >> ${SUMMARY_LOG}
done

echo "" >> ${SUMMARY_LOG}
echo "Analysis completed at $(date)" >> ${SUMMARY_LOG}

# 在屏幕上也显示汇总
cat ${SUMMARY_LOG}
```

```bash
for runs in K2_seed1249 K3_seed1249 K4_seed1249 K5_seed1249 K6_seed1249 K7_seed1249; do
    ./evalAdmix \
        -plink arctic_fox \
        -fname arctic_fox_${runs}.P \
        -qname arctic_fox_${runs}.Q \
        -o ${runs}.output.corres.txt
done
```
