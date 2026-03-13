paste <(cut -f1 AF.imputed.thin.bim | sort -u) <(seq 1 24) > chrom_map.txt

sed -i \
  -e 's/NC_054824\.1/1/g' \
  -e 's/NC_054825\.1/2/g' \
  -e 's/NC_054826\.1/3/g' \
  -e 's/NC_054827\.1/4/g' \
  -e 's/NC_054828\.1/5/g' \
  -e 's/NC_054829\.1/6/g' \
  -e 's/NC_054830\.1/7/g' \
  -e 's/NC_054831\.1/8/g' \
  -e 's/NC_054832\.1/9/g' \
  -e 's/NC_054833\.1/10/g' \
  -e 's/NC_054834\.1/11/g' \
  -e 's/NC_054835\.1/12/g' \
  -e 's/NC_054836\.1/13/g' \
  -e 's/NC_054837\.1/14/g' \
  -e 's/NC_054838\.1/15/g' \
  -e 's/NC_054839\.1/16/g' \
  -e 's/NC_054840\.1/17/g' \
  -e 's/NC_054841\.1/18/g' \
  -e 's/NC_054842\.1/19/g' \
  -e 's/NC_054843\.1/20/g' \
  -e 's/NC_054844\.1/21/g' \
  -e 's/NC_054845\.1/22/g' \
  -e 's/NC_054846\.1/23/g' \
  -e 's/NC_054847\.1/24/g' \
  AF.imputed.thin.bim > AF.imputed.thin.chr.bim

plink --bfile AF.imputed.thin \
      --update-chr chrom_map.txt \
      --make-bed \
      --allow-extra-chr \
      --out AF.imputed.thin.chr
