#/bin/bash

export LC_ALL="C"
#parallel pdftotext {} ::: *pdf
cat *txt | python wordCount.py | cut -d',' -f1 | sort | uniq -c | awk '{print $2,$1}' | sort -k2n |  tr ' ' ',' > wordCount.csv
Rscript wordCloud.R


