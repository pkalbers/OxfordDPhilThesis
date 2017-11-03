#!/bin/bash

# texcount.pl downloaded from
# http://app.uio.no/ifi/texcount/index.html

# latexcount.pl downloaded from
# https://www.ctan.org/tex-archive/support/latexcount

./texcount.pl -merge -nobib -brief main.tex


count=0

for CH in `seq 1 6`
do
	cd chapter${CH}
	FILE=`ls *.tex`
	total=`../latexcount.pl $FILE | grep words | cut -d' ' -f 1`
	count=$(($count + $total))
	echo "${total} in ${FILE}"
	cd ..
done

echo $count

